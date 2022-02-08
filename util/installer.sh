#!/bin/bash

# ito
#-----------------------------------------------------
# sub-system
#PJM -L "rscunit=ito-b"

# resource group
#PJM -L "rscgrp=ito-g-16"

# number of virtual nodes
#PJM -L "vnode=4"

# number of cores per virtual node
#PJM -L "vnode-core=36"

# elapsed-time limit
#PJM -L "elapse=15:00"

# Output standard error to the same file that standard output
#PJM -j
#-----------------------------------------------------


# params
#-----------------------------------------------------
iv=(10 1)
uv=(8 0)
#-----------------------------------------------------


# Python3
#-----------------------------------------------------
module load python/3.6.2

pip install -U pip --user
pip install -U fastrlock --user
pip install -U six --user
pip install -U numpy --user
pip install -U scipy --user

# module unload python/3.6.2
#-----------------------------------------------------


# cupy
#-----------------------------------------------------
## function
function cupy_install() {
    module load cuda/$1
    pip3 install -U cupy-cuda$2 --user
    module unload cuda/$1
}
## uninstall
function cupy_uninstall() {
    module load cuda/$1
    # pip3 uninstall cupy --yes
    pip3 uninstall cupy-cuda$2 --yes
    module unload cuda/$1
}

# cupy_uninstall ${uv[0]}.${uv[1]} ${uv[0]}${uv[1]}
# cupy_install ${iv[0]}.${iv[1]} ${iv[0]}${iv[1]}

## nccl
# echo -----------------------------
# module load cuda/${iv[0]}.${iv[1]}
# python3 -m cupyx.tools.install_library --library nccl --cuda 10.1
# echo -----------------------------
#-----------------------------------------------------


# CUDA
#-----------------------------------------------------
module load cuda/${iv[0]}.${iv[1]}
#-----------------------------------------------------


# MPI
#-----------------------------------------------------
module load python/3.6.2
pip uninstall mpi4py --yes
module unload python/3.6.2

## Intel
# module load intel/2020.1

## mpi
### OpenMPI
module load openmpi/3.1.3-nocuda-gcc4.8.5
# module load openmpi/3.1.3-cuda9.1-gcc4.8.5
### MVAPICH2
# module load mvapich/gdr-2.3-cuda10.1-gcc4.8.5
# export MV2_GPUDIRECT_GDRCOPY_LIB=/home/app/mvapich/gdrcopy/lib64/libgdrapi.so
# export LD_PRELOAD=/home/app/mvapich/gdr-2.3.2-cuda10.1-gcc4.8.5/lib64/libmpi.so

module load python/3.6.2
pip install -U mpi4py --user
#-----------------------------------------------------


# check
#-----------------------------------------------------
## moudle
module list

## Python
pip list | grep cupy
pip list | grep mpi
### cupy
python3 cupy_version.py
#-----------------------------------------------------
