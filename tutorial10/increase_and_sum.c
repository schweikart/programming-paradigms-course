#include <mpi/mpi.h>
#include <stdio.h>


int main(int argc, char** args) {
    // inititalize MPI
    int rank;
    int N;

    MPI_Init(&argc, &args);
    MPI_Comm_size(MPI_COMM_WORLD, &N);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    printf("This is node %i of %i.\n", rank, N);

    // generate numbers
    int numbers[N];
    if (rank == 0) {
        for (int i = 0; i < N; i++) {
            numbers[i] = i;
        }
    }

    // distribute numbers
    int number;
    MPI_Scatter(numbers, 1, MPI_INT, &number, 1, MPI_INT, 0, MPI_COMM_WORLD);

    // increase number on each node
    number++;

    int sum;
    // collect numbers
    MPI_Reduce(&number, &sum, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);
    if (rank == 0) {
        printf("sum = %i\n", sum);
    }

    // clean up MPI
    MPI_Finalize();
    
    return 0;
}