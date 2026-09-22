v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {Simple transconductance amp for POR voltage setting.} -50 -180 0 0 0.4 0.4 {}
N 140 -0 140 20 {lab=#net1}
N 320 -10 320 20 {lab=out}
N 280 50 320 50 {lab=vss}
N 140 80 140 100 {lab=nc}
N 230 100 320 100 {lab=nc}
N 320 80 320 100 {lab=nc}
N 60 50 100 50 {lab=inp}
N 140 -120 140 -80 {lab=vdd1v2}
N 140 -120 320 -120 {lab=vdd1v2}
N 320 -120 320 -80 {lab=vdd1v2}
N 230 -50 280 -50 {lab=#net1}
N 320 -10 430 -10 {lab=out}
N 140 -0 230 -0 {lab=#net1}
N 230 -50 230 -0 {lab=#net1}
N 230 100 230 120 {lab=nc}
N 230 180 230 210 {lab=#net2}
N 230 270 230 310 {lab=vss}
N 140 150 190 150 {lab=ena}
N 230 310 280 310 {lab=vss}
N 280 240 280 310 {lab=vss}
N 230 240 280 240 {lab=vss}
N 230 150 280 150 {lab=vss}
N 360 50 430 50 {lab=inn}
N 80 -50 140 -50 {lab=vdd1v2}
N 80 -120 80 -50 {lab=vdd1v2}
N 320 -50 380 -50 {lab=vdd1v2}
N 380 -120 380 -50 {lab=vdd1v2}
N 320 -120 380 -120 {lab=vdd1v2}
N 130 240 190 240 {lab=nbias}
N 100 310 230 310 {lab=vss}
N 80 -120 140 -120 {lab=vdd1v2}
N 630 -90 680 -90 {lab=vdd1v2}
N 680 -120 680 -90 {lab=vdd1v2}
N 630 -60 680 -60 {lab=vdd1v2}
N 680 -90 680 -60 {lab=vdd1v2}
N 570 -90 590 -90 {lab=vdd1v2}
N 570 -120 570 -90 {lab=vdd1v2}
N 570 -120 680 -120 {lab=vdd1v2}
N 620 280 620 300 {lab=vss}
N 580 300 620 300 {lab=vss}
N 580 220 580 300 {lab=vss}
N 580 220 680 220 {lab=vss}
N 680 220 680 250 {lab=vss}
N 620 250 680 250 {lab=vss}
N 780 280 780 300 {lab=vss}
N 740 300 780 300 {lab=vss}
N 740 250 740 300 {lab=vss}
N 780 250 840 250 {lab=vss}
N 840 250 840 300 {lab=vss}
N 780 300 840 300 {lab=vss}
N 780 190 780 220 {lab=nc}
N 320 -20 320 -10 {lab=out}
N 140 -20 140 -0 {lab=#net1}
N 180 -50 230 -50 {lab=#net1}
N 140 100 230 100 {lab=nc}
N 140 50 280 50 {lab=vss}
N 280 150 280 240 {lab=vss}
N 280 50 280 150 {lab=vss}
N 50 -120 80 -120 {lab=vdd1v2}
C {ipin.sym} 140 150 0 0 {name=p1 lab=ena}
C {ipin.sym} 60 50 0 0 {name=p3 lab=inp}
C {ipin.sym} 430 50 0 1 {name=p4 lab=inn}
C {opin.sym} 430 -10 0 0 {name=p2 lab=out}
C {iopin.sym} 50 -120 0 1 {name=p5 lab=vdd1v2}
C {iopin.sym} 100 310 0 1 {name=p6 lab=vss}
C {ipin.sym} 130 240 0 0 {name=p7 lab=nbias}
C {lab_pin.sym} 570 -120 0 0 {name=p8 sig_type=std_logic lab=vdd1v2}
C {lab_pin.sym} 580 300 0 0 {name=p9 sig_type=std_logic lab=vss}
C {lab_pin.sym} 740 300 0 0 {name=p11 sig_type=std_logic lab=vss}
C {lab_pin.sym} 780 190 0 0 {name=p12 sig_type=std_logic lab=nc}
C {lab_pin.sym} 320 100 0 1 {name=p13 sig_type=std_logic lab=nc}
C {sg13cmos5l_pr/sg13_lv_pmos.sym} 610 -90 0 0 {name=M10
l=0.13u
w=1.88u
ng=4
m=1
mm_ok=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_lv_nmos.sym} 600 250 0 0 {name=M11
l=0.13u
w=0.94u
ng=2
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_lv_nmos.sym} 760 250 0 0 {name=M8
l=0.13u
w=0.94u
ng=2
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_lv_pmos.sym} 300 -50 0 0 {name=M1
l=0.13u
w=2.82u
ng=6
m=1
mm_ok=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_lv_pmos.sym} 160 -50 0 1 {name=M2
l=0.13u
w=2.82u
ng=6
m=1
mm_ok=1
model=sg13_lv_pmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_lv_nmos.sym} 210 240 0 0 {name=M3
l=0.13u
w=5.64u
ng=12
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_lv_nmos.sym} 210 150 0 0 {name=M4
l=0.13u
w=5.64u
ng=12
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_lv_nmos.sym} 120 50 0 0 {name=M5
l=0.13u
w=5.64u
ng=12
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
C {sg13cmos5l_pr/sg13_lv_nmos.sym} 340 50 0 1 {name=M6
l=0.13u
w=5.64u
ng=12
m=1
mm_ok=1
model=sg13_lv_nmos
spiceprefix=X
}
