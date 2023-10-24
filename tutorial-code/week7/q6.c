#include <stdio.h>
#include <stdint.h>



uint32_t six_middle_bits(uint32_t u) {
    return ((0x3F << 13) & u) >> 13;
}

int main () {
    printf("%d\n", six_middle_bits(0b00000000000000101000000000000000));
    return 0;
}

0011 1111
 3      F











// 0000 0000 0000 0|010  100|0 0000 00//00 0000
//                  111  111
//     and:         010  100
//     or:          111  111
// we need:
// 1. a mask of 0011 1111     -> 0x3F
// 2. shift left by: 13
// 3. mask out the result
// 4. shift back by 13.