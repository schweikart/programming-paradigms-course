#include <mpi/mpi.h>
#include <stdio.h>

void print_buffer(int buffer[4]) {
    for (int i = 0; i < 4; i++) {
        printf("%i ", buffer[i]);
    }
    printf("\n");
}

int main(int argc, char** argv) {
    // set up MPI
    MPI_Init(&argc, &argv);
    
    int size, rank;
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    // prepare buffers for sending
    int sendbuffer[4];
    int recvbuffer[4];

    for (int i = 0; i < 4; i++) {
        sendbuffer[i] = rank + 2 * i;
    }

    // component-wise sum from all sendbuffers to recvbuffer
    MPI_Reduce(sendbuffer, recvbuffer, 4, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);

    // print buffers
    printf("[%i] sendbuffer = ", rank);
    print_buffer(sendbuffer);
    if (rank == 0) {
        printf("[%i] recvbuffer = ", 0);
        print_buffer(recvbuffer);
    }

    // clean up MPI
    MPI_Finalize();
    return 0;
}
