/* Testbench for the power-on reset behavioural model.
 *
 * Self-checking:  every case asserts, failures are counted, and the run
 * ends with a PASS/FAIL summary.
 *
 *	iverilog -g2012 -o por_test_tb.out por_test_tb.v
 *	./por_test_tb.out
 *
 * The cases that matter are the ones an earlier version of the model
 * got wrong, so they are checked explicitly rather than implied:
 *
 *   - por_unbuf follows por, NOT porb.  The model previously called
 *     this pin "porb_u" and inverted it.
 *   - ena gates the amplifier's tail current, so ena low holds the part
 *     in reset indefinitely.  The model previously ignored ena, and
 *     would have released reset on a chip that could never boot.
 *   - reset is asserted at time zero, before anything has been driven.
 *
 * AND the case that matters most for anyone reading the model and
 * assuming more than it promises:  the trickle current is ONE-WAY, so
 * this is a one-shot and NOT a brown-out detector.  Once the Schmitt
 * has tripped, removing power or ena leaves the capacitor charged and
 * the output does not return to reset.  Two separate parts are
 * instantiated below because a part that has tripped cannot be used to
 * test cold-start behaviour again --- which is the whole point.
 */

`timescale 1ns/1ps

`include "sg13cmos5l_ocd_ip__por.v"

module por_test_tb ();

    localparam real DLY = 100.0;	/* short, for a quick test */

    reg ena;
    wire por, porb, por_unbuf;

`ifdef USE_POWER_PINS
    /* The supplies must be DRIVEN here.  An unconnected inout is z, and
     * the model treats anything that is not a solid 1 as "not powered",
     * so leaving these dangling would hold the part in reset and every
     * check below would fail for the wrong reason. */
    wire vdd1v2, vss;
    reg  vdd1v2_r, vss_r;
    assign vdd1v2 = vdd1v2_r;
    assign vss    = vss_r;
`endif

    integer failures = 0;
    integer checks   = 0;

    task check (input [255:0] what, input got, input want);
	begin
	    checks = checks + 1;
	    if (got !== want) begin
		failures = failures + 1;
		$display("  FAIL  %0s: got %b, expected %b", what, got, want);
	    end
	end
    endtask

    /* Check all three outputs at once.  "asserted" means reset active. */
    task check_state (input [255:0] what, input asserted);
	begin
	    check({what, " por"},       por,       asserted);
	    check({what, " porb"},      porb,      ~asserted);
	    check({what, " por_unbuf"}, por_unbuf, asserted);
	end
    endtask

    /* A second, independent part, held unpowered until the cold-start
     * tests at the end.  dut has tripped by then and cannot be re-armed. */
    reg  ena2;
    wire por2, porb2, por_unbuf2;

    task check_state2 (input [255:0] what, input asserted);
	begin
	    check({what, " por2"},       por2,       asserted);
	    check({what, " porb2"},      porb2,      ~asserted);
	    check({what, " por_unbuf2"}, por_unbuf2, asserted);
	end
    endtask

    sg13cmos5l_ocd_ip__por #(.POR_DELAY_NS(DLY)) dut2 (
`ifdef USE_POWER_PINS
	.vdd1v2(vdd1v2),
	.vss(vss),
`endif
	.ena(ena2),
	.por(por2),
	.porb(porb2),
	.por_unbuf(por_unbuf2)
    );

    sg13cmos5l_ocd_ip__por #(.POR_DELAY_NS(DLY)) dut (
`ifdef USE_POWER_PINS
	.vdd1v2(vdd1v2),
	.vss(vss),
`endif
	.ena(ena),
	.por(por),
	.porb(porb),
	.por_unbuf(por_unbuf)
    );

    initial begin
	$dumpfile("por_test_tb.vcd");
	$dumpvars(0, por_test_tb);

	/* Time zero, nothing driven.  ena is x, so the amplifier has no
	 * tail current and the part must already be held in reset --- not
	 * sitting at x, which would poison every flop downstream. */
	#0;
