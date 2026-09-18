#!/bin/bash
OUT_f=ecutwfc_etot.dat

extract_data(){
# generate output file
echo "#ecutwfc(Ry) etot(Ry)  detot(Ry)"                                         > $OUT_f
grep '!' */output | sed 's/\/output:!//g' | awk '{print $1,$5,$5-prv}{prv=$5}' >> $OUT_f 



# align output file
#cat $OUT_f | column -t > $OUT_f  # wrong
cat $OUT_f | column -t > ${OUT_f}.tmp
mv ${OUT_f}.tmp $OUT_f
}

targeted_accuracy(){
  # typical pseudopotential error ~ 1 meV/atom
  meV_to_Ry=`echo 13.605703976332 | awk '{print 1/($1*1000)}'` # 1Ry = 13.605703976332 eV
  natom=`grep 'nat ' template/pw.in | awk '{print $3}'`
  echo "$meV_to_Ry $natom" | awk '{print "#note: estimate PsP error: ", 2*$1 * sqrt($2), "(Ry)"}'  >> $OUT_f
  echo "! Choose ecutwfc 120 Ry" >> $OUT_f
  cat $OUT_f
}

extract_data
targeted_accuracy
