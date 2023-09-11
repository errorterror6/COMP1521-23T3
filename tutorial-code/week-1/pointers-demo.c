#include <stdio.h>
void test_function(int *pointer_to_number);

int main() {
    int number = 36;
    // nmonic: & = address!
    int *pointer_to_number = &number;
    // think of * as an operator: so (*pointer_to_number) is of type int.
    printf("pointer_to_number: %d\n", pointer_to_number);
    printf("*pointer_to_number: %d\n", *pointer_to_number);
    test_function(pointer_to_number);
    return 0;
}

void test_function(int *pointer_to_number) {
    printf("function pointer_to_number: %d\n", pointer_to_number);
    printf("function *pointer_to_number: %d\n", *pointer_to_number);
}