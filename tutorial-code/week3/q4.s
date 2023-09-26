# Address       Data Definition
# 0x10010000    aa:  .word 42
# 0x10010004    bb:  .word 666  0x 00 00 02 9A
#				0x 9A 02 00 00
# 0x10010008    cc:  .word 1
# 0x1001000C         .word 3
# 0x10010010         .word 5
# 0x10010014         .word 7

la   $t0, aa:
	# $t0 = 0x10010000
lw   $t0, bb
	# $t0 = 666;
lb   $t0, bb
	# $t0 = 0x9A;    because cse machines store numbers in little-endian (least significant bytes first)
lw   $t0, aa+4
	# $T0 = 666;      because 4 more than aa is bb.
la   $t1, cc             # loads the address of CC into $t1
lw   $t0, ($t1)		# loads value from $t1 memory into $t0
        #$t0 = 1
la   $t1, cc
lw   $t0, 8($t1)
        #t0 = 5          (offset from cc by 8)
li   $t1, 8
lw   $t0, cc($t1)            #memory = offset + reference = cc + 8
        #t0 = 5
la   $t1, cc
lw   $t0, 2($t1)         #memory = offset+ reference = cc + 2
	# invalid memory access as "lw" command requires 4 byte alignment.

