#include <stdio.h>


__global__ void cuda_hello(int* n){
    printf("Hello World from GPU!\n");
}

int main() {

    cuda_hello<<<1,1>>>();

    return 0;

}