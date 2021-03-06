#!/bin/bash
#cktfile must contain list of all the verilog file needed to
#contruct the design
#
#this script takes ckts in cktfile runs them through vpp
#the output is sent to stdout
#

cktdir=/home/max/EECS301/lab3

comp=$1
in_d=$2
out_d=$3

elsyn << //EOF
read  /mgc/Leonardo/lib/ami05_typ.syn
#read /mgc/Leonardo/lib/tsmc035_typ.syn

read {$cktdir/${in_d}/${comp}.v}

pre_optimize -common_logic -unused_logic -boundary -xor_comparator_optimize
pre_optimize -extract
optimize -macro -auto -effort standard -hierarchy auto

optimize .work.${comp}.INTERFACE -macro -auto -effort standard -hierarchy auto
optimize_timing .work.${comp}.INTERFACE
set edif_write_arrays FALSE

#write -downto PRIMITIVES -format vhdl   Proc.vhd
#write -downto PRIMITIVES -format edif   Proc.edf
write -downto PRIMITIVES -format verilog  ${out_d}/Proc.v
#write -format verilog  ${comp}_S/Proc.v
write -format SDF -downto PRIMITIVES ${out_d}/Proc.sdf
set report_file_name CriticalPath
report_delay -num_paths 1 -show_schematic 1 -critical_paths 
exit
//EOF
        echo "// End >>> $cktdir/$ckt <<<"


exit
