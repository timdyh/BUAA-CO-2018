.data
	maze: .space 100
	stack: .space 4000

.text
main:
	la $sp, stack
	addi $sp, $sp, 4000
	
	li $v0, 5
	syscall
	move $s1, $v0			# $s1 = n
	li $v0, 5
	syscall
	move $s2, $v0			# $s2 = m
	
	li $s5, 4					# increment of address (column)
	li $s6, 4
	mult $s6, $s2
	mflo $s6					# increment of address (row)
	
	li $t1, 0													# $t1 = i
	loop_read_i_begin:
		beq $t1, $s1, loop_read_i_end
		li $t2, 0												# $t2 = j
		loop_read_j_begin:
			beq $t2, $s2, loop_read_j_end
			li $v0, 5
			syscall
			mult $t1, $s6
			mflo $t3
			mult $t2, $s5
			mflo $t4
			add $t3, $t3, $t4
			sw $v0, maze($t3)
			addi $t2, $t2, 1
			j loop_read_j_begin
		loop_read_j_end:
		addi $t1, $t1, 1
		j loop_read_i_begin
	loop_read_i_end:
	
	li $v0, 5
	syscall
	move $s3, $v0					# $s3 = si
	li $v0, 5
	syscall
	move $s4, $v0					# $s4 = sj
	li $v0, 5
	syscall
	move $t3, $v0					# $t3 = ti
	li $v0, 5
	syscall
	move $t4, $v0					# $t4 = tj
	addi $s1, $s1, -1			# n--
	addi $s2, $s2, -1			# m--
	addi $s3, $s3, -1			# si--
	addi $s4, $s4, -1			# sj--
	addi $t3, $t3, -1			# ti--
	addi $t4, $t4, -1			# tj--
	
	move $a0, $s3
	move $a1, $s4
	jal dfs
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 10
	syscall
	
dfs:
	move $t1, $a0
	move $t2, $a1
	mult $t1, $s6
	mflo $t5
	mult $t2, $s5
	mflo $t6
	add $t5, $t5, $t6				# $t5 = address of a[i][j]
	lw $t6, 0($t5)					# $t6 = a[i][j]
	
	if_aij_equal_1:
		beq $t6, $zero, if_aij_equal_1_else
		jr $ra
	if_aij_equal_1_else:
		if_succeed:
			bne $t1, $t3, if_succeed_else
			bne $t2, $t4, if_succeed_else
			addi $s0, $s0, 1
			jr $ra
		if_succeed_else:
			li $t0, 1
			sw $t0, 0($t5)
			if_east_reachable:
				beq $t2, $s2, if_east_reachable_end
				
				addi $sp, $sp, -4
				sw $t1, 0($sp)
				addi $sp, $sp, -4
				sw $t2, 0($sp)
				addi $sp, $sp, -4
				sw $ra, 0($sp)
				
				move $a0, $t1
				addi $a1, $t2, 1
				jal dfs
				
				lw $ra, 0($sp)
				addi $sp, $sp, 4
				lw $t2, 0($sp)
				addi $sp, $sp, 4
				lw $t1, 0($sp)
				addi $sp, $sp, 4
			if_east_reachable_end:
			
			if_south_reachable:
				beq $t1, $s1, if_south_reachable_end
				
				addi $sp, $sp, -4
				sw $t1, 0($sp)
				addi $sp, $sp, -4
				sw $t2, 0($sp)
				addi $sp, $sp, -4
				sw $ra, 0($sp)
				
				addi $a0, $t1, 1
				move $a1, $t2
				jal dfs
				
				lw $ra, 0($sp)
				addi $sp, $sp, 4
				lw $t2, 0($sp)
				addi $sp, $sp, 4
				lw $t1, 0($sp)
				addi $sp, $sp, 4
			if_south_reachable_end:
			
			if_west_reachable:
				beq $t2, $zero, if_west_reachable_end
				
				addi $sp, $sp, -4
				sw $t1, 0($sp)
				addi $sp, $sp, -4
				sw $t2, 0($sp)
				addi $sp, $sp, -4
				sw $ra, 0($sp)
				
				move $a0, $t1
				addi $a1, $t2, -1
				jal dfs
				
				lw $ra, 0($sp)
				addi $sp, $sp, 4
				lw $t2, 0($sp)
				addi $sp, $sp, 4
				lw $t1, 0($sp)
				addi $sp, $sp, 4
			if_west_reachable_end:
			
			if_north_reachable:
				beq $t1, $zero, if_north_reachable_end
				
				addi $sp, $sp, -4
				sw $t1, 0($sp)
				addi $sp, $sp, -4
				sw $t2, 0($sp)
				addi $sp, $sp, -4
				sw $ra, 0($sp)
				
				addi $a0, $t1, -1
				move $a1, $t2
				jal dfs
				
				lw $ra, 0($sp)
				addi $sp, $sp, 4
				lw $t2, 0($sp)
				addi $sp, $sp, 4
				lw $t1, 0($sp)
				addi $sp, $sp, 4
			if_north_reachable_end:
			
			mult $t1, $s6
			mflo $t5
			mult $t2, $s5
			mflo $t6
			add $t5, $t5, $t6
			sw $zero, 0($t5)
			
	jr $ra