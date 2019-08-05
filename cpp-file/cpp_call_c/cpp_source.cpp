#include <iostream>
#include "c_header.h"
int main(int argc, char* argv[]){
    custom_print();
    printf("%d + %d = %d\n", 3, 5, add(3,5));
    return 0;
}
