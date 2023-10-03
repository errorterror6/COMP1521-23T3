	.text
main:
	push	$ra
	
	li	$t0, 6
	#t0 = 6


	#max(array, length), arg0(arrya) goes into a0, arg1(lenght) goes into a1
	la	$a0, array
	move	$a1, $t0

	jal	max
	#output of max is in $v0

	#return address of max $ra points to here
	
	#print %d
	move	$a0, $v0
	li	$v0, 1
	syscall

	li	$v0, 11
	li	$a0, '\n'
	syscall

	li	$v0, 0
	pop	$ra
	jr	$ra

max:

max_prologue:
	#a0 = array
	#a1 = length
	begin

	push	$ra
	push	$s0

max_body:
	lw	$s0, 0($a0)
	#$t0 = first_element
max_outer_if_cond:
	bne     $a1, 1, max_else
	move	$v0, $s0
	b	max_epilogue
max_else:
	addi	$a0, $a0, 4
	sub	$a1, $a1, 1

	jal	max
	#output of max is in $v0
	move	$t1, $v0
	#max_so_far = #t1
max_inner_if_cond:

	ble 	$s0, $t1, max_inner_if_end
max_inner_if_body:
	move	$t1, $s0

max_inner_if_end:
	move	$v0, $t1
	b	max_epilogue

max_epilogue:
	pop	$s0
	pop 	$ra
	end
	jr	$ra

	.data
array: .word 1, 4, 33, 456, 332, 5
