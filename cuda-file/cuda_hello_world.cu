#include <stdio.h>
#include <../common/book.h>

__global__ void helloWorldFromGPU(void){
	printf("Hello World from GPU!\n");
}

__global__ void add(int a, int b, int *c){
	*c = a + b;
}

int main(void){
	printf("hello from cpu!\n");
	helloWorldFromGPU<<<1, 10>>>();
	//int *c;
	//int dev_c;
	//HANDLE_ERROR(cudaMalloc((void**)&c, sizeof(int)));
	//add<<<1,1>>>(2, 7, c);
	//HANDLE_ERROR(cudaMemcpy(&dev_c, c, sizeof(int),cudaMemcpyDeviceToHost));
	//printf("dev_c=%d\n",dev_c); 
//	printf("2 + 7 = %d\n", c);
	//cudaFree(c);
	cudaDeviceReset();
	return 0;
}
