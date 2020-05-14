#-----------------------------------------------------
# sub-system
#PJM -L "rscunit=ito-b"

# resource group
#PJM -L "rscgrp=ito-g-4-dbg"

# number of nodes
#PJM -L "vnode=1"

# number of cores per node
#PJM -L "vnode-core=36"

# elapsed-time limit
#PJM -L "elapse=1:00"

# Output standard error to the same file that standard output
#PJM -j
#-----------------------------------------------------

# cuda vesion
#-----------------------------------------------------
module load cuda/10.1
#-----------------------------------------------------


# python version
#-----------------------------------------------------
module load python/3.6.2
#-----------------------------------------------------

# date
#-----------------------------------------------------
date
#-----------------------------------------------------

# GPU INFO
#-----------------------------------------------------
/sbin/lspci | grep NVIDIA
#-----------------------------------------------------
