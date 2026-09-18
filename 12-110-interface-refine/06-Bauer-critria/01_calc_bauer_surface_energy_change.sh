#!/bin/bash

gi_ev_A2=`cat Eintf_eV_A2.dat`
gf_ev_A2=`cat 1layer_RuO2_film_Esurf_eV_A2.dat`
gs_ev_A2=`awk '($1==6){print $2}' nlayer_Esurf_eV_A2.dat`
echo $gi_ev_A2 | awk -v evA2toJm2=16.021766 '{printf "gamma_i = %18.12f\n", $1*evA2toJm2}' | tee gi_J_m2.dat
echo $gf_ev_A2 | awk -v evA2toJm2=16.021766 '{printf "gamma_f = %18.12f\n", $1*evA2toJm2}' | tee gf_J_m2.dat
echo $gs_ev_A2 | awk -v evA2toJm2=16.021766 '{printf "gamma_s = %18.12f\n", $1*evA2toJm2}' | tee gs_J_m2.dat
echo $gi_ev_A2 $gf_ev_A2 $gs_ev_A2| awk '{printf "%18.12f\n", ($1+$2-$3)}' | tee dg_wet_eV_A2.dat
cat  dg_wet_eV_A2.dat | awk '{printf "%18.12f\n", $1*16.022}' | tee dg_wet_J_m2.dat
