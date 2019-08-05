#include <iostream>
#include "cpp_header.h"
using namespace std;

int cus_add(int a, int b, int c){
    int temp = 0;
    temp = a+b+c;
    cout << "temp=" << temp << "\n";    
    return temp;
}
