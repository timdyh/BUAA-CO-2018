.data
n: .space 4
m: .space 4
s: .space 4
G: .space 256
visited: .space 32
stack: .space 32000

.text
main:
	la $sp, stack
	addi $sp, $sp, 32000

	la $t0, n					# read m, n and save
	la $t1, m
	li $v0, 5
	syscall
	sw $v0, 0($t0) 
	li $v0, 5
	syscall
	sw $v0, 0($t1)
	
	lw $t2, 0($t0)  	# n 
	lw $t3, 0($t1)		# m
	li $t0, 0					# i
	la $t4, G
	li $t9, 1					# edge
	li $s0, 32				# address increment of row
	li $s1, 4					#	address increment of colomn
	loop_read_begin:
		slt $t1, $t0, $t3
		beq $t1, $zero, loop_read_end
		
		li $v0, 5	
		syscall					# a
		addi $v0, $v0, -1
		mult $v0, $s0
		mflo $t5				# (a-1)*32
		mult $v0, $s1
		mflo $t6       	# (a-1)*4
		
		li $v0, 5
		syscall					# b
		addi $v0, $v0, -1
		mult $v0, $s0
		mflo $t7				# (b-1)*32
		mult $v0, $s1
		mflo $t8				# (b-1)*4
		
		add $t5, $t5, $t8   
		add $t1, $t4, $t5		# address of G[a-1][b-1]
		sw $t9, 0($t1)			# G[a-1][b-1] = 1
		add $t6, $t6, $t7
		add $t1, $t4, $t6		# address of G[b-1][a-1]
		sw $t9, 0($t1)			#G[b-1][a-1] = 1
		
		addi $t0, $t0, 1
		j loop_read_begin
	loop_read_end:
	
	loop_start_begin:
		la $t0, s
		lw $t0, 0($t0)			# s
		la $t1, n
		lw $t1, 0($t1)			# n
		slt $t2, $t0, $t1
		beq $t2, $zero, loop_start_end
		
		move $a0, $t0
		move $a1, $t1
		addi $a1, $a1, -1
		
		jal dfs
		
		la $t0, s
		lw $t1, 0($t0)			# load s
		addi $t1, $t1, 1		# s++
		sw $t1, 0($t0)			# save s
		j loop_start_begin
	loop_start_end:
	li $v0, 1
	li $a0, 0
	syscall
	li $v0, 10
	syscall
	
	found:
		li $v0, 1
		li $a0, 1
		syscall
		li $v0, 10
		syscall
	
dfs:
	move $t0, $a0			# c
	move $t1, $a1			# left
	
	la $t2, visited		# address of visited
	move $t3, $t0
	mult $t3, $s1
	mflo $t3
	add $t3, $t3, $t2		# address of visited[c]
	li $t4, 1				
	sw $t4, 0($t3)			# visited[c] = 1
	
	li $t4, 0						# j
	loop_edge_begin:
		la $t5, n
		lw $t5, 0($t5) 		# n
		slt $t6, $t4, $t5
		beq $t6, $zero, loop_edge_end
		
		la $t5, G
		mult $t0, $s0
		mflo $t6
		add $t5, $t5, $t6
		mult $t4, $s1
		mflo $t6
		add $t5, $t5, $t6
		lw $t5, 0($t5)   	# G[c][j]
		beq $t5, $zero, if_edge_end		# if (G[c][j] == 0) jump
		
		li $t5, 0
		sltiu $t5, $t1, 1			# if (left < 1) $t5 <- 1  
		la $t6, s
		lw $t6, 0($t6)
		li $t7, 1
		beq $t4, $t6, label		# if (j == s) $t7 <- 1 
		li $t7, 0							
		label:
		and $t5, $t5, $t7			# $t5 <- ($t5 && $t7)
		bgtz $t5, found				# if ($t5 > 0) jump
		
		mult $t4, $s1
		mflo $t5
		add $t5, $t5, $t2
		lw $t5, 0($t5)
		bgtz $t5, if_not_visited_end  # if ($t5 > 0) jump
		
		move $a0, $t4
		move $a1, $t1
		addi $a1, $a1, -1
		
		sw $ra, 0($sp)
		addi $sp, $sp, -4
		sw $t0, 0($sp)
		addi $sp, $sp, -4
		sw $t1, 0($sp)
		addi $sp, $sp, -4
		sw $t2, 0($sp)
		addi $sp, $sp, -4
		sw $t3, 0($sp)
		addi $sp, $sp, -4
		sw $t4, 0($sp)
		addi $sp, $sp, -4
		
		jal dfs
		
		addi $sp, $sp, 4
		lw $t4, 0($sp)
		addi $sp, $sp, 4
		lw $t3, 0($sp)
		addi $sp, $sp, 4
		lw $t2, 0($sp)
		addi $sp, $sp, 4
		lw $t1, 0($sp)
		addi $sp, $sp, 4
		lw $t0, 0($sp)
		addi $sp, $sp, 4
		lw $ra, 0($sp)
		
		if_not_visited_end:
		if_edge_end:
		addi $t4, $t4, 1			# j++
		j loop_edge_begin
		
	loop_edge_end:
	sw $zero, 0($t3)		# visited[c] = 0
	jr $ra
