.data
matrix: .space 400
core: .space 400
space: .asciiz " "
newline: .asciiz "\n"

.text
li $v0, 5
syscall
move $s1, $v0			# ($s1 = m1)
li $v0, 5
syscall
move $s2, $v0			# ($s2 = n1)
li $v0, 5
syscall
move $s3, $v0			# $s3 = m2 = p_max
li $v0, 5
syscall
move $s4, $v0			# $s4 = n2 = q_max

li $s0, 4					# $s0 = increment of column
mult $s0, $s2
mflo $s5					# $s5 = increment of row (matrix)				
mult $s0, $s4
mflo $s6					#	$s6 = incremrnt of row (core)

mult $s1, $s2
mflo $t5					# ($t5 = m1 * n1)
mult $s3, $s4
mflo $t6					# ($t6 = m2 * n2)

sub $s1, $s1, $s3
addi $s1, $s1, 1				# $s1 = m1 - m2 + 1 = i_max
sub $s2, $s2, $s4
addi $s2, $s2, 1				# $s2 = n1 - n2 + 1 = j_max

li $t0, 0
loop_read_matrix_begin:
	beq $t0, $t5, loop_read_matrix_end
	li $v0, 5
	syscall
	mult $t0, $s0
	mflo $t1
	sw $v0, matrix($t1)
	addi $t0, $t0, 1
	j loop_read_matrix_begin
loop_read_matrix_end:

li $t0, 0
loop_read_core_begin:
	beq $t0, $t6, loop_read_core_end
	li $v0, 5
	syscall
	mult $t0, $s0
	mflo $t1
	sw $v0, core($t1)
	addi $t0, $t0, 1
	j loop_read_core_begin
loop_read_core_end:

li $t1, 0												# $t1 = i
loop_i_begin:
	beq $t1, $s1, loop_i_end
	li $t2, 0											# $t2 = j
	loop_j_begin:
		beq $t2, $s2, loop_j_end
		li $t3, 0										# $t3 = p
		li $a1, 0
		li $a2, 0
		loop_p_begin:
			beq $t3, $s3, loop_p_end
			li $t4, 0									# $t4 = q
			loop_q_begin:
				beq $t4, $s4, loop_q_end
				add $t5, $t1, $t3
				mult $t5, $s5
				mflo $t5
				add $t6, $t2, $t4
				mult $t6, $s0
				mflo $t6
				add $t5, $t5, $t6
				lw $t5, matrix($t5)			# $t5 = a[i+p][j+q]
				mult $t3, $s6
				mflo $t6
				mult $t4, $s0
				mflo $t7
				add $t6, $t6, $t7
				lw $t6, core($t6)				# $t6 = b[p][q]
				mtlo $a1
				mthi $a2
				madd $t5, $t6
				mflo $a1
				mfhi $a2
				addi $t4, $t4, 1
				j loop_q_begin
			loop_q_end:
			addi $t3, $t3, 1
			j loop_p_begin
		loop_p_end:
		li $v0, 35
		move $a0, $a2
		syscall
		move $a0, $a1
		syscall
		li $v0, 4
		la $a0, space
		syscall
		addi $t2, $t2, 1
		j loop_j_begin
	loop_j_end:
	li $v0, 4
	la $a0, newline
	syscall
	addi $t1, $t1, 1
	j loop_i_begin
loop_i_end:

li $v0, 10
syscall