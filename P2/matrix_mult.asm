.data
matrix1: .space 400
matrix2: .space 400
space: .asciiz " "
newline: .asciiz "\n"

.text
li $v0, 5
syscall
move $s0, $v0			# $s0 = n
mult $s0, $s0
mflo $s6					# $s6 = n^2

li $s1, 0				# $s1 = i
li $s2, 0				# $s2 = j
li $s3, 4				# $s3 = increment of column address
mult $s3, $s0
mflo $s4				# $s4 = inrement of row address
loop_read1_begin:
	beq $s1, $s6, loop_read1_end  # while (i != n^2)
	li $v0, 5
	syscall
	mult $s1, $s3
	mflo $t0
	sw $v0, matrix1($t0)
	addi $s1, $s1, 1
	j loop_read1_begin
loop_read1_end:

loop_read2_begin:
	beq $s2, $s6, loop_read2_end  # while (j != n^2)
	li $v0, 5
	syscall
	mult $s2, $s3
	mflo $t0 
	sw $v0, matrix2($t0)
	addi $s2, $s2, 1
	j loop_read2_begin
loop_read2_end:

li $s1, 0
loop_i_begin:
	beq $s1, $s0, loop_i_end
	li $s2, 0
	loop_j_begin:
		beq $s2, $s0, loop_j_end
		li $s5, 0			# $s5 = k
		li $s7, 0			# $s7 = sum
		loop_k_begin:
			beq $s5, $s0, loop_k_end
			mult $s1, $s4
			mflo $t1
			mult $s5, $s3
			mflo $t0
			add $t1, $t1, $t0			# $t1 = address of a[i][k]
			lw $t1, matrix1($t1)	# $t1 = a[i][k]
		
			mult $s5, $s4
			mflo $t2
			mult $s2, $s3
			mflo $t0
			add $t2, $t2, $t0			# $t2 = address of a[k][j]
			lw $t2, matrix2($t2)	# $t2 = a[k][j]
			
			mult $t1, $t2
			mflo $t3
			add $s7, $s7, $t3
			addi $s5, $s5, 1
			j loop_k_begin
		loop_k_end:
		li $v0, 1
		move $a0, $s7
		syscall 
		li $v0, 4
		la $a0, space
		syscall
		addi $s2, $s2, 1
		j loop_j_begin
	loop_j_end:
	li $v0, 4
	la $a0, newline
	syscall
	addi $s1, $s1, 1
	j loop_i_begin
loop_i_end:

li $v0, 10
syscall