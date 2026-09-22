v {xschem version=3.4.6 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
T {POR with 40ms reset delay (self-biased)} -130 -340 0 0 0.5 0.5 {}
N -120 -180 0 -180 {lab=vdd1v2}
N 0 50 0 260 {lab=vss}
N 70 110 70 130 {lab=vfb}
N 800 70 830 70 {lab=vcap}
N 900 140 900 260 {lab=vss}
N 1040 70 1070 70 {lab=por_unbuf}
N 70 190 70 260 {lab=vss}
N 900 -180 900 -0 {lab=vdd1v2}
N 0 -180 0 -90 {lab=vdd1v2}
N 1180 -50 1340 -50 {lab=por}
N 1300 20 1340 20 {lab=porb}
N 1190 20 1220 20 {lab=#net1}
N 1040 20 1110 20 {lab=por_unbuf}
N 1040 20 1040 70 {lab=por_unbuf}
N 1040 -50 1040 20 {lab=por_unbuf}
N 1040 -50 1100 -50 {lab=por_unbuf}
N -120 -180 -120 -160 {lab=vdd1v2}
N -210 -10 -70 -10 {lab=ena}
N -70 30 -70 110 {lab=vfb}
N 70 260 560 260 {lab=vss}
N 140 -20 230 -20 {lab=vpb}
N 70 110 590 110 {lab=vfb}
N 1020 70 1040 70 {lab=por_unbuf}
N -180 -180 -120 -180 {lab=vdd1v2}
N -100 260 0 260 {lab=vss}
N 800 260 900 260 {lab=vss}
N -120 -70 -70 -70 {lab=vref}
N -120 -100 -120 -70 {lab=vref}
N -100 150 -100 180 {lab=vdd1v2}
N 700 70 700 110 {lab=vcap}
N 700 170 700 260 {lab=vss}
N 800 70 800 190 {lab=vcap}
N 800 250 800 260 {lab=vss}
N -210 260 -100 260 {lab=vss}
N -160 -70 -120 -70 {lab=vref}
N 700 260 800 260 {lab=vss}
N 560 -180 900 -180 {lab=vdd1v2}
N 530 -40 560 -40 {lab=vdd1v2}
N 560 -180 560 -40 {lab=vdd1v2}
N 0 -180 560 -180 {lab=vdd1v2}
N 530 60 560 60 {lab=vss}
N 560 60 560 260 {lab=vss}
N 530 -20 680 -20 {lab=vcap}
N 680 -20 680 70 {lab=vcap}
N 700 70 800 70 {lab=vcap}
N 590 -0 590 110 {lab=vfb}
N 530 -0 590 -0 {lab=vfb}
N 30 50 30 90 {lab=#net2}
N 30 90 580 90 {lab=#net2}
N 580 20 580 90 {lab=#net2}
N 530 20 580 20 {lab=#net2}
N 140 70 210 70 {lab=vref}
N 210 -40 210 70 {lab=vref}
N 210 -40 230 -40 {lab=vref}
N -100 240 -100 260 {lab=vss}
N -70 110 70 110 {lab=vfb}
N 0 260 70 260 {lab=vss}
N 680 70 700 70 {lab=vcap}
N 560 260 700 260 {lab=vss}
N 140 -20 140 10 {lab=vpb}
N 100 -20 140 -20 {lab=vpb}
N -210 -10 -210 60 {lab=ena}
N -210 120 -210 260 {lab=vss}
C {por_amp.sym} 10 -20 0 0 {name=x1}
C {por_1v2_schmitt_inv.sym} 920 70 0 0 {name=x2}
C {ipin.sym} -210 -10 0 0 {name=p1 lab=ena}
C {iopin.sym} -180 -180 0 1 {name=p3 lab=vdd1v2}
C {iopin.sym} -210 260 0 1 {name=p4 lab=vss}
C {opin.sym} 1070 70 0 0 {name=p5 lab=por_unbuf}
C {lab_wire.sym} 810 70 0 0 {name=p6 sig_type=std_logic lab=vcap}
C {lab_wire.sym} -70 110 0 0 {name=p7 sig_type=std_logic lab=vfb}
C {lab_wire.sym} 140 -20 0 0 {name=p8 sig_type=std_logic lab=vpb}
C {sg13cmos5l_stdcells/sg13cmos5l_decap_4.sym} 1160 -130 0 0 {name=x7 VDD=vdd1v2 VSS=vss prefix=sg13cmos5l_ }
C {sg13cmos5l_stdcells/sg13cmos5l_buf_16.sym} 1140 -50 0 0 {name=x5 VDD=vdd1v2 VSS=vss prefix=sg13cmos5l_ }
C {sg13cmos5l_stdcells/sg13cmos5l_inv_4.sym} 1150 20 0 0 {name=x6 VDD=vdd1v2 VSS=vss prefix=sg13cmos5l_ }
C {sg13cmos5l_stdcells/sg13cmos5l_buf_16.sym} 1260 20 0 0 {name=x3 VDD=vdd1v2 VSS=vss prefix=sg13cmos5l_ }
C {opin.sym} 1340 20 0 0 {name=p9 lab=porb}
C {opin.sym} 1340 -50 0 0 {name=p10 lab=por}
C {lab_pin.sym} 210 40 0 0 {name=p12 sig_type=std_logic lab=vref}
C {sg13cmos5l_pr/rhigh.sym} -120 -130 0 0 {name=R3
w=0.5e-6
l=908.28e-6
model=rhigh
body=vss
spiceprefix=X
b=0
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {sg13cmos5l_pr/rhigh.sym} 70 160 0 0 {name=R1
w=0.5e-6
l=908.28e-6
model=rhigh
body=vss
spiceprefix=X
b=0
 m=1
  mm_ok=1
value="expr_eng(  ( 1.6e-4 / @w + 1360.0 * ( (@b + 1)* @l + ( 1.081*( @w - 0.04e-6 ) + 0.18e-6 )*@b ) / ( @w - 0.04e-6 ) ) / @m  )"
}
C {sg13cmos5l_pr/cap_cmomf.sym} 140 40 2 0 {name=C2
model=cap_cmomf
w=50e-6
l=14e-6
mmin=3
mmax=4
subblock=0
m=1
mm_ok=1
spiceprefix=X
}
C {sg13cmos5l_pr/cap_cmomf.sym} 700 140 0 0 {name=C1
model=cap_cmomf
w=20e-6
l=20e-6
mmin=1
mmax=4
subblock=0
m=16
mm_ok=1
spiceprefix=X
}
C {sg13cmos5l_pr/dantenna.sym} -210 90 0 0 {name=D2
model=dantenna
l=0.78u
w=0.78u
spiceprefix=X
}
C {lab_pin.sym} -160 -70 0 0 {name=p2 sig_type=std_logic lab=vref}
C {sg13cmos5l_pr/cap_cmomf.sym} -100 210 0 0 {name=C3
model=cap_cmomf
w=50e-6
l=14e-6
mmin=3
mmax=4
subblock=0
m=1
mm_ok=1
spiceprefix=X
}
C {lab_pin.sym} -100 150 0 0 {name=p11 sig_type=std_logic lab=vdd1v2}
C {sg13cmos5l_pr/cap_cmomf.sym} 800 220 0 0 {name=C4
model=cap_cmomf
w=50e-6
l=14e-6
mmin=1
mmax=4
subblock=1
m=2
mm_ok=1
spiceprefix=X
}
C {por_stepdown.sym} 380 10 0 0 {name=x4}
