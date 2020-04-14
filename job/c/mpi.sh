#!/bin/bash


# ito
#-----------------------------------------------------
# sub-system
#PJM -L "rscunit=ito-b"

# resource group
#PJM -L "rscgrp=ito-g-16-dbg"

# number of virtual nodes
#PJM -L "vnode=4"

# number of cores per virtual nodes
#PJM -L "vnode-core=36"

# elapsed-time limit
#PJM -L "elapse=10:00"

# Output standard error to the same file that standard output
#PJM -j
#-----------------------------------------------------


# compiler
#-----------------------------------------------------
module load intel/2019.4
#-----------------------------------------------------


# Intel MPI
#-----------------------------------------------------
# number of nodes
NUM_NODES=${PJM_VNODES}

# number of cores per node
NUM_CORES=36

# number of procs
NUM_PROCS=144

# number of MPI procs per node (required)
export I_MPI_PERHOST=$NUM_CORES

# MPI communication means
export I_MPI_FABRICS=shm:ofi

# Intel MPI boot method
export I_MPI_HYDRA_BOOTSTRAP=rsh
export I_MPI_HYDRA_BOOTSTRAP_EXEC=/bin/pjrsh
export I_MPI_HYDRA_HOST_FILE=${PJM_O_NODEINF}
#-----------------------------------------------------


# run
#-----------------------------------------------------
mpiexec.hydra -n $NUM_PROCS ./a.out
#-----------------------------------------------------
