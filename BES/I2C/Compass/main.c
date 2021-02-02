#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <linux/i2c-dev.h>
// #include "i2c-dev.h"
#include <fcntl.h>
#include <unistd.h>
#include <stdint.h>

#include "HMC5883L.h"

#define DELAY (10000)

extern int set_i2c_register(int file, unsigned char addr, unsigned char reg, unsigned char value);

extern int get_i2c_register(int file,
                            unsigned char addr,
                            unsigned char reg,
                            unsigned char *val);
extern int get_i2c_registers(int file,
		      unsigned char addr,
		      unsigned char first_reg,
		      unsigned char num_regs,
		      unsigned char *val);


typedef struct {
  short min, max;
} LIMITS_T;

LIMITS_T x_lim = {0,0}, y_lim = {0,0}, z_lim = {0,0};


int configure_compass(int file,
		      unsigned char address) {
  uint8_t compass_ID[3];
  
  if (get_i2c_register(file, address, ID_REG_A, &(compass_ID[0])))
    return 1;
  if (get_i2c_register(file, address, ID_REG_B, &(compass_ID[1])))
    return 1;
  if (get_i2c_register(file, address, ID_REG_C, &(compass_ID[2])))
    return 1;

  if (strncmp((char *) compass_ID, "H43", 3)) {
    printf("Compass not found. Expected H43, got %s.\n", compass_ID);
    return 1;
  } else {
    printf("Compass found.\n");
  }
  
  // 4 averages, 30 Hz, normal measurement. 0101 0100
  if (set_i2c_register(file, address, CONFIG_A_REG, 0x54))
    return 1;
  // Gain 
  if (set_i2c_register(file, address, CONFIG_B_REG, 0x00))
    return 1;
  // Operation mode
  if (set_i2c_register(file, address, MODE_REG, IDLE_MODE))
    return 1;

  return 0;
}

float calc_heading(float mx, float my) {
  float h = atan2f(my, mx)*(180/M_PI);
  if (h<0)
    h += 360; 
  return h;
}

void update_limits(short x, short y, short z) {
  if (x < x_lim.min)
    x_lim.min = x;
  if (x > x_lim.max)
    x_lim.max = x;
  if (y < y_lim.min)
    y_lim.min = y;
  if (y > y_lim.max)
    y_lim.max = y;
  if (z < z_lim.min)
    z_lim.min = z;
  if (z > z_lim.max)
    z_lim.max = z;
}

int main(int argc, char *argv[])
{
  int address, i;
  uint8_t status;
  int i2c_file;
  short x_val, y_val, z_val;
  uint8_t data[6];
  float strength;
  
  if ((i2c_file = open("/dev/i2c-1", O_RDWR)) < 0) {
    perror("Unable to open i2c control file");
    exit(1);
  }

  address = COMPASS_DEV_ADDR;

  if (configure_compass(i2c_file, address)) {
    printf("Unable to configure compass\n");
    return 1;
  }
  
  while(1){

    // Start measurement
    set_i2c_register(i2c_file, address, MODE_REG, SINGLE_MEASUREMENT_MODE);  
    // Await data ready
    do {
      get_i2c_register(i2c_file, address, STATUS_REG, &status);
      //    printf(".");
    } while (!(status & 1));
    // printf("\n");
    
#if 0 // Read each field strength byte individually
    for (i=0; i<6; i++) {
      get_i2c_register(i2c_file, address, XH_REG+i, &(data[i]));
      printf("%02x  ", data[i]);
    }
#else // read all field strength bytes in one transaction
    get_i2c_registers(i2c_file, address, XH_REG, 6, data);
    for (i=0; i<6; i++) {
      printf("%02x  ", data[i]);
    }
#endif

    x_val = (((int16_t) data[0]) << 8) + data[1];
    z_val = (((int16_t) data[2]) << 8) + data[3];
    y_val = (((int16_t) data[4]) << 8) + data[5];

    update_limits(x_val, y_val, z_val);

    strength = sqrt(x_val*x_val + y_val*y_val + z_val*z_val);
#if 1
      printf("M_x = %4d, M_y = %4d, M_z = %4d, H = %6.2f S = %6.2f\r",
	     x_val, y_val, z_val, calc_heading(x_val, y_val), strength);
#else
    printf("X: %4d~%4d \tY: %4d~%4d \tZ: %4d~%4d \tH = %6.2f\r",
	   x_lim.min, x_lim.max, y_lim.min, y_lim.max, z_lim.min, z_lim.max, calc_heading(x_val, y_val));
#endif
  }

  return 0;
  
}
