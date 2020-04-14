# !/bin/bash

len=(56 161 1081 2801 6881 10601)
version=('reduced' 'EFG')
for l in {0..5}
do
    mkdir "${len[$l]}"
    for v in {0..2}
    do
        mkdir "${len[$l]}"/"${version[$v]}" 
    done
done
