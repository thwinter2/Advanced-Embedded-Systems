CC = gcc
CFLAGS = -c -Wall -g -march=armv7-a -mfpu=neon -mfloat-abi=hard -O1

compass: twiddler.o main.o
	$(CC) twiddler.o main.o -g  -lm -o $@

# geometry_list.s: geometry.c
#	$(CC) -Wa,-adhln -g geometry.c -c > geometry_list.s

clean:
	rm -f *.o compass 
