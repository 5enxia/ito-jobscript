#!/bin/bash

# ito
#-----------------------------------------------------
# sub-system
#PJM -L "rscunit=ito-b"

# resource group
#PJM -L "rscgrp=ito-g-16-dbg"

# number of virtual nodes
#PJM -L "vnode=4"

# number of cores per virtual node
#PJM -L "vnode-core=36"

# elapsed-time limit
#PJM -L "elapse=15:00"

# Output standard error to the same file that standard output
#PJM -j
#-----------------------------------------------------


# python
#-----------------------------------------------------
module load python/3.6.2
#pip install -U fastrlock --user
#pip install -U six --user
#pip install -U numpy --user
#pip install -U scipy --user
#-----------------------------------------------------


# cuda
#-----------------------------------------------------
# function
function cupy_install() {
    module load cuda/$1
    pip install -U cupy-cuda$2 --user
    module unload cuda/$1
}

function cupy_uninstall() {
    module load cuda/$1
    pip uninstall cupy-cuda$2 --yes
    module unload cuda/$1
}

# pip install -U cupy-cuda91 --user
# pip uninstall cupy-cuda91 --yes

#cupy_uninstall 11.0 110
#cupy_uninstall 8.0 80
#cupy_uninstall 10.1 101
#cupy_install 10.1 101
#module load cuda/10.1
# pip install -U cupy --user
#pip3 uninstall cupy --yes
#-----------------------------------------------------


# compiler
#-----------------------------------------------------
pip uninstall mpi4py --yes

## intel
# module load intel/2019.4
# module load intel/2020.1

## gcc
# module load gcc/10.2.0

## mpi
### openmpi
#module load openmpi/3.1.3-nocuda-intel18.3
#module load cuda/10.1
#module load openmpi/3.1.3-cuda9.1-intel18.3
#module load openmpi/3.1.1-cuda-intel18.0

### mvapich
module load mvapich/gdr-2.3-cuda10.1-gcc4.8.5

pip install -U mpi4py --user
#-----------------------------------------------------


# python package
#-----------------------------------------------------
#pip install -r addcuda.txt --user
#-----------------------------------------------------


# check modules
#-----------------------------------------------------
module list
pip list | grep cupy
#pip3 list | grep mpi
#-----------------------------------------------------


# compiler env
#-----------------------------------------------------
# number of nodes
NUM_NODES=$PJM_VNODES

# number of cores per node
NUM_CORES=36

# number of procs
NUM_PROCS=4

# number of threads per proc
NUM_THREADS=36

# number of MPI procs
export I_MPI_PERHOST=`expr $NUM_CORES / $NUM_THREADS`

# MPI communication means
export I_MPI_FABRICS=shm:ofi
#export I_MPI_FABRICS=shm:ofa

# procs & threads allocation
export I_MPI_PIN_DOMAIN=omp
export I_MPI_PIN_CELL=core

# number of OpenMP threads per proc
export OMP_NUM_THREADS=$NUM_THREADS

# stack size
export KMP_STACKSIZE=8m

# correspondence between threads and cores
export KMP_AFINITY=compact

# Intel MPI boot method
export I_MPI_HYDRA_BOOTSTRAP=rsh
export I_MPI_HYDRA_BOOTSTRAP_EXEC=/bin/pjrsh
export I_MPI_HYDRA_HOST_FILE=${PJM_O_NODEINF}
#-----------------------------------------------------


# cuda-aware mpi env
#-----------------------------------------------------
export MV2_SHOW_CPU_BINDING=1

# numactl
export MV2_ENABLE_AFFINITY=0
export MV2_USE_CUDA=1

# GDRDRV
#export MV2_GPUDIRECT_GDRCOPY_LIB=/usr/local/lib64/libgdrapi.so.1.2
#export LD_PRELOAD=/home/usr0/m70000a/opt/mvapich2-2.2-gdr/lib64/libmpi.so.12.0.5
#-----------------------------------------------------


# date
#-----------------------------------------------------
date
#-----------------------------------------------------

# argv
#-----------------------------------------------------
RUNTIME='python3'
MPI_PROGRAM='main.py'
#-----------------------------------------------------

# run
# -----------------------------------------------------
mpiexec.hydra -n $NUM_PROCS $RUNTIME $MPI_PROGRAM
# -----------------------------------------------------
