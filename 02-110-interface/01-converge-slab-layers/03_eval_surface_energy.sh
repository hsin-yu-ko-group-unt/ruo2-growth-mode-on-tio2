#!/bin/bash

nformula_per_layer=2
ROOT_d=$PWD
for n in `seq 4 2 8`
do
  WRK_d=${n}_layer
  Area_A2=`grep -A3 'CELL_PARAM' ${n}_layer/output  | tail -n 3| awk '(NR==1){a=$1}(NR==2){b=$2}END{print a*b}'`
  grep ! ${n}_layer/output | tail -n 1| awk -v nf=$[nformula_per_layer * n] -v ry2ev=13.6056995 -v ebk=`cat bulk-etot_ev_per_TiO2.dat` -v A=$Area_A2 '{printf "'$n' %18.12f\n", ($5*ry2ev-nf*ebk)/(2*A)}'
done | tee 04-output/nlayer_Esurf_eV_A2.dat
