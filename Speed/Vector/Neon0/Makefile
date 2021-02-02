CC = gcc
UNROLL_CFLAGS = # -fno-unroll-loops
VECTORIZE_CFLAGS =  -ftree-vectorize -mvectorize-with-neon-quad
MATH_CFLAGS =  -ffast-math -ffinite-math-only -fno-math-errno \
 -fsingle-precision-constant 

CFLAGS = -c -Wall -mfpu=crypto-neon-fp-armv8 -mfloat-abi=hard \
-mcpu=cortex-a72 -O3 -Ofast -ggdb $(UNROLL_CFLAGS) $(VECTORIZE_CFLAGS) \
$(MATH_CFLAGS)

neon0: main.o
	$(CC) main.o -g -static -lrt -lm -o $@

main_list.s: main.c
	$(CC) $(CFLAGS) -Wa,-adhln -g main.c -c > main_list.s

clean:
	rm -f test *.o  *.s
