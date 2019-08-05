#include <stdio.h>
#include <string.h>

typedef struct{
    char title[50];
    char author[50];
    char subject[100];
    int book_id;
}Book;

void print_struct(Book *book);

int main(int argc, char* argv[]){
    //定于结构体变量
    Book book1, book2;
    //初始化
    strcpy(book1.title, "c language");
    strcpy(book1.author, "Lee");
    strcpy(book1.subject, "编程语言");
    book1.book_id = 123;

    strcpy(book2.title, "cpp language");
    strcpy(book2.author, "Lee");
    strcpy(book2.subject, "编程语言");
    book2.book_id = 456;

    print_struct(&book1);
    print_struct(&book2);

    return 0;
}

void print_struct(Book *book){
     printf("book.title:%s\n", book->title);       
     printf("book.author:%s\n", book->author);
     printf("book.subject:%s\n", book->subject);
     printf("book.book_id:%d\n", book->book_id);
}
