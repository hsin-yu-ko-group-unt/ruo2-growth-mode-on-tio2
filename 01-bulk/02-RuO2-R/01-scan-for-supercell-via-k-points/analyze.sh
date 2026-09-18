#!/bin/bash

nk1_mx=11
nk2_mx=11
nk3_mx=15

print_target_convergence(){
  target_conv=`echo "2 meV" | awk -v nat=6 -v Ry_to_eV=13.6 '{ev=$1/1000}{Ry=ev/Ry_to_eV}{print Ry*sqrt(nat)}'` # random error scales as sqrt(N)
  echo "target_convergence ~= $target_conv Ry in the total energy"
}

analyze_nk12(){
  nk1_chosen=6
  nk2_chosen=6
  echo "-- scan for nk1,nk2 convergence --"
  grep "!" `ls -v kpoints-*-*-${nk3_mx}/output` | column -t
  echo "Found that nk1 = nk2 = ${nk1_chosen} is sufficiently converged"
  echo "------------------------------"
}


analyze_nk3(){
  nk3_chosen=8
  echo "-- scan for nk3 convergence --"
  grep "!" `ls -v kpoints-${nk1_mx}-${nk2_mx}-*/output`  | column -t
  echo "Found that nk3 = ${nk3_chosen} should be sufficiently converged"
  echo "------------------------------"
}

summary(){
  nat=6
  echo "summary: chosen a $nk1_chosen x $nk2_chosen x $nk3_chosen supercell"
}

print_target_convergence
analyze_nk12
analyze_nk3
summary
