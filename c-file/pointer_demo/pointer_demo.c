#include <stdio.h>

#define MONTHES 12

int main(){
    const int days[MONTHES] = {31, 28, 31, 30, 31, 30, 31, 30, 31, 30, 31, 30};    
    int i;
    for(i=0; i<MONTHES; i++){
        printf("Month %d has %d days\n",i+1, days[i]);
    }
    return 0;
}
