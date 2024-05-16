#include <iostream>
#include "lib/math_functions.h"

int main()
{
    int result1 = add(5, 3);
    double result2 = multiply(4.5, 2.0);

    std::cout << "Sum: " << result1 << std::endl;
    std::cout << "Product: " << result2 << std::endl;

    return 0;
}
