
#include <iostream>
#include <string>

using namespace std;

class Person {
    public:
        // 成员变量
        string name;
        int age;
        // 成员函数
        int _add(int a, int b);
};

int Person::_add(int a, int b){
    return a+b;
}

int main(){
    Person person1;
    person1.name = "Lee";
    person1.age = 22;
    cout << person1.name << person1.age << endl;
    cout << person1._add(3, 8) << endl;
    return 0;
}
