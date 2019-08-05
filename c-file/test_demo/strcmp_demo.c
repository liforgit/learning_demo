#include <stdio.h>
#include <string.h>

int main(){
    char str_a[] = "test string one";
    char str_b[] = "test string two";
    char str_c[] = "test string one";

    int cmp_result = strcmp(str_a, str_b);
    int cmp_result_2 = strcmp(str_a, str_c);
    printf("the result is %d\n", cmp_result);
    printf("the result is %d\n", cmp_result_2);

    return 0;
}
