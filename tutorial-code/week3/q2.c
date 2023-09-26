//data is at 0x10010020

    .data
a:  .word   42                      // 0x10010020
b:  .space  4                       // 0x10010024
c:  .asciiz "abcde\0"      // 0x10010028   29 2A 2B 2C 2D 2E
    .align  2           
d:  .byte   1, 2, 3, 4     // 0x1001030
e:  .word   1, 2, 3, 4     // 0x1001034
f:  .space  1              // 0x1001044