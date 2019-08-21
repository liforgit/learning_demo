#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// 定义一个结点
struct node{
    char *name;
    int score;

    struct node *next;
};
typedef struct node student;

// 创建一个结点
student *create_student(char *name, int score){
    student *student_1 = NULL;
    student_1 = (student *)malloc(sizeof(student));
    if(student_1 == NULL){
        puts("can not create a node!\n");
        return NULL;
    }else{
        student_1->name = name;
        student_1->score = score;
        student_1->next = NULL;
    }
}

// 尾插入一个结点
void toil_insert(student *header, student *new_student){
    student *p_student = header;
    while(NULL != p_student->next){
        p_student = p_student->next;
    }
    p_student->next = new_student;
    new_student->next = NULL;
}

// 头插一个结点
void top_insert(student *header, student *new_student){
    student *p_student = header;
    new_student->next = p_student->next;
    p_student->next = new_student;
}

// 遍历链表
void print_all(student *header){
    student *p_student = header;
    p_student = p_student->next;
    while(p_student->next != NULL){
        printf("name:%s\t score:%d\n", p_student->name, p_student->score);
        p_student = p_student->next;
    }
    printf("name:%s\t score:%d\n", p_student->name, p_student->score);
}

// 根据名字删除指定结点
void delete_student(student *header, char *name){
    student *p_student = header->next;
    student *pre_student = NULL;

    while(strcmp(p_student->name, name) != 0 && p_student->next != NULL){
        pre_student = p_student;
        p_student = p_student->next;
    } 

    if(strcmp(p_student->name, name) == 0){
        if(p_student->next == NULL){
            pre_student->next = NULL;
            free(p_student);
        }else{
            pre_student->next = p_student->next;
            free(p_student);
        }
    }else {
        printf("can not find student named %s\n", name);
    }
}

int main(){
    student *header = create_student("", 0);
   
    student *lee = create_student("Lee", 90);
    student *wang = create_student("Wang", 80);
    student *zhang = create_student("Zhang", 80);

    toil_insert(header, wang);
    toil_insert(header, zhang);
    top_insert(header, lee);
    print_all(header);

    puts("delete student wang");
    delete_student(header, "Wang");
    print_all(header);

    puts("delete student zhang");
    delete_student(header, "Zhang");
    print_all(header);

    return 0;
}




