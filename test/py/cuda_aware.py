import cupy as cp
from mpi4py import MPI
print(cp.__version__)

comm = MPI.COMM_WORLD
size = comm.Get_size()
rank = comm.Get_rank()
print(f'{rank}/{size}')

num_of_gpu = cp.cuda.runtime.getDeviceCount()
print(rank, num_of_gpu)

cp.cuda.Device(0).use()
pool = cp.cuda.MemoryPool(cp.cuda.malloc_managed)
cp.cuda.set_allocator(pool.malloc)

# Allreduce
sendbuf = cp.arange(10, dtype='i')
recvbuf = cp.empty_like(sendbuf)
print('start', rank, sendbuf, recvbuf)
comm.Allreduce(sendbuf, recvbuf)
print('end',rank, sendbuf, recvbuf)
