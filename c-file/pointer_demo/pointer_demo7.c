#include <stdio.h>
#define ROW 4
#define CUL 2
int main(){
    int zippo[ROW][CUL] = {{4, 2}, {3, 3}, {5, 7}, {8, 2}};
    int i;
    int j;
    for(i=0; i<ROW; i++){
        for(j=0; j<CUL; j++){
            printf("%d\t", zippo[i][j]);
        }
        printf("\n");
    }
    /*printf("\n");*/
    printf("zippo = %p, zippo+1 = %p\n", zippo, zippo+1);
    printf("zippo[0] = %p, zippo[0] + 1 = %p\n", zippo[0], zippo[0] + 1);
    printf("*zippo = %p, *zippo + 1 = %p\n", *zippo, *zippo + 1);
    
    printf("zippo[0][0] = %d\n", zippo[0][0]);
    printf("*zippo[0] = %d\n", *zippo[0]);
    printf("**zippo = %d\n", **zippo);
    printf("zippo[2][1] = %d\n", zippo[2][1]);
    printf("*(*(zippo + 2) + 1) = %d\n", *(*(zippo + 2) + 1));
    return 0;
}
