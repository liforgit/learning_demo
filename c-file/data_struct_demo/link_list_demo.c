#include <stdio.h>

// 创建链表
typedef struct student{
    int score;

    struct student* next;
}link_list;

// 初始化链表
link_list *creat(int n){
    link_list *head, *node, *end;
    head = (link_list*)malloc(sizeof(link_list));
    end = head;
    for(int i=0; i<n; i++){
        node = (link_list*)malloc(sizeof(link_list));
        scanf("%d", &node->score);
        end->next = node;
        end = node;
    }
    end->next = NULL;
    return head;
}

// 修改链表结点
void change(link_list *list, int n){
    link_list *t = list;
    int i = 0;
    while (i < n && t != NULL){
        t = t->next;
        i++;
    }
    if (t != NULL){
        puts("输入要修改的值");
        scanf("%d", &t->score);
    }else{
        puts("结点不存在");
    }
}

// 删除结点
void delet(link_list *list, int n){
    link_list *t = list, *in;
    int i = 0;
    while(i < n && t != NULL){
        in = t;
        t = t->next;
        i++;
    }
    if(t != NULL){
        in->next = t->next;
        free(t);
    }else {
        puts("结点不存在");
    }
}

// 插入结点
void insert(link_list *list, int n){
    link_list *t = list, *in;
    int i = 0;
    while(i < n && t != NULL){
        t = t->next;
        i++;
    }
    if(t != NULL){
        in = (link_list*)malloc(sizeof(link_list));
        puts("输入要插入的值");
        scanf("%d", &in->score);
        in->next = t->next;
        t->next = in;
    }else{
        puts("结点不存在");
    }
}

int main(){
        
    return 0;
}
