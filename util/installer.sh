#!/bin/bash

# ito
#-----------------------------------------------------
# sub-system
#PJM -L "rscunit=ito-b"

# resource group
#PJM -L "rscgrp=ito-g-4-dbg"

# number of virtual nodes
#PJM -L "vnode=1"

# number of cores per virtual node
#PJM -L "vnode-core=36"

# elapsed-time limit
#PJM -L "elapse=15:00"

# Output standard error to the same file that standard output
#PJM -j
#-----------------------------------------------------


# python
#-----------------------------------------------------
# runtime
module load python/3.6.2

# upgrade pip
pip install -U pip
#-----------------------------------------------------


# cuda & cupy
#-----------------------------------------------------
# function
## install
function cupy_install() {
    module load cuda/$1
    pip install -U cupy-cuda$2 --user
    module unload cuda/$1
}
## uninstall
function cupy_uninstall() {
    module load cuda/$1
    pip uninstall cupy-cuda$2 --yes
    module unload cuda/$1
}

# dependent modules
pip install -U fastrlock --user
pip install -U six --user
pip install -U numpy --user
pip install -U scipy --user

# install
cupy_install 10.1 101

# load cuda
module load cuda/10.1
#-----------------------------------------------------


# MPI
#-----------------------------------------------------
pip uninstall mpi4py --yes

## intel
# module load intel/2020.1

## gcc
# module load gcc/10.2.0

## mpi
### mvapich
module load mvapich/gdr-2.3-cuda10.1-gcc4.8.5

pip install -U mpi4py --user
#-----------------------------------------------------


# check load & install modules
#-----------------------------------------------------
# moudle
module list

# python module
pip list | grep cupy
pip list | grep mpi
#-----------------------------------------------------


# date
#-----------------------------------------------------
date
#-----------------------------------------------------
