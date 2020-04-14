#!/bin/bash


# ito
#-----------------------------------------------------
# sub-system
#PJM -L "rscunit=ito-b"

# resource group
#PJM -L "rscgrp=ito-g-4-dbg"

# number of virtual nodes
#PJM -L "vnode=1"

# number of virtual cores per node
#PJM -L "vnode-core=36"

# elapsed-time limit
#PJM -L "elapse=10:00"

# Output standard error to the same file that standard output
#PJM -j
#-----------------------------------------------------


# compiler version
#-----------------------------------------------------
module load intel/2019.4
#-----------------------------------------------------


# OpenMP
#-----------------------------------------------------
export OMP_NUM_THREADS=36
#-----------------------------------------------------


# run
#-----------------------------------------------------
./a.out
#-----------------------------------------------------
