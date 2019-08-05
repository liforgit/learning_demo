#include <stdio.h>
#define SIZE 4
int main(){
    short datas[SIZE];
    short* ptr_datas;

    double bills[SIZE];
    double* ptr_bills;
    int index;

    ptr_datas = datas;
    ptr_bills = bills;

    printf("\t%4s\t %16s\n", "short", "double");
    for(index=0; index<SIZE; index++){
        printf("%d\t%p\t %p\n", index, ptr_datas+index, ptr_bills+index);
    }

    return 0;
}