`ifdef USE_POWER_PINS
	/* Nothing driven at all, INCLUDING the supply, so the block is
	 * unpowered rather than merely in reset:  every node at ground.
	 * porb reads 0 either way, which is why it is the output the
	 * chip depends on. */
	$display("t=0: no supply yet, all outputs at ground");
	check("t=0 por",       por,       1'b0);
	check("t=0 porb",      porb,      1'b0);
	check("t=0 por_unbuf", por_unbuf, 1'b0);
`else
	$display("t=0: reset asserted before anything is driven");
	check_state("t=0", 1'b1);
`endif

`ifdef USE_POWER_PINS
	/* Bring the supply up first;  ena is exercised against it below. */
	vss_r = 1'b0;
	vdd1v2_r = 1'b1;
	#1;
`endif

	/* ena unknown:  still held, however long we wait. */
	ena = 1'bx;
	ena2 = 1'b0;
	#(DLY * 3);
	$display("ena=x: amplifier has no tail current, reset stays asserted");
	check_state("ena=x", 1'b1);

	/* ena low:  the mis-tie case.  A real chip would never boot, and
	 * the model must say so rather than releasing on a timer. */
	ena = 1'b0;
	#(DLY * 3);
	$display("ena=0: reset held indefinitely (the mis-tie case)");
	check_state("ena=0", 1'b1);

	/* Power on.  Still asserted just before the delay expires. */
	ena = 1'b1;
	#(DLY * 0.9);
	$display("ena=1: still asserted just before the delay expires");
	check_state("before release", 1'b1);

	#(DLY * 0.2);
	$display("released after the delay");
	check_state("after release", 1'b0);

	/* Polarity:  por_unbuf must track por, not porb.  Checked
	 * explicitly in both states above by check_state, and once more
	 * here against the opposite pin so the intent is unmistakable. */
	check("por_unbuf tracks por",   por_unbuf ~^ por,  1'b1);
	check("por_unbuf differs from porb", por_unbuf ^ porb, 1'b1);

	/* ONE-SHOT.  Removing ena after the trip point must NOT re-assert:
	 * the capacitor is charged and nothing discharges it but leakage.
	 * A model that re-asserted here would be inventing a brown-out
	 * detector the circuit is not. */
	ena = 1'b0;
	#(DLY * 3);
	$display("ena removed after release: output HOLDS, no new reset");
	check_state("ena off after trip", 1'b0);

	/* And restoring it produces no second pulse. */
	ena = 1'b1;
	#(DLY * 3);
	$display("ena restored: still no second pulse");
	check_state("ena back on", 1'b0);

	/* ------------------------------------------------------------
	 * Cold-start cases, on the second part, which has never tripped.
	 * ------------------------------------------------------------ */
	$display("second part: cold start");
	check_state2("dut2 unpowered", 1'b1);

	/* A dip BEFORE the trip point must restart the full delay:  the
	 * cap has not charged, so the next power-up starts from empty. */
	ena2 = 1'b1;
	#(DLY * 0.5);
	ena2 = 1'b0;			/* dip, half way up */
	#1;
	check_state2("dut2 dipped mid-charge", 1'b1);
	ena2 = 1'b1;			/* restored;  full delay again */
	#(DLY * 0.6);
	$display("dip before the trip point restarts the full delay");
	check_state2("dut2 after dip, partial", 1'b1);
	#(DLY * 0.5);
	check_state2("dut2 after dip, complete", 1'b0);

`ifdef USE_POWER_PINS
	/* ------------------------------------------------------------
	 * Supply behaviour.  These are the hooks a replacement POR with
	 * real brown-out detection would be dropped in against;  the
	 * expectations below are what THIS part does, and a brown-out
	 * capable part would deliberately differ on the last one.
	 * ------------------------------------------------------------ */

	/* Unpowered, every node is at ground.  por and porb both read 0,
	 * which is logically impossible and is the signature of a block
	 * with no supply rather than a reset state. */
	vdd1v2_r = 1'b0;
	#1;
	$display("supply removed: all outputs at ground");
	check("unpowered por",       por,       1'b0);
	check("unpowered porb",      porb,      1'b0);
	check("unpowered por_unbuf", por_unbuf, 1'b0);

	/* THE HAZARD, asserted so that it is impossible to forget.  The
	 * capacitor is still charged, so restoring the supply brings the
	 * part straight back up with NO reset pulse.  That is correct for
	 * this POR and is precisely what brown-out detection would fix;
	 * when a replacement arrives, THIS is the check that should flip. */
	vdd1v2_r = 1'b1;
	#1;
	$display("supply restored: NO new reset pulse (no brown-out detection)");
	check_state("after supply blip", 1'b0);
	#(DLY * 2);
	check_state("still no pulse later", 1'b0);
`endif

	$display("");
	if (failures == 0)
	    $display("PASS  %0d checks", checks);
	else
	    $display("FAIL  %0d of %0d checks failed", failures, checks);
	$finish();
    end

endmodule
