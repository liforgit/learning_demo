#include <iostream>
#define NUM 3

using namespace std;
int main(){
    int a[NUM] = {3, 7, 9};
    int *ptr_a = a;

    for(int i=0; i<NUM; i++){
        cout<< "address-->" << ptr_a << "\t";
        cout<< "value-->" << *ptr_a << endl;
        ptr_a++;
    }
    return 0;
}
