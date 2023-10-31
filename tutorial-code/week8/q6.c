#include <stdio.h>
#include <errno.h>

int main(int argc, char *argv[]) {
    FILE *q1 = fopen(argv[1], "a");
    if (q1 == NULL) {
        perror(argv[1]);
    }
    char str[6565];


    fgets(str, 33333, q1);
    fprintf(stdout, "%s", str);

    return 0;
}