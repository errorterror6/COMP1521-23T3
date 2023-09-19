# // Prints the square of a number

#include <stdio.h>

# int main(void) {
#     int x, y;

#     printf("Enter a number: ");
#     scanf("%d", &x);

#     y = x * x;

#     printf("%d\n", y);

#     return 0;
# }

main:     # int main(void) {
	li	$v0, 4	#     printf("Enter a number: ");
	la	$a0, prompt_str
	syscall

	li	$v0, 5	#     scanf("%d", &x);
	syscall

	#result comes out in $v0
	move 	$t0, $v0	#x is now $t0, 
	mul 	$t1, $t0, $t0			#     y = x * x;
	#$t1 = y

	li 	$v0, 1	#     printf("%d", y);
	move    $a0, $t1
	syscall

	li      $v0, 11		#printf("\n");
	li	$a0, '\n'
	syscall



	li      $v0, 0	#     put 0 into the return register;
	jr	$ra	#     return;

	.data
prompt_str:
    .asciiz "Enter a number: "
    
