CC = gcc
CFLAGS = -Wall -mfpu=crypto-neon-fp-armv8 -mfloat-abi=hard -mcpu=cortex-a72  -O3 -ffast-math -ggdb 

mandel: mandel.o
	$(CC) $(CFLAGS) $< -lrt -lm -o $@

mandel.s: mandel.c
	$(CC) $(CFLAGS) $< -S
#	$(CC) $(CFLAGS) -fverbose-asm -fopt-info-missed $< -S
#	$(CC) $(CFLAGS) -fopt-info-missed -fdump-rtl-final -fdump-tree-graph $< -S # -fverbose-asm $< -S

clean:
	rm -f *.o *.s mandel
