#include <stdio.h>

int main(int argc, char* argv[]){
    //定义书籍列表的结构体
    struct Book{
        char title[50];
        char author[50];
        char subject[100];
        int book_id;
    }book= {"c语言", "Lee", "编程语言", 123};

    printf("title:%s\n author:%s\n subject:%s\n book_id:%d\n", book.title, book.author, book.subject, book.book_id);
    return 0;
}
