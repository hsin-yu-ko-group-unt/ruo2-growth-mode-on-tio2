#!/bin/bash

ecut=60

run_a_job(){
  WK_d=kpoints-${nk1}-${nk2}-${nk3}
}

for nk_ in `seq 7`
do
  nk1=$[nk_*2]
  nk2=$nk1
  nk3=$[nk_*3]
  etot=`grep '!' kpoints-${nk1}-${nk2}-${nk3}/output | awk '{print $5}'`
  echo $nk1 $nk2 $nk3 $etot
done > nks_etot_ry.dat
