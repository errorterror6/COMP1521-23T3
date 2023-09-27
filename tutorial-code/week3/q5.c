// A simple program that will read 10 numbers into an array

// #define N_SIZE 10

// #include <stdio.h>

// int main(void) {
//     int i;
//     int numbers[N_SIZE] = {0};

//     i = 0;
//     while (i < N_SIZE) {
//         scanf("%d", &numbers[i]);
//         i++;
//     }
// }

// A simple program that will read 10 numbers into an array

#define N_SIZE 10

#include <stdio.h>

int main(void) {
    int i;
    int numbers[N_SIZE] = {0};

    i = 0;
loop_start:
    if (i >= N_SIZE) goto loop_end;
loop_body:
    scanf("%d", &numbers[i]);
    i++;
    goto loop_start;
loop_end:
    return 0;
}