#!/bin/bash

Area_A2=`grep -A3 'CELL_PARAM' input-1L_RuO2_both_side_on-6-layer-R-TiO2_101 | tail -n 3| awk '(NR==1){a=$1}(NR==2){b=$2}END{print a*b}'`
Eab_ev=`grep ! output-1L_RuO2_both_side_on-6-layer-R-TiO2_101 | tail -n 1| awk -v ry2ev=13.6056995 '{printf "%18.12f\n", $5*ry2ev}'`
Ea_ev=`grep ! output-1layer-strained-RuO2 | tail -n 1| awk -v ry2ev=13.6056995 '{printf "%18.12f\n", $5*ry2ev}'`
Eb_ev=`grep ! output-6layer-R-TiO2_100 | tail -n 1| awk -v ry2ev=13.6056995 '{printf "%18.12f\n", $5*ry2ev}'`
echo $Eab_ev $Ea_ev $Eb_ev | awk -v A=$Area_A2 '{printf "%18.12f\n", ($1-2*$2-$3)/(2*A)}' | tee Eintf_eV_A2.dat
