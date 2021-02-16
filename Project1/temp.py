# Starter code based on https://projects.raspberrypi.org/en/projects/temperature-log 
# and https://github.com/raspberrypilearning/temperature-log
from gpiozero import CPUTemperature
from time import sleep, strftime, time
import matplotlib.pyplot as plt
import matplotlib.animation as animation
import datetime
import subprocess
import os

fig, axs = plt.subplots(2,2)
x = []
temp_y = []
freq_y = []
volt_y = []
t_start = time()

def animate(i,x,temp_y,freq_y,volt_y):
    cpu = CPUTemperature()
    temp = cpu.temperature
    
    get_freq = os.popen('vcgencmd measure_clock arm')
    freq = int(get_freq.read()[14:])

    get_volts = os.popen('vcgencmd measure_volts core')
    volts = float(get_volts.read()[5:-2])

    temp_y.append(temp)
    freq_y.append(freq)
    volt_y.append(volts)
    x.append(time() - t_start)
    
    # Print completion time for 100 frames to determine minimum interval
    '''if(len(x) == 100):
        print(time()-t_start)   
    '''
    
    #automate C/C++ benchmark test
    if(len(x) == 10):
        task = os.popen('cd ~/Documents/exploringRPi/chp05/performance && ./run_cpp')
        print(task.read())
    
    # Draw x and y Lists
    axs[0,0].plot(x,temp_y) # Temperature
    axs[1,0].plot(x,freq_y) # Freq
    axs[0,1].scatter(freq_y,temp_y) # Temp vs. Freq
    axs[1,1].scatter(freq_y,volt_y) # Volt vs. Freq
    
    # Format Plot
    plt.xticks(rotation = 45, ha = 'right')
    plt.subplots_adjust(bottom = 0.3)
    plt.tight_layout()
    axs[0,0].set_title("CPU Temperature over Time")
    axs[0,0].set_ylabel("Temperature (C)")
    axs[1,0].set_title("CPU Frequency over Time")
    axs[1,0].set_ylabel("Frequency (Hz)")
    axs[0,1].set_title("Temperature vs. Frequency")
    axs[0,1].set_xlabel("Frequency (Hz)")
    axs[1,1].set_ylabel("Temperature (C)")
    axs[1,1].set_title("Voltage vs. Frequency")
    axs[1,1].set_xlabel("Frequency (Hz)")
    axs[1,1].set_ylabel("Voltage (V)")

ani = animation.FuncAnimation(fig,animate,fargs=(x,temp_y,freq_y,volt_y),interval=200,frames=100,repeat=False)
plt.show()
