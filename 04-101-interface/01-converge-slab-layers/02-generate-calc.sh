#!/bin/bash

ROOT_d=$PWD
STRC_d=01-slabs
for n in `seq 3 8`
do
  WRK_d=${n}_layer
  cp -r template/ $WRK_d
  cd $WRK_d
  ln -s $ROOT_d/$STRC_d/${n}L_R-TiO2_101_vac_10.vasp POSCAR
  sbatch submit.sh
  cd $ROOT_d
done
