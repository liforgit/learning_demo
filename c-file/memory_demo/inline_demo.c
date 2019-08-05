#include <stdio.h> 

static inline char* getString(){
    return "hello inline function!";
}

int main(void){
    puts(getString());
    return 0;
}
