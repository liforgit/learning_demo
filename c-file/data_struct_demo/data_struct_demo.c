#include <stdio.h>
#include <string.h>

typedef struct{
    int age;
    char name[81];
}STUDENT;

int main(){
    STUDENT student1;
    STUDENT* student;
    student = &student1;
    strcpy(student->name, "Lee");
    student->age = 22;

    printf("name: %s\n", student->name);
    printf("the age of Lee is %d\n", student->age);
    return 0;
}
