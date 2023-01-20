#include <iostream>

class greater {
public:
    void say_hello() {
        std::cout << "Hello World!" << std::endl;
    }
};

int main() {
    auto my_greator = greater{};
    my_greator.say_hello();
    return 0;
}