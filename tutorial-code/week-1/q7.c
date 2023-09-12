#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    int sum = 0;
    for (int i = 0; i < argc; i++) {
        sum = sum * atoi(argv[i]);
    }
    printf("multiplication of command-line arguments = %d\n", sum);
    return 0;
}