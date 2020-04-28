to
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
#PJM -L "elapse=10:00"

# Output standard error to the same file that standard output
#PJM -j
#-----------------------------------------------------


# python version
#-----------------------------------------------------
module load python/3.6.2
#-----------------------------------------------------


# run
#-----------------------------------------------------
python3 main.py
#-----------------------------------------------------
