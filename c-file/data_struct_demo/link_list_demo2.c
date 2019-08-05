#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/*定义结点*/
struct list_node{
    int data;

    struct list_node *next;
};

typedef struct list_node list_single;

list_single *create_list_node(int data){
    list_single *node = NULL;
    node = (list_single*)malloc(sizeof(list_single));
    if(node == NULL){
        printf("malloc fail\n");
    }

    memset(node, 0, sizeof(list_single));
    node->data = data;
    node->next = NULL;
    return node;
}

int main(){
    int data = 10;
    list_single *node_ptr = create_list_node(data);
    printf("node_ptr->data = %d\n", node_ptr->data);
    printf("node_ptr->next = %d\n", node_ptr->next);
    free(node_ptr);
    return 0;
}
