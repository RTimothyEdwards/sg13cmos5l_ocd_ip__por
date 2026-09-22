v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {Schmitt trigger inverter, 1.2V} -110 -210 0 0 0.4 0.4 {}
N -0 50 0 70 {lab=out}
N 0 140 0 160 {lab=n1}
N 0 -50 0 -30 {lab=p1}
N 0 -160 0 -130 {lab=vdd1v2}
N -0 220 0 250 {lab=vss}
N -70 100 -40 100 {lab=in}
N -70 50 -70 100 {lab=in}
N -70 -0 -40 -0 {lab=in}
N -130 50 -70 50 {lab=in}
N 130 50 210 50 {lab=out}
N -70 190 -40 190 {lab=in}
N -70 100 -70 190 {lab=in}
N -70 -100 -70 -0 {lab=in}
N -70 -100 -40 -100 {lab=in}
N 0 140 100 140 {lab=n1}
N 130 50 130 100 {lab=out}
N 130 -10 130 50 {lab=out}
N 0 -50 100 -50 {lab=p1}
N 160 -50 190 -50 {lab=vss}
N 160 140 190 140 {lab=vdd1v2}
N 130 -160 130 -50 {lab=vdd1v2}
N 60 -160 130 -160 {lab=vdd1v2}
N 60 250 130 250 {lab=vss}
N 130 140 130 250 {lab=vss}
N -0 100 60 100 {lab=vss}
N 60 190 60 250 {lab=vss}
N -0 190 60 190 {lab=vss}
N -0 -0 60 -0 {lab=vdd1v2}
N 60 -100 60 -0 {lab=vdd1v2}
N -0 -100 60 -100 {lab=vdd1v2}
N -70 0 -70 50 {lab=in}
N 0 30 -0 50 {lab=out}
N 0 130 0 140 {lab=n1}
N -0 50 130 50 {lab=out}
N -0 -70 0 -50 {lab=p1}
N 0 250 60 250 {lab=vss}
N 60 100 60 190 {lab=vss}
N 0 -160 60 -160 {lab=vdd1v2}
N 60 -160 60 -100 {lab=vdd1v2}
C {lab_pin.sym} 190 140 0 1 {name=p1 sig_type=std_logic lab=vdd1v2}
C {lab_pin.sym} 190 -50 0 1 {name=p2 sig_type=std_logic lab=vss}
C {iopin.sym} 0 -160 0 1 {name=p3 lab=vdd1v2}
C {iopin.sym} 0 250 0 1 {name=p4 lab=vss}
C {ipin.sym} -130 50 0 0 {name=p5 lab=in}
C {opin.sym} 210 50 0 0 {name=p6 lab=out}
C {lab_wire.sym} 40 -50 0 0 {name=p7 sig_type=std_logic lab=p1}
C {lab_wire.sym} 40 140 2 1 {name=p8 sig_type=std_logic lab=n1}
C {sg13cmos5l_pr/sg13_lv_nmos.sym} -20 100 0 0 {name=M7
l=0.13u
w=0.7u
ng=2
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_lv_pmos.sym} -20 -100 0 0 {name=M8
l=0.13u
w=1.4u
ng=4
m=1
mm_ok=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_lv_pmos.sym} -20 0 0 0 {name=M2
l=0.13u
w=0.35u
ng=1
m=1
mm_ok=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_lv_pmos.sym} 130 -30 3 0 {name=M3
l=0.26u
w=1.4u
ng=1
m=1
mm_ok=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_lv_nmos.sym} -20 190 0 0 {name=M1
l=0.13u
w=0.7u
ng=2
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_lv_nmos.sym} 130 120 1 0 {name=M4
l=0.26u
w=2.8u
ng=1
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
