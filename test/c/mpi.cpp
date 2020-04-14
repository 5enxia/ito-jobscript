#include "mpi.h"
#include <stdio.h>
#include <math.h>
#define MAXSIZE 100

int main(int argc, char **argv)
{
    int rank, numprocs;

    MPI_Init(&argc, &argv);
    MPI_Comm_size(MPI_COMM_WORLD, &numprocs);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    printf("rank %d of %d numproces\n", rank, numprocs);

    MPI_Finalize();
}
