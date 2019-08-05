#include <stdio.h>
#define MONTH 12
int main(){
    int days[MONTH] = {31, 28, 31, 30, 31, 30, 31, 30, 31, 30, 31, 30};
    int i;
    int* ptr_days = days;
    for(i=0; i<MONTH; i++){
        printf("MONTH %d has %d days\n", i+1, *(ptr_days + i));
    }
    return 0;
}
