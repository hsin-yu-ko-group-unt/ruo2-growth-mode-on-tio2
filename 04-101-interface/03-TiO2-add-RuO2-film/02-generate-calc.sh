#!/bin/bash

ROOT_d=$PWD
STRC_d=01-make-interface/
for sys in \
1L_RuO2_both_side_on-6-layer-R-TiO2_101.vasp \
2L_RuO2_top_side_on-6-layer-R-TiO2_101.vasp
do
  WRK_d=relax_$sys
  cp -r template/ $WRK_d
  cd $WRK_d
  ln -s $ROOT_d/$STRC_d/$sys POSCAR
  sbatch submit.sh
  cd $ROOT_d
done
