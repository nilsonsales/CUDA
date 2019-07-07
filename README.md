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

Compuling the codes:
```sh
 $ nvcc test.cu -o test
 ```
