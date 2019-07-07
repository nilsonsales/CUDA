#include <stdio.h>
#include <cuda.h>
#include <stdlib.h>

#define N 512

__global__ void add(int *a, int *b, int *c){
    c[blockIdx.x] = a[blockIdx.x] + b[blockIdx.x];  // Use threadIdx.x for multiple threads

}


// Atribute random values to elements of a[n]
void random_ints(int *a, int n){
   for(int i = 0; i < n; ++i)
       a[i] = rand() %5000;
}

// Print all elements of a[n]
void printv(int *a, int n){
    printf("[ ");
    for(int i = 0; i < N; ++i){
        printf("%d ", a[i]);
    }
    printf("]\n");
}


int main(){
    int *a, *b, *c;  // Host copies of a, b, c
    int *dev_a, *dev_b, *dev_c;  // Device copies of a, b, c
    int size = N * sizeof(int);

    // Allocate space for device copies a, b, c
    cudaMalloc((void **) &dev_a, size);
    cudaMalloc((void **) &dev_b, size);
    cudaMalloc((void **) &dev_c, size);

    // Allocate space for host copies of a, b, c and setup input values
    a = (int *) malloc(size);
    b = (int *) malloc(size);
    c = (int *) malloc(size);

    random_ints(a, N);
    random_ints(b, N);

    printv(a, N);
    printv(b, N);


    // Copy inputs to device
    cudaMemcpy(dev_a, a, size, cudaMemcpyHostToDevice);
    cudaMemcpy(dev_b, b, size, cudaMemcpyHostToDevice);

    // Launch add kernel on GPU
    add<<<N,1>>>(dev_a, dev_b, dev_c);  // N blocks, 1 thread

    // Copy result back to host
    cudaMemcpy(c, dev_c, size, cudaMemcpyDeviceToHost);

    printv(c, N);

    // Clean up
    free(a); free(b); free(c);
    cudaFree(dev_a); cudaFree(dev_b); cudaFree(dev_c);

    return 0;
}