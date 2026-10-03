#!/bin/bash
#
# Run GDS and LEF generation on the 1.2V PoR
#
export PDK_ROOT=${PDK_ROOT:-/usr/share/pdk}
export PDK=${PDK:-ihp-sg13cmos5l}

project=sg13cmos5l_ocd_ip__por

echo "Running GDS and LEF generation on ${project}"
magic -dnull -noconsole -rcfile ${PDK_ROOT}/${PDK}/libs.tech/magic/${PDK}.magicrc << EOF
# Read the standard cells from foundry GDS
gds read ${PDK_ROOT}/${PDK}/libs.ref/sg13cmos5l_stdcell/gds/sg13cmos5l_stdcell.gds 
load ${project}
select top cell
expand
select top cell
gds compress 9
gds write sg13cmos5l_ocd_ip__por
select top cell
lef write -hide
quit -noprompt
EOF
rm -rf extfiles
mv sg13cmos5l_ocd_ip__por.gds.gz ../gds/
mv sg13cmos5l_ocd_ip__por.lef ../lef/
echo "Done"
