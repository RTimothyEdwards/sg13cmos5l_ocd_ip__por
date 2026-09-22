#!/bin/bash
#
# Run layout extraction on the 1.2V PoR
#
echo ${PDK_ROOT:=/usr/share/pdk} > /dev/null
echo ${PDK:=ihp-sg13cmos5l} > /dev/null
project=sg13cmos5l_ocd_ip__por

echo "Running netlist extraction on ${project}"
magic -dnull -noconsole -rcfile ${PDK_ROOT}/${PDK}/libs.tech/magic/${PDK}.magicrc << EOF
load ${project}
select top cell
extract path extfiles
extract do unique
extract no all
extract all
ext2spice lvs
ext2spice -p extfiles -o ../netlist/layout/${project}.spice
quit -noprompt
EOF
rm -rf extfiles
echo "Done"
