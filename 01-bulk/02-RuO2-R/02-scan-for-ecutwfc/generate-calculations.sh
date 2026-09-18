#!/bin/bash

nk1=6
nk2=6
nk3=8

run_a_job(){
  ecut_pad0=$(printf %03d $ecut)
  rm -rf $ecut_pad0
  cp -rL template $ecut_pad0
  cd $ecut_pad0
  sed -i "s/<ecutwfc>/${ecut}.0/g; s/<nk1>/${nk1}/g; s/<nk2>/${nk2}/g; s/<nk3>/${nk3}/g" pw.in
  sleep 1
  sbatch submit.sh
  cd ..
}

for ecut in 60 80 100 120 140
do
  run_a_job
done
