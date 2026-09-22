#!/bin/sh
#
# Run LVS on the sg13cmos5l 1.2V PoR (sg13cmos5l_ocd_ip__por)
#
echo ${PDK_ROOT:=/usr/share/pdk} > /dev/null
echo ${PDK:=ihp-sg13cmos5l} > /dev/null

# export NETGEN_COLUMNS=150
export NETGEN_COLUMNS=75

netgen -batch source lvs_script.tcl
