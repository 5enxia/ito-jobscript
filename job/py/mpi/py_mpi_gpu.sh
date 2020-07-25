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
#PJM -L "elapse=30:00"

# Output standard error to the same file that standard output
#PJM -j

# Send Mail
#PJM --mail-list "xxx@yyy"
#PJM -m e
#-----------------------------------------------------


# compiler
#-----------------------------------------------------
module load intel/2019.4
#-----------------------------------------------------


# intel compiler env
#-----------------------------------------------------
# number of nodes
NUM_NODES=$PJM_VNODES

# number of cores per node
NUM_CORES=36

# number of procs
NUM_PROCS=16

# number of threads per proc
NUM_THREADS=9

# number of MPI procs
export I_MPI_PERHOST=`expr $NUM_CORES / $NUM_THREADS`

# MPI communication means
export I_MPI_FABRICS=shm:ofi

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


# cuda
#-----------------------------------------------------
module load cuda/10.1
#-----------------------------------------------------


# cuda-aware mpi
#-----------------------------------------------------
#module load exp-openmpi/3.0.0-intel
#module load exp-mvapich2/2.2-intel
#-----------------------------------------------------


# cuda-aware mpi env
#-----------------------------------------------------
#export MV2_SHOW_CPU_BINDING=1

# numactl
#export MV2_ENABLE_AFFINITY=0
#export MV2_USE_CUDA=1

# GDRDRV
#export MV2_GPUDIRECT_GDRCOPY_LIB=/usr/local/lib64/libgdrapi.so.1.2
#export LD_PRELOAD=/home/usr0/m70000a/opt/mvapich2-2.2-gdr/lib64/libmpi.so.12.0.5
#-----------------------------------------------------


# python
#-----------------------------------------------------
module load python/3.6.2
#-----------------------------------------------------


# python package
#-----------------------------------------------------
#pip install fastrlock --user
#pip install six --user
#pip install numpy --user
#pip install cupy-cuda101 --user
#-----------------------------------------------------


# date
#-----------------------------------------------------
date
#-----------------------------------------------------


# run
#-----------------------------------------------------
mpiexec.hydra -n $NUM_PROCS python3 main.py
#-----------------------------------------------------
