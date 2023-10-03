
	.text
main:
	#some code
	la	$s0, some_space
	addi 	$s1, $s0, 1
	mul	$s2, $s1, 4

	li	$t0, 1521
	move	$s3, $t0

	jal function
	jal function2
	jal function3
	jal function4


	move	$t0, $s3
	#code is much neater as I can be confident that function, function2, function3, and function4 all restore my S values!!


function:

prologue:
	#at this point all S registers
	#are still the value of S registers in "main".
	#so pushing and popping pushes main's S registers to the stack
	push	$ra
	push 	$s2
	push	$s0
body:
	#i can modify S registers as much as i want now
	li 	$s2, 0
	addi	$s0, $s2, 1
	#return 0
	move 	$v0, $s2

epilogue:
	#now that function is done with S registers
	#the S registers saved is restored
	#so now S0 and S2 are still the same value as BEFORE this function is called!
	pop	$s0
	pop	$s2
	pop	$ra
	jr	$ra



	.data
some_space: .space 100