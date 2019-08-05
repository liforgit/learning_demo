#include <stdio.h>

int main(int argc, char* argv[]){
    int count;
    printf("the command line has %d arguments\n", argc - 1);
    for(count=1; count<argc; count++){
        printf("count:%d\t %s\n", count, argv[count]);
    }
    return 0;
}
