li $t0, 4
li $t1, 100
li $t2, 400

li $v0 5
syscall

move $a0, $v0
div $a0, $t0
mfhi $t3							# set t3 as remainder
bne $t3, $zero, if_1_else   # if (a0 % 4 != 0)

div $a0, $t1
mfhi $t3
beq $t3, $zero, if_1_else # if (a0 % 100 == 0)

if_2:
	li $v0, 1
	li $a0, 1
	syscall
	j if_1_end

if_1_else:
	div $a0, $t2
	mfhi $t3
	bne $t3, $zero, if_2_else  # if (a0 % 400 != 0)
	j if_2
	
if_2_else:
	li $v0, 1
	li $a0, 0
	syscall

if_1_end:
	li $v0, 10
	syscall