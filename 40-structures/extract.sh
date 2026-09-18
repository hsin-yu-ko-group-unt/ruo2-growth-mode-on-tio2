for i in *.vasp; do echo "=== Begin structure: $i ==="; cat $i; echo "===  End  structure: $i ==="; done  > Supplementary_Data_1_optimized_structures.txt
