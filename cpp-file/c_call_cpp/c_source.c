#include <stdio.h>

extern int cus_add(int a, int b, int c);
int main(int argc, char* argv[]){
    printf("%d + %d + %d = %d\n", 7, 8, 5, cus_add(7, 8, 5));
    return 0;
}
