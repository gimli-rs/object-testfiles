// test_comdat.cpp - Test file to generate COMDAT records
// Compile with: wpp386 -d3i test_comdat.cpp

#include <stdio.h>

// Template function - should generate COMDAT
template<typename T>
T max_value(T a, T b) {
    return (a > b) ? a : b;
}

// Inline function - should generate COMDAT with -d3i
inline int add(int a, int b) {
    return a + b;
}

// Another inline function
inline int multiply(int x, int y) {
    return x * y;
}

// Template class with inline methods
template<typename T>
class Container {
private:
    T value;
public:
    Container(T v) : value(v) {}

    inline T get() const { return value; }
    inline void set(T v) { value = v; }
};

// Regular function
void regular_function() {
    printf("Regular function\n");
}

int main() {
    // Use template functions to force instantiation
    int a = 5, b = 10;
    int max_int = max_value(a, b);

    float f1 = 3.14f, f2 = 2.71f;
    float max_float = max_value(f1, f2);

    // Use inline functions
    int sum = add(3, 4);
    int product = multiply(5, 6);

    // Use template class
    Container<int> int_container(100);
    int_container.set(200);
    int val = int_container.get();

    Container<double> double_container(3.14);
    double_container.set(2.71);
    double dval = double_container.get();

    // Use regular function
    regular_function();

    printf("Max int: %d\n", max_int);
    printf("Max float: %f\n", max_float);
    printf("Sum: %d, Product: %d\n", sum, product);
    printf("Container values: %d, %f\n", val, dval);

    return 0;
}
