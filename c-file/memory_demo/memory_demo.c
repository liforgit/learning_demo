#include <stdio.h>
#include <stdlib.h>

int main(){
    int n;
    int* ptr_int;
    puts("please enter size of array:");
    scanf("%d", &n);
    ptr_int = (int*)malloc(n * sizeof(int));
    for(int i=0; i<n; i++){
        ptr_int[i] = i;
    }
    for(int i=0; i<n; i++){
        printf("%d\n", ptr_int[i]);    
    }

    free(ptr_int);
    return 0;
}
