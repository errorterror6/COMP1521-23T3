// // Squares a number, unless its square is too big for a 32-bit integer.
// // If it is too big, prints an error message instead.

// #include <stdio.h>

// #define SQUARE_MAX 46340

// int main(void) {
//     int x, y;

//     printf("Enter a number: ");
//     scanf("%d", &x);

//     if (x > SQUARE_MAX) {
//         printf("square too big for 32 b {its\n");
//     } else
//         y = x * x;
//         printf("%d\n", y);
//     }

//     return 0;
// } cntrl + /

#include <stdio.h>

#define SQUARE_MAX 46340

int main(void) {
    int x, y;

    printf("Enter a number: ");
    scanf("%d", &x);

    if (x <= SQUARE_MAX) goto if_else_statement;
    printf("square too big for 32 bits\n");
    goto epilogue;

if_else_statement:
    y = x * x;
    printf("%d\n", y);

epilogue:
    return 0;
}