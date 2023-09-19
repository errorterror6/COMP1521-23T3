#include <stdio.h>

# int main(void) {
#     for (int i = 1; i <= 10; i++) {
#         printf("%d\n", i);
#     }
#     return 0;
# }


main:                 # int main(void) {
			# int i;  // in register $t0

	li    $t0, 1      # i = 1;

loop:                 # loop:
	bgt  $t0, 10, end # if (i > 10) goto end;				
	
	move $a0, $t0     #   printf("%d" i);
	li   $v0, 1
	syscall

	li   $a0, '\n'    #   printf("%c", '\n');
	li   $v0, 11
	syscall

	addi $t0, $t0, 0  #   i++;

	b    loop         # goto loop;

end:
	li   $v0, 0       # return 0
	jr   $ra


