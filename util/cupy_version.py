import numpy
import cupy
import mpi4py

v = 'version:'
print('numpy', v, numpy.__version__)
print('cupy', v, cupy.__version__)
print('mpi4py', v, mpi4py.__version__)
