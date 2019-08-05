#include <stdio.h>

extern int cus_sum(int a, int b, int c); /*默认是extern*/

int main(){
    printf("cus_sum = %d\n", cus_sum(1, 3, 7));
    return 0;
}
