#!/bin/bash


# ito
#-------------------------------------------------------------
# sub-system
#PJM -L "rscunit=ito-b"

# resource group
#PJM -L "rscgrp=ito-g-1-dbg"

# number of vertual nodes
#PJM -L "vnode=1"

# number of cores per virtual node
#PJM -L "vnode-core=9"

# Elapsed time limit
#PJM -L "elapse=10:00"

# Output standard error to the same file that standard output
#PJM -j
#-------------------------------------------------------------


# compiler
#-------------------------------------------------------------
module load intel/2019.4
#-------------------------------------------------------------


# run
#-------------------------------------------------------------
/a.out
#-------------------------------------------------------------
