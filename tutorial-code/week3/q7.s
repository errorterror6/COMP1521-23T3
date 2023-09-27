# // A simple program that adds 42 to each element of an array

# #define N_SIZE 10

# int main(void) {
#     int i;
#     int numbers[N_SIZE] = {0, 1, 2, -3, 4, -5, 6, -7, 8, 9};

#     i = 0;
#     while (i < N_SIZE) {
#         if (numbers[i] < 0) {
#             numbers[i] += 42;
#         }
#         i++;
#     }
#     int i = 0
#     while (i < N_SIZE) {
#         printf("%d", numbers[i]);
#         i++;
#     }
# }

N_SIZE = 10
	.text
main:
	li	$t0, 0		# i = 0
loop1_cond:
        bge     $t0, N_SIZE, loop1_end
loop1_body:
	mul     $t2, $t0, 4
	lw      $t1, numbers($t2)       #t1 = numbers[i] value
	bge     $t1, 0, loop_inc
if_body:
	addi    $t1, $t1, 42
	sw      $t1, numbers($t2)       #numbers[i] = t1
loop_inc:
	add    $t0, $t0, 1
	j loop1_cond
loop1_end:	
	li 	$t0, 0      #i = 0
loop2_cond:
	bge     $t0, N_SIZE, loop2_end
loop2_body:
	li    	$v0, 1
	mul   	$t2, $t0, 4
	lw    	$a0, numbers($t2)
	syscall
	
	li 	$v0, 11
	li      $a0, '\n'
	syscall

	add   	$t0, $t0, 1
	b	loop2_cond
loop2_end:
	jr      $ra
	.data
numbers: .word 0, 1, 2, -3, 4, -5, 6, -7, 8, 9