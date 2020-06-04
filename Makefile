# your choice of compiler
CC = gcc

# Add your choice of flags
CFLAGS = -O3 -Wall -Wextra -g -fopenmp -ffast-math -mfma -march=native
LDLIBS = -lm
MATRIX = hood.mtx.gz

all : cg_omp

cg_omp : cg_omp.o mmio.o
	$(CC) $(CFLAGS) -o cg_omp cg_omp.o mmio.o $(LDLIBS)

mmio.o : mmio.c mmio.h
cg_omp.o : cg_omp.c mmio.h

exec : cg_omp
	sh -c "zcat ${MATRIX} | ./$< >> /dev/null"

.PHONY: clean
clean :
	rm -rf cg_omp *.o
