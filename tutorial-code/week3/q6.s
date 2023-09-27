# #define N_SIZE 10

# #include <stdio.h>

# int main(void) {
#     int i;
#     int numbers[N_SIZE] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9};

#     i = 0;
#     while (i < N_SIZE) {
#         printf("%d\n", numbers[i]);
#         i++;
#     }
# }
N_SIZE = 10
	.text
main:
	li	$t0, 0		# i = 0
loop_cond:
        bge     $t0, N_SIZE, loop_end
loop_body:
	li 	$v0, 1                     # printf("%d\n", numbers[i]);
	mul     $t2, $t0, 4
	lw      $a0, numbers($t2)
	syscall

	li 	$v0, 11
	li      $a0, '\n'
	syscall
	
	addi	$t0, $t0, 1	# i++
	b      loop_cond
loop_end:
	li  	$v0, 0
	jr  	$ra

	.data
numbers: .word 0, 1, 2, 3, 4, 5, 6, 7, 8, 9