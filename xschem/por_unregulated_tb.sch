v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {Testbench for simple POR (self-biased version)} -350 -200 0 0 0.6 0.6 {}
N -40 -110 -40 -70 {lab=vdd1v2}
N -380 70 -40 70 {lab=GND}
N -210 -30 -190 -30 {lab=vdd1v2}
N -210 -110 -210 -30 {lab=vdd1v2}
N -210 -110 -40 -110 {lab=vdd1v2}
N -380 -110 -380 -90 {lab=vdd1v2}
N 110 -30 150 -30 {lab=por}
N 110 -10 150 -10 {lab=porb}
N 110 10 150 10 {lab=porb_u}
N -380 -110 -210 -110 {lab=vdd1v2}
N -390 -110 -380 -110 {lab=vdd1v2}
N -380 -30 -380 70 {lab=GND}
C {devices/gnd.sym} -40 70 0 0 {name=l1 lab=GND}
C {devices/vsource.sym} -380 -60 0 0 {name=V1 value="PWL(0.0 0 100u 0 5m 1.2)"}
C {devices/opin.sym} -390 -110 0 1 {name=p1 lab=vdd1v2}
C {devices/opin.sym} 150 10 0 0 {name=p4 lab=porb_u}
C {devices/code_shown.sym} -380 310 0 0 {name=s2 only_toplevel=false value=".save all
.control
tran 1u 60m
plot V(vdd1v2) V(porb_u) V(x1.vref)
plot V(porb_u)+4 V(porb)+2 V(por)
.endc"}
C {code_shown.sym} -380 130 0 0 {name=s1 only_toplevel=false value=".lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerMOShv.lib mos_tt
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerMOSlv.lib mos_tt
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerPNP.lib typ
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerDIO.lib dio_tt
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerRES.lib res_typ
.lib $PDK_ROOT/ihp-sg13cmos5l/libs.tech/ngspice/models/cornerCAP.lib cap_typ

.include $PDK_ROOT/ihp-sg13cmos5l/libs.ref/sg13cmos5l_stdcell/spice/sg13cmos5l_stdcell.spice"}
C {lab_wire.sym} -260 -110 0 0 {name=p3 sig_type=std_logic lab=vdd1v2}
C {devices/opin.sym} 150 -10 0 0 {name=p5 lab=porb}
C {devices/opin.sym} 150 -30 0 0 {name=p6 lab=por}
C {sg13cmos5l_ocd_ip__por.sym} -40 -20 0 0 {name=x1}
