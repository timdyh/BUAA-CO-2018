.text
li $v0, 5
syscall
move $s0, $v0				# $s0 = n
li $s1, 0						# $s1 = i
move $s2, $s0 
addi $s2, $s2, -1		# $s2 = j
li $s3, 4						# increment of address

loop_read_begin:
	beq $s1, $s0, loop_read_end
	li $v0, 12
	syscall
	mult $s1, $s3
	mflo $t0
	sw $v0, 0($t0)
	addi $s1, $s1, 1
	j loop_read_begin
loop_read_end:
li $s1, 0

loop_judge_begin:
	slt $t0, $s1, $s2
	beq $t0, $zero, loop_judge_end
	mult $s1, $s3
	mflo $t1
	lw $t1, 0($t1)		# $t1 = array[i]
	mult $s2, $s3
	mflo $t2
	lw $t2, 0($t2)		# $t2 = array[j]
	bne $t1, $t2, not_palindrome
	addi $s1, $s1, 1
	addi $s2, $s2, -1
	j loop_judge_begin
loop_judge_end:
li $v0, 1
li $a0, 1
syscall
li $v0, 10
syscall

not_palindrome:
	li $v0, 1
	li $a0, 0
	syscall
	li $v0, 10
	syscall
	
	