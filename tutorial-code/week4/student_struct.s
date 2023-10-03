ID_OFFSET = 0
FAMILY_OFFSET = 4
GIVEN_OFFSET = 24
PROGRAM_OFFSET = 44
WAM_OFFSET = 48

# to access the program,
main:
	la	$t1, student1                      #why is it student1 in practice and not _student???
	addi 	$t1, $t1, PROGRAM_OFFSET           #adding the offset to access program

	#save a value to the program section.
	li 	$t2, 1521
	sw 	$t2, ($t1)
	#load the value back in now.
	lw	$t0, ($t1)  
	#print it out.
	move	$a0, $t0
	li	$v0, 1
	syscall

	li	$a0, '\n'
	li	$v0, 11
	syscall

	jr	$ra



	.data
# struct _student{
# 	int id;
# 	char family[20];
# 	char given[20];
# 	int program;
# 	double wam;
# }

student1: .space 56