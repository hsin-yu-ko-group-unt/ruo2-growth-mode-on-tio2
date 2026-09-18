#!/bin/bash

ROOT_d=$PWD
STR_d=01-films
for sys in  \
1_layer_R-RuO2_only.vasp \
2_layer_R-RuO2_only.vasp
do
  WRK_d=relax_${sys}
  cp -r template/ $WRK_d
  cd $WRK_d
  ln -s $ROOT_d/$STR_d/$sys POSCAR
  sbatch submit.sh
  cd $ROOT_d
done
