#include <stdio.h>

int main(){
    int a = 8;
    int b = 3;
    int* ptr_a = &a;  
    int* ptr_b = &b;
    
    printf("a = %d\n", *ptr_a);
    printf("b = %d\n", *ptr_b);
    return 0;
}
