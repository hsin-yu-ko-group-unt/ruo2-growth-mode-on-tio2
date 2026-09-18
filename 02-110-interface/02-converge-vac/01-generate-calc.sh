#!/bin/bash

ROOT_d=$PWD
for vac in 5 7.5 10 12.5
do
  WRK_d=vac_${vac}
  cp -r template/ $WRK_d
  cp -L POSCAR $WRK_d
  cd $WRK_d
  sed "s/<vac>/$vac/g" 02-convert-vasp-to-pw_vac.py > 02-convert-vasp-to-pw.py
  #sbatch submit.sh.a100
  sbatch submit.sh
  cd $ROOT_d
done
