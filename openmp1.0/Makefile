# your choice of compiler
CC = gcc

# Add your choice of flags
CFLAGS = -O3 -Wall -Wextra -g -fopenmp -
LDLIBS = -lm
MATRIX = cfd2.mtx.gz

all : cg_omp

cg_omp : cg_omp.o mmio.o
	$(CC) $(CFLAGS) -o cg_omp cg_omp.o mmio.o $(LDLIBS)

mmio.o : mmio.c mmio.h
cg_omp.o : cg_omp.c mmio.h

exec : cg_omp
	sh -c "zcat ${MATRIX} | ./$< --seed 13 --solution x.txt"

.PHONY: clean
clean :
	rm -rf cg_omp *.o
