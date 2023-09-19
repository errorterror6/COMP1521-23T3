main:

	li	$t0, 24		#$t0 is x, x = 24
loop_label:
        bge	$t0, 42, loop_end
inside_loop:
	li 	$v0, 1	#     printf("%d", x);
	move    $a0, $t0
	syscall

	li      $v0, 11		#printf("\n");
	li	$a0, '\n'
	syscall

	addi    $t0, $t0, 3	#     x = x + 3;
	b	loop_label	#     goto loop_label;

loop_end:
	li      $v0, 0
	jr	$ra		#return to caller

