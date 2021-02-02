#include <stdio.h>
#include <math.h>
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <time.h>

#define ARRAY_SIZE (10000)
#define CLOCK_FREQ_GHZ (1.5)
#define N_TESTS (1000)

float a[ARRAY_SIZE],  b[ARRAY_SIZE], w[3]={0.3, 1.5, 0.3};
volatile float c[ARRAY_SIZE]; 

void init(int mask_val) {
  for (int n=0; n<ARRAY_SIZE; n++) {
    a[n] = n;
  }
}
void do_test1(void) {
  for (int n=0; n<ARRAY_SIZE-3; n++) {
    c[n] = a[n]*w[0] + a[n+1]*w[1] + a[n+2]*w[2]; 
  }
}

int main (int argc, char * argv[]) {
  struct timespec start, end;
  unsigned long diff, total=0, min=1234567890;
  int n=0;

  if (argc == 2) {
    //    sscanf(argv[1],"%u", &mask_len);
  }

  printf("Assuming clock of %.1f GHz\n", CLOCK_FREQ_GHZ);
  total = 0;
  for (n=0; n<N_TESTS; n++) {
    clock_gettime(CLOCK_THREAD_CPUTIME_ID, &start);
    do_test1();
    clock_gettime(CLOCK_THREAD_CPUTIME_ID, &end);
    diff = (1000000000 * (end.tv_sec - start.tv_sec)) +
      end.tv_nsec - start.tv_nsec;
    total += diff;
    if (diff < min)
      min = diff;
  }
#if 1
  printf("Time per test:            minimum %6.3f us, average %6.3f\n",
	 min/1000.0, total/(1000.0*N_TESTS));
  printf("Time per array element:   minimum %6.3f ns, average %6.3f ns\n",
	 min/(1.0*ARRAY_SIZE), total/(1.0*N_TESTS*ARRAY_SIZE));
#endif
  printf("Cycles per array element: minimum %6.3f,    average %6.3f\n",
	 CLOCK_FREQ_GHZ*min/(ARRAY_SIZE), CLOCK_FREQ_GHZ*total/(N_TESTS*ARRAY_SIZE));

  exit(0);
 
}
