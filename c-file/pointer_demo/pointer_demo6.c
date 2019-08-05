#include <stdio.h>
#define SIZE 5
int sum(int* numbers, int size);

int main(){
    int numbers[SIZE] = {3, 8, 9, 3, 1};
    printf("the sum of numbers are %d \n", sum(numbers, SIZE));
    return 0;
}

int sum(int* numbers, int size){
    int i;
    int total = 0;
    for(i=0; i<size; i++){
        total += *(numbers + i);
    }
    return total;
}
