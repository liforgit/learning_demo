#include <stdio.h>
#include "../common/book.h"

#define N 10

__global__ void add(int *a, int *b, int *c){
	int tid = blockIdx.x;
	if (tid < N){
		c[tid] = a[tid] + b[tid];
	}
}

int main(void) {
	int a[N], b[10], c[N];
	int *dev_a, *dev_b, *dev_c;

	// 在GPU上分配内存
	HANDLE_ERROR(cudaMalloc((void**)&dev_a, N*sizeof(int)));
	HANDLE_ERROR(cudaMalloc((void**)&dev_b, N*sizeof(int)));
	HANDLE_ERROR(cudaMalloc((void**)&dev_c, N*sizeof(int)));

	// 在cpu上为数组‘a' 和’b'赋值
	for (int i=0; i<N; i++){
		a[i] = -i;
		b[i] = i*i;
	}

	// 将数组‘a' 和’b‘ 复制到gpu
	HANDLE_ERROR(cudaMemcpy(dev_a, a, N*sizeof(int),cudaMemcpyHostToDevice));
	HANDLE_ERROR(cudaMemcpy(dev_b, b, N*sizeof(int),cudaMemcpyHostToDevice));
	add<<<N, 1>>>(dev_a, dev_b, dev_c);

	// 将数组’c‘从gpu复制到cpu
	HANDLE_ERROR(cudaMemcpy(c, dev_c, N*sizeof(int),cudaMemcpyDeviceToHost));

	//显示结果 
	for (int i=0; i<N; i++){
		printf("%d + %d = %d\n", a[i], b[i], c[i]);
	}

	//释放在gpu上分配的内存
	cudaFree(dev_a);
	cudaFree(dev_b);
	cudaFree(dev_c);

	return 0;
}
