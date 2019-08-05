#include <stdio.h>

int main(){
    char string_char[81] = "a string in an array!";
    char* string_ptr = "pointing to a string!";

    puts("puts some strings to console!");
    puts(string_char);
    puts(string_ptr);
    putchar(string_char[0]);
    putchar(*string_ptr);
    putchar("\n")
    return 0;
}
