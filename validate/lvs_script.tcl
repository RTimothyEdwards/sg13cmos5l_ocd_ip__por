# Tcl script for setting up LVS for the sg13cmos5l 1.2V PoR

if {[catch {set PDK_ROOT $::env(PDK_ROOT)}]} {set PDK_ROOT /usr/share/pdk} 
if {[catch {set PDK $::env(PDK)}]} {set PDK ihp-sg13cmos5l}

set circuit2 [readnet spice ${PDK_ROOT}/${PDK}/libs.ref/sg13cmos5l_stdcell/spice/sg13cmos5l_stdcell.spice]
readnet spice ../netlist/schematic/sg13cmos5l_ocd_ip__por.spice $circuit2

set circuit1 [readnet spice ../netlist/layout/sg13cmos5l_ocd_ip__por.spice]

lvs "$circuit1 sg13cmos5l_ocd_ip__por" "$circuit2 sg13cmos5l_ocd_ip__por" \
${PDK_ROOT}/${PDK}/libs.tech/netgen/${PDK}_setup.tcl sg13cmos5l_ocd_ip__por_comp.out
