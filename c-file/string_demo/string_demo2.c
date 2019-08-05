#include <stdio.h>
#define STR_LEN 81
int main(){
    char string_char[STR_LEN];

    puts("Please Enter a string:");
    gets(string_char);
    puts(string_char);

    puts("Please Enter a string again:");
    scanf("%s", string_char);
    puts(string_char);
    puts("DONE");
    return 0;
}
