#!/bin/bash

nk1_mx=5
nk2_mx=5
nk3_mx=7

print_target_convergence(){
  target_conv=`echo "2 meV" | awk -v nat=6 -v Ry_to_eV=13.6 '{ev=$1/1000}{Ry=ev/Ry_to_eV}{print Ry*sqrt(nat)}'` # random error scales as sqrt(N)
  echo "target_convergence ~= $target_conv Ry in the total energy"
}

analyze_nk12(){
  nk1_chosen=3
  nk2_chosen=3
  echo "-- scan for nk1,nk2 convergence --"
  grep "!" kpoints-*-*-${nk3_mx}/output
  echo "Found that nk1 = nk2 = ${nk1_chosen} is sufficiently converged"
  echo "------------------------------"
}


analyze_nk3(){
  nk3_chosen=5
  echo "-- scan for nk3 convergence --"
  grep "!" kpoints-${nk1_mx}-${nk2_mx}-*/output
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
