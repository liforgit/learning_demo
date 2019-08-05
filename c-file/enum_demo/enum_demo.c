#include <stdio.h>
#include <stdlib.h>

 /*! \enumDaye
  *
  *  Detailed description
  */
 enum Day { Mon=1, Tue, Web, Thr, Fri, Sat, Sun };

int main(int argc, char* argv[]){
    enum Day day;
    printf("请选择星期：（1：Mon, 2:Tue, 3:Web, 4:Thr, 5:Fri, 6:Sat, 7:Sun）");
    scanf("%d", &day);
    switch(day){
        case(Mon):
            printf("你选择了星期一\n");
            break;
        case(Tue):
            printf("你选择了星期二\n");
            break;
        case(Web):
            printf("你选择了星期三\n");
            break;
        case(Thr):
            printf("你选择了星期四\n");
            break;
        case(Fri):
            printf("你选择了星期五\n");
            break;
        case(Sat):
            printf("你选择了星期六\n");
            break;
        case(Sun):
            printf("你选择了星期日\n");
            break;
        default:
            printf("你没有选择任何星期\n");
    }
    return 0;
}
