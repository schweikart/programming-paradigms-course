mpicc matrix_multiplication.c --output matrix_multiplication
mpiexec -np 4 ./matrix_multiplication
