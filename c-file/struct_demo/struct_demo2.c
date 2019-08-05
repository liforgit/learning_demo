#include <stdio.h>
#include <string.h>
struct Book{
    char title[50];
    char author[50];
    char subject[100];
    int book_id;
};                        

int main(int argc, char* argv[]){

    //定于结构体变量
    struct Book book1, book2;
    //初始化
    strcpy(book1.title, "c language");
    strcpy(book1.author, "Lee");
    strcpy(book1.subject, "编程语言");
    book1.book_id = 123;

    strcpy(book2.title, "cpp language");
    strcpy(book2.author, "Lee");
    strcpy(book2.subject, "编程语言");
    book2.book_id = 456;

    // 打印信息
    printf("book1.title:%s\n", book1.title);
    printf("book1.author:%s\n", book1.author);
    printf("book1.subject:%s\n", book1.subject);
    printf("book1.book_id:%d\n", book1.book_id);

    printf("book2.title:%s\n", book2.title);
    printf("book2.author:%s\n", book2.author);
    printf("book2.subject:%s\n", book2.subject);
    printf("book2.book_id:%d\n", book2.book_id);
    return 0;
}
