CC = gcc
# No if-conversion
# CFLAGS = -c -Wall  -ggdb -O3  -mfloat-abi=hard -mcpu=cortex-a72 -mfpu=crypto-neon-fp-armv8 -fno-tree-vectorize  -fno-if-conversion2
# if-conversion
CFLAGS = -c -Wall  -ggdb -O3 -Ofast -mfloat-abi=hard -mcpu=cortex-a72 -mfpu=crypto-neon-fp-armv8 -ffast-math -ftree-vectorize

PROF =  -pg -g # Add for gprof $(PROF)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

%.s: %.c
	$(CC) $(CFLAGS) -S -fverbose-asm $<

opts: opts.o
	$(CC) opts.o -lrt -lm -static -o $@
fx: fx.o
	$(CC) fx.o -lrt -lm -static -o $@

clean:
	rm -f *.o opts *.s
