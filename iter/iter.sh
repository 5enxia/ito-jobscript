# !/bin/bash

version=('reduced' 'EFG')
len=(56 161 1081 2801 6881 10601)
ks=(5 8 10)
for v in {0..1}
do
    for l in {0..5}
    do
        for k in {0..2}
        do
            python3 variable_k_skip_mrr.py "${version[$v]}" "${len[$l]}" "${ks[$k]}"
        done
    done
done
