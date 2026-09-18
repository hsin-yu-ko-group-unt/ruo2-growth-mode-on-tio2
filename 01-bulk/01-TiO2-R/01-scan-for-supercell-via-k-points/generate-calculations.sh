#!/bin/bash

nk1_mx=5
nk2_mx=5
nk3_mx=7
ecut=60

run_a_job(){
  WK_d=kpoints-${nk1}-${nk2}-${nk3}
  rm -rf $WK_d
  cp -r template $WK_d
  cd $WK_d
  sed -i "s/<ecutwfc>/${ecut}.0/g; s/<nk1>/${nk1}/g; s/<nk2>/${nk2}/g; s/<nk3>/${nk3}/g" pw.in
  sleep 1
  sbatch submit.sh
  cd ..
}

for nk1 in `seq $nk1_mx`
do
  nk2=$nk1
  nk3=$nk3_mx
  run_a_job
done

for nk3 in `seq $nk3_mx`
do
  nk1=$nk1_mx
  nk2=$nk2_mx
  run_a_job
done
