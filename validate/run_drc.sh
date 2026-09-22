#!/bin/bash
#
# Run klayout DRC on the 1.2V PoR
# GDS is sg13cmos5l_ocd_ip__por.gds.gz, top level cell name is
# sg13cmos5l_ocd_ip__por
#
echo ${PDK_ROOT:=/usr/share/pdk} > /dev/null
echo ${PDK:=ihp-sg13cmos5l} > /dev/null

klayout -b -zz -r ${PDK_ROOT}/${PDK}/libs.tech/klayout/tech/drc/ihp-sg13cmos5l.drc -rd input=../gds/sg13cmos5l_ocd_ip__por.gds.gz -rd report=../validate/sg13cmos5l_ocd_ip__por.lyrdb -rd feol=True -rd beol=True -rd conn_drc=True -rd wedge=True -rd run_mode=deep -rd thr=16 -rd topcell=sg13cmos5l_ocd_ip__por

echo "Done!"
exit 0
