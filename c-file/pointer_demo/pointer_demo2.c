#include <stdio.h>

#define ROW 2
#define CUL 3

int main(){
    /*int person[ROW][CUL]= {{41,22,3},{4,95,6}};*/
    /*int i,j;*/
    /*for(i=0; i<ROW; i++){*/
        /*for(j=0; j<CUL; j++){*/
            /*printf("%d\n",person[i][j]);*/
        /*}*/
    /*}*/

    int numbers[6] = {[4]=8};
    int i;
    for(i=0; i<6; i++){
        printf("%d\n", numbers[i]);
    }
    return 0;
}
