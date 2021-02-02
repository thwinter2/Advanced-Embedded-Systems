CC = gcc
CFLAGS = -c -Wall  -ggdb -O0 -mfloat-abi=hard -mcpu=cortex-a72 -mfpu=crypto-neon-fp-armv8 

PROF =  -pg -g 

%.o: %.c
	$(CC) $(CFLAGS) $(PROF) -c -o $@ $<

sg: main.o geometry.o CMAN_coords.o
	$(CC) -ggdb $(PROF) main.o geometry.o CMAN_coords.o -lrt -lm -static -o $@

geometry_list.s: geometry.c
	$(CC) -Wa,-adhln -g geometry.c -c > geometry_list.s

clean:
	rm -f *.o sg *.s
