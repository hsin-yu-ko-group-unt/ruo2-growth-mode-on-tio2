#!/bin/bash

nformula=1
WRK_d=relax_1_layer_R-RuO2_only.vasp
Area_A2=`grep -A3 'CELL_PARAM' ${WRK_d}/input  | tail -n 3| awk '(NR==1){a=$1}(NR==2){b=$2}END{print a*b}'`
grep ! ${WRK_d}/output | tail -n 1| awk -v nf=$nformula -v ry2ev=13.6056995 -v ebk=`cat bulk-etot_ev_per_RuO2.dat` -v A=$Area_A2 '{printf "%18.12f\n", ($5*ry2ev-nf*ebk)/(2*A)}' | tee 04-output/1layer_RuO2_film_Esurf_eV_A2.dat

nformula=2
WRK_d=relax_2_layer_R-RuO2_only.vasp
Area_A2=`grep -A3 'CELL_PARAM' ${WRK_d}/input  | tail -n 3| awk '(NR==1){a=$1}(NR==2){b=$2}END{print a*b}'`
grep ! ${WRK_d}/output | tail -n 1| awk -v nf=$nformula -v ry2ev=13.6056995 -v ebk=`cat bulk-etot_ev_per_RuO2.dat` -v A=$Area_A2 '{printf "%18.12f\n", ($5*ry2ev-nf*ebk)/(2*A)}' | tee 04-output/2layer_RuO2_film_Esurf_eV_A2.dat
