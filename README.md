# CUDA
Simple CUDA projects


To use CUDA on Linux, you need to turn your nvidea card on:
```sh
 # tee /proc/acpi/bbswitch <<< ON
 ```

To turn off the nvidia card after using CUDA do:
```sh
 # rmmod nvidia_uvm
 # rmmod nvidia
 # tee /proc/acpi/bbswitch <<< OFF
 ```

Compiling:
```sh
 $ nvcc test.cu -o test
 ```
 
 Tutorials:  
- https://www.nvidia.com/docs/IO/116711/sc11-cuda-c-basics.pdf  
- https://devblogs.nvidia.com/even-easier-introduction-cuda/  
