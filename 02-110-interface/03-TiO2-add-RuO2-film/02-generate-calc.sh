#!/bin/bash

ROOT_d=$PWD
STRC_d=01-make-interface/
for sys in \
1L_RuO2_on_both_sides_of_6layer-R-TiO2_110.vasp \
2L_RuO2_on_top_of_6layer-R-TiO2_110.vasp
do
  WRK_d=relax_$sys
  cp -r template/ $WRK_d
  cd $WRK_d
  ln -s $ROOT_d/$STRC_d/$sys POSCAR
  sbatch submit.sh
  cd $ROOT_d
done
