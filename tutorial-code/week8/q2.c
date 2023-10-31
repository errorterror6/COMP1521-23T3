#include <stdio.h>
#include <string.h>
#include <errno.h>

#define MAX_CHAR 65536

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <substring> [files]\n", argv[0]);
        return 1;
    } else if (argc == 2) {
        char str[MAX_CHAR];
        int line_number = 0;
        char *substring = argv[1];
        while (fgets(str, MAX_CHAR, stdin) != NULL) {
            //we need the "substring"
            if (strstr(str, substring) != NULL) {
                printf("%s: %d: %s", "stdin", line_number, str);
            }
            line_number++;
        }
       
        //loop back to scanning until no more lines
    } else {
        //loop through the files
        for (int arg = 2; arg < argc; arg++) {
            //check if they contain the string specified
            FILE *stream = fopen(argv[arg], "r");
            if (stream == NULL) {
                fprintf(stderr, "%s: %s", argv[0], strerror(errno));
                return 1;
            }
            //stream pointer is at start of file
            char str[MAX_CHAR];
            int line_number = 0;
            char *substring = argv[1];
            while (fgets(str, MAX_CHAR, stream) != NULL) {
                //we need the "substring"
                if (strstr(str, substring) != NULL) {
                    //print any lines they contain
                    printf("%s: %d: %s", "stdin", line_number, str);
                }
                line_number++;
            }

            

        }


    }

    return 0;

}