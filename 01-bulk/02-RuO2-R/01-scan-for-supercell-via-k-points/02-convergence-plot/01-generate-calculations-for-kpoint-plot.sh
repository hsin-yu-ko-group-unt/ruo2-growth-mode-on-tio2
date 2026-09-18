#!/bin/bash

ecut=60

run_a_job(){
  WK_d=kpoints-${nk1}-${nk2}-${nk3}
  rm -rf $WK_d
  cp -rL template $WK_d
  cd $WK_d
  sed -i "s/<ecutwfc>/${ecut}.0/g; s/<nk1>/${nk1}/g; s/<nk2>/${nk2}/g; s/<nk3>/${nk3}/g" pw.in
  #sleep 1
  sbatch submit.sh
  cd ..
}

for nk_ in `seq 7`
do
  nk1=$[nk_*2]
  nk2=$nk1
  nk3=$[nk_*3]
  run_a_job
done
