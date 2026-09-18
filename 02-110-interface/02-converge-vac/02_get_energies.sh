#!/bin/bash

nformula=10
for vac in 5 7.5 10 12.5
do
  WRK_d=vac_${vac}
  Area_A2=`grep -A3 'CELL_PARAM' vac_${vac}/output  | tail -n 3| awk '(NR==1){a=$1}(NR==2){b=$2}END{print a*b}'`
  grep ! vac_${vac}/output | tail -n 1| awk -v nf=$nformula -v ry2ev=13.6056995 -v ebk=`cat bulk-etot_ev_per_TiO2.dat` -v A=$Area_A2 -v v=$vac '{printf "%5.1f  %18.12f\n", v*2, ($5*ry2ev-nf*ebk)/(2*A)}'
done | tee vac_Esurf_eV_A2.dat
