#include <stdio.h>

int add(int a, int b){
    return a+b;
}

int main(int argc, char* argv[]){
    int m,n;
    scanf("%d%d", &m,&n);
    int sum = add(m, n);
    printf("sum=%d\n",sum);
    return 0;
}
