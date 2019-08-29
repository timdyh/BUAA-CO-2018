ori $s2, $s2, 5
ori $s3, $s3, 1
ori $s4, $s4, 4
ori $t2, $t2, 0
ori $t3, $t3, 0
loop_begin:
	beq $t2, $s2, loop_end
	nop
	sw $t2, 0($t3)
	addu $t2, $t2, $s3
	addu $t3, $t3, $s4
	j loop_begin
loop_end:
lui $t4, 41341
lui $t5, 9524
jal label1 
nop
beq $s0, $s1, label2

label1:
addu $s0, $t5, $t4
subu $t0, $zero, $t4
subu $t1, $zero, $t5
addu $t0, $t0, $t1
subu $s1, $zero, $t0
jr $ra
nop

label2:
lw $t6, 4($zero)
lw $t7, 8($zero)
nop
nop
lui $t8, 381
lui $t9, 7318
addu $s5, $t8, $t9


	
	