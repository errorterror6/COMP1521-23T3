SQUARE_MAX = 46340
	.text
main:
	li	$v0, 4	#     printf("Enter a number: ");
	la	$a0, prompt_str
	syscall

	li	$v0, 5	#     scanf("%d", &x);
	syscall
	move	$t0, $v0 #t0 = x

	ble	$t0, SQUARE_MAX, if_else_statement;

	#inside of if statment:
	li	$v0, 4	#     printf("The number is too large.\n");
	la	$a0, too_big_str
	syscall
	
	j       epilogue


if_else_statement:
	mul 	$t1, $t0, $t0	#    y = x * x;
	#$t1 = y
	li 	$v0, 1	#     printf("%d", y);
	move    $a0, $t1
	syscall

	li      $v0, 11		#printf("\n");
	li	$a0, '\n'
	syscall

epilogue:
	li      $v0, 0		#return 0;
	jr	$ra		#return

	.data
prompt_str:	.asciiz	"Enter a number: "
too_big_str: 	.asciiz "square too big for 32 bits\n"

