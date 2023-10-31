#include <stdio.h>
#include <errno.h>

int main() {
    FILE *q1 = fopen("q6.txt", "r");
    if (q1 == NULL) {
        perror("q6.txt");
    }
    // errno = ENOENT;
    // fclose(q1);
    return 0;
}