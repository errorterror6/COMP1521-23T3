// // Print every third number from 24 to 42.
// #include <stdio.h>

// int main(void) {
//     // This 'for' loop is effectively equivalent to a while loop.
//     // i.e. it is a while loop with a counter built in.
//     for (int x = 24; x < 42; x += 3) {
//         printf("%d\n", x);
//     }
// }

// Print every third number from 24 to 42.
#include <stdio.h>

int main(void) {
    // This 'for' loop is effectively equivalent to a while loop.
    // i.e. it is a while loop with a counter built in.
    // for (int x = 24; x < 42; x += 3) {
    //     printf("%d\n", x);
    // }

    int x = 24;
loop_label:
    if (x >= 42) goto loop_end;
inside_loop:
    printf("%d\n", x);
    x += 3;
    goto loop_label;
loop_end:
    return 0;

}