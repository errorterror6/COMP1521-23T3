N_SIZE = 10

	.text
main:
	li	$t0, 0     #i = $t0
loop_start:
	bge     $t0, N_SIZE, loop_end
loop_body:
	li     $v0, 5
	syscall
	move   $t1, $v0
	mul    $t2, $t0, 4
	sw     $t1, numbers($t2)
	addi   $t0, $t0, 1
	j      loop_start

loop_end:

	li     $v0, 0
	jr     $ra

	.data
numbers:
	.word 0:N_SIZE