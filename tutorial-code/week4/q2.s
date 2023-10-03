FLAG_ROWS = 6
FLAG_COLS = 12

	.text
main:
	#t0 = row
	li	$t0, 0
outer_loop_condition:
	bge     $t0, FLAG_ROWS, outer_loop_end
inner_loop_init:
	#t1 = col
	li	$t1, 0
inner_loop_condition:
	bge 	$t1, FLAG_COLS, inner_loop_end
inner_loop_body:
	
	la	$t2, flag
	#calculate offset
	#offset = row * num_cols + cols
	mul	$t3, $t0, FLAG_COLS
	#t3 = row*num_cols
	add	$t3, $t3, $t1
	#now #t3 is the offset for flag[row][col]
	#adding on the address of flag
	add	$t3, $t3, $t2
	#now t4 is the address of flag[row][col]
	li	$v0, 11
	lb	$a0, ($t3)
	syscall

	addi 	$t1, $t1, 1
	b 	inner_loop_condition

inner_loop_end:	
	li	$v0, 11
	li	$a0, '\n'
	syscall

	addi 	$t0, $t0, 1
	b       outer_loop_condition


outer_loop_end:
	jr 	$ra


	.data
flag:
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.', '.'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'
	.byte '#', '#', '#', '#', '#', '.', '.', '#', '#', '#', '#', '#'