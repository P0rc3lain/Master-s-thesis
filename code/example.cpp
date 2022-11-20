#include <iostream>

class Greater {
public:
    void say_hello() {
        std::cout<< "Hello World!" << std::endl;
    }
};

int main() {
    auto my_greator = Greater{};
    my_greator.say_hello();
    return 0;
}