#include <mpi/mpi.h>
#include <stdio.h>
#include <string.h>
#include <time.h>

void matrixMultiply(int n, int a[n][n], int b[n][n], int c[n][n]) {
    int procs;
    int rank;
    MPI_Comm_size(MPI_COMM_WORLD, &procs);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    int linesPerProc = n / procs;

    int offset = linesPerProc * rank;

    int* a_recvbuf = (rank == 0) ? (MPI_IN_PLACE) : (a + offset);
    MPI_Scatter(a, linesPerProc * n, MPI_INT,
                a_recvbuf, linesPerProc * n, MPI_INT,
                0, MPI_COMM_WORLD);
    MPI_Bcast(b, n * n, MPI_INT, 0, MPI_COMM_WORLD);

    for (int i = 0; i < linesPerProc; i++) {
        int row = offset + i;
        for (int col = 0; col < n; col++) {
            c[row][col] = 0;
            for (int j = 0; j < n; j++) {
                c[row][col] += a[row][j] * b[j][col];
            }
        }
    }

    int* c_sendbuf = (rank == 0) ? MPI_IN_PLACE : (c + offset);
    MPI_Gather(c_sendbuf, linesPerProc * n, MPI_INT,
               c, linesPerProc * n, MPI_INT,
               0, MPI_COMM_WORLD);
}

void print_matrix(int n, int matrix[n][n]) {
    for (int row = 0; row < n; row++) {
        for (int col = 0; col < n; col++) {
            printf("%02i ", matrix[row][col]);
        }
        printf("\n");
    }
}

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);
    int rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    int n = 4;
    int a[n][n], b[n][n];

    // only the root should know the data at first
    if (rank == 0 && n == 4) {
        int a_input[4][4] = {
            { 1, 2, 3, 4},
            { 5, 6, 7, 8},
            { 9,10,11,12},
            {13,14,15,16}
        };
        memcpy(a, a_input, sizeof(a_input));

        int b_input[4][4] = {
            {1, 0, 0, 0},
            {0, 1, 0, 0},
            {0, 0, 1, 0},
            {0, 0, 0, 1}
        };
        memcpy(b, b_input, sizeof(b_input));
    }
    
    int c[n][n];

    clock_t begin = clock();
    matrixMultiply(n, a, b, c);
    clock_t end = clock();
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
    if (rank == 0) printf("n = %i, t = %f\n", n, time_spent);

    // only root knows the result
    if (rank == 0 && n == 4) {
        printf("a =\n");
        print_matrix(4, a);
        printf("b = \n");
        print_matrix(4, b);
        printf("c = \n");
        print_matrix(4, c);
    }

    MPI_Finalize();

    return 0;
}