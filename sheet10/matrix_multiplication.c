#include <mpi/mpi.h>
#include <stdio.h>
#include <string.h>

void matrixMultiply(int n, int a[n][n], int b[n][n], int c[n][n]) {
    int procs;
    int rank;
    MPI_Comm_size(MPI_COMM_WORLD, &procs);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    int linesPerProc = n / procs;

    int offset = linesPerProc * rank;
    MPI_Scatter(a, linesPerProc * n, MPI_INT,
                a + offset, linesPerProc * n, MPI_INT,
                0, MPI_COMM_WORLD);
    MPI_Bcast(b, n * n, MPI_INT, 0, MPI_COMM_WORLD);

    for (int i = 0; i < linesPerProc; i++) {
        int row = offset + i;
        for (int col = 0; col < n; col++) {
            c[row][col] = 0;
            for (int j; j < linesPerProc; j++) {
                c[row][col] += a[row][j] * b[j][col];
            }
        }
    }

    MPI_Gather(c + offset, linesPerProc * n, MPI_INT,
               c, linesPerProc * n, MPI_INT,
               0, MPI_COMM_WORLD);
}

int main(int argc, char** argv) {
    MPI_Init(&argc, &argv);
    int rank;
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);

    int a[4][4], b[4][4];

    // only the root should know the data at first
    if (rank == 0) {
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
    
    int c[4][4];

    matrixMultiply(4, a, b, c);

    for (int row = 0; row < 4; row++) {
        for (int col = 0; col < 4; col++) {
            printf("%i ", c[row][col]);
        }
        printf("\n");
    }

    MPI_Finalize();

    return 0;
}