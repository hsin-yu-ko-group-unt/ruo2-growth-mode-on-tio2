inp=$1

a=`grep -A3 'CELL_PARAM' $inp | tail -n 3 | awk '(NR==1){print $1}'`
b=`grep -A3 'CELL_PARAM' $inp | tail -n 3 | awk '(NR==2){print $2}'`
c=`grep -A3 'CELL_PARAM' $inp | tail -n 3 | awk '(NR==3){print $3}'`

nk1=`grep -A1 'K_POINTS' $inp | tail -n 1 | awk '{print $1}'`
nk2=`grep -A1 'K_POINTS' $inp | tail -n 1 | awk '{print $2}'`
nk3=`grep -A1 'K_POINTS' $inp | tail -n 1 | awk '{print $3}'`

echo "$a $b $c $nk1 $nk2 $nk3" | awk -v tpi=6.2832 '{dk1=tpi/($1*$4)}{dk2=tpi/($2*$5)}{dk3=tpi/($3*$6)}{printf "%8.4f\n%8.4f\n%8.4f\n", dk1,dk2,dk3}'
