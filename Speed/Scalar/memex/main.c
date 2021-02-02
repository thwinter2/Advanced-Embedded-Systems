#include <stdio.h>
#include <time.h>
#include <inttypes.h>

#define MAX_ARRAY_SIZE (1UL<<24)

uint32_t A[MAX_ARRAY_SIZE], B[MAX_ARRAY_SIZE];

void pollute_cache(void) {
  uint32_t dummy;
  for (int i=0; i<MAX_ARRAY_SIZE; i++)
    dummy = A[i];
}

unsigned long test(unsigned int ArraySize, unsigned int Stride, unsigned int MaxTimes) {
  struct timespec start, end;
  unsigned long diff, total=0; // Times in ns
  volatile uint32_t dummy;
  
  for (int times=0; times<MaxTimes; times++){
    /*    for (int i=0; i<ArraySize; i++)
      dummy = B[i];
    */
    clock_gettime(CLOCK_THREAD_CPUTIME_ID, &start);
    for (int i=0; i<ArraySize; i += Stride)
      //          for (int i=ArraySize; i>0; i -= Stride)
      dummy = A[i];
    clock_gettime(CLOCK_THREAD_CPUTIME_ID, &end);
    diff = (1000000000 * (end.tv_sec - start.tv_sec)) +
      end.tv_nsec - start.tv_nsec;
    total += diff;
  }
  return total*Stride*1000.0/(ArraySize*MaxTimes);
}

int main(int argc, char * argv[]) {
  unsigned int size_wds, stride_wds, tests=10;
  unsigned long time_ps;
  
  for (size_wds = 1UL<<12; size_wds < 1UL<<21 /* MAX_ARRAY_SIZE */ ; size_wds <<= 4) {
    for (stride_wds = 1; stride_wds <= 65536; stride_wds <<= 1) {
      time_ps = test(size_wds, stride_wds, tests);
      printf("Size %8u Stride %5u Time %8lu\n", size_wds*4, stride_wds*4, time_ps);
    }
  }
}
