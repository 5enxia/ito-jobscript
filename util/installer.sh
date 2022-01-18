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
iv=(10 1)
uv=(9 1)
cupy_uninstall ${uv[0]}.${uv[1]} ${uv[0]}${uv[1]}
cupy_install ${iv[0]}.${iv[1]} ${iv[0]}${iv[1]}

# load cuda
module load cuda/${iv[0]}.${iv[1]}
#-----------------------------------------------------


# MPI
#-----------------------------------------------------
pip uninstall mpi4py --yes

## intel
# module load intel/2020.1

## gcc
# module load gcc/10.2.0

## mpi
### openmpi
# module load openmpi/3.1.3-nocuda-intel18.3
# moudle load openmpi/3.1.3-cuda9.1-intel18.3
### mvapich
module load mvapich/gdr-2.3-cuda10.1-gcc4.8.5

pip install -U mpi4py --user
#-----------------------------------------------------

# numpy
#-----------------------------------------------------
pip uninstall numpy --yes
pip install -U numpy --user
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

# cupy version
python3 cupy_version.py

