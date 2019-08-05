#include <stdio.h>

void static_variable();

int main(){
    int i;
    for(i= 0; i<7; i++){
        static_variable();
    }
    return 0;
}

void static_variable(){
    int a = 1;
    static int b = 1;

    printf("a = %d \t b = %d\n", a++, b++);
}
