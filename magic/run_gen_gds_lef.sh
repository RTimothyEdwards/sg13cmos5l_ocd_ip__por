#!/bin/bash
#
# Run GDS and LEF generation on the 1.2V PoR
#
echo ${PDK_ROOT:=/usr/share/pdk} > /dev/null
echo ${PDK:=ihp-sg13cmos5l} > /dev/null
project=sg13cmos5l_ocd_ip__por

echo "Running GDS and LEF generation on ${project}"
magic -dnull -noconsole -rcfile ${PDK_ROOT}/${PDK}/libs.tech/magic/${PDK}.magicrc << EOF
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
