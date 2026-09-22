v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {Testbench for POR schmitt trigger inverter} -370 -370 0 0 0.6 0.6 {}
N 160 -40 200 -40 { lab=out}
N -380 60 40 60 {lab=GND}
N -380 -160 -380 -140 {lab=vdd1v2}
N -380 -80 -380 60 {lab=GND}
N -380 -160 40 -160 {lab=vdd1v2}
N 40 -160 40 -110 {lab=vdd1v2}
N 40 30 40 60 {lab=GND}
N -330 -40 -30 -40 {lab=in}
N -330 -40 -330 -0 {lab=in}
N -390 -160 -380 -160 {lab=vdd1v2}
C {devices/gnd.sym} -40 60 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} -380 -110 0 0 {name=V1 value="PWL(0 0 100u 0 5m 1.2)"}
C {devices/opin.sym} -390 -160 0 1 {name=p1 lab=vdd1v2}
C {devices/opin.sym} 200 -40 0 0 {name=p4 lab=out}
C {devices/code_shown.sym} -380 360 0 0 {name=s2 only_toplevel=false value=".save all
.control
tran 1u 120m
plot V(vdd1v2) V(in) V(out)
.endc"}
C {devices/vsource.sym} -330 30 0 0 {name=V2 value="PWL(0.0 0 60m 1.2 120m 0)"}
C {code_shown.sym} -380 130 0 0 {name=s1 only_toplevel=false value=".lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerMOShv.lib mos_tt
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerMOSlv.lib mos_tt
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerPNP.lib typ
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerDIO.lib dio_tt
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerRES.lib res_typ
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerCAP.lib cap_typ

.include $PDK_ROOT/ihp-sg13cmos5l/libs.ref/sg13cmos5l_stdcell/spice/sg13cmos5l_stdcell.spice"}
C {lab_wire.sym} -260 -40 0 0 {name=p2 sig_type=std_logic lab=in}
C {lab_wire.sym} -260 -160 0 0 {name=p3 sig_type=std_logic lab=vdd1v2}
C {por_1v2_schmitt_inv.sym} 60 -40 0 0 {name=x2}
