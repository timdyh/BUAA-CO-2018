.data
matrix: .space 2500
space: .asciiz " "
newline: .asciiz "\n"

.text
li $v0, 5
syscall 
move $a0, $v0		  # m rows
li $v0, 5
syscall
move $a1, $v0			# n columns

la $t2, matrix		# current address = matrix
li $t0, 0					# i = 0
for_begin_1:
	slt $t3, $t0, $a0
	beq $t3, $zero, for_end_1    # if (i < m)
	li $t1, 0				# j = 0
	for_begin_2:
		slt $t3, $t1, $a1
		beq $t3, $zero, for_end_2    # if (j < n)
		
		li $v0, 5						# read an integer and save
		syscall
		sw $v0, 0($t2)
		addi $t1, $t1, 1
		addi $t2, $t2, 4
		
		j for_begin_2
	for_end_2:
	addi $t0, $t0, 1
	j for_begin_1
for_end_1:

addi $t2, $t2, -4
for_begin_3:
	slt $t3, $zero, $t0
	beq $t3, $zero, for_end_3
	move $t1, $a1
	for_begin_4:
		slt $t3, $zero, $t1
		beq $t3, $zero, for_end_4
		
		lw $t3, 0($t2)					# load an integer and judge whether to print or not
		beq $t3, $zero, label
		
		li $v0, 1								# print
		move $a0, $t0
		syscall
		li $v0, 4
		la $a0, space
		syscall
		li $v0, 1
		move $a0, $t1
		syscall
		li $v0, 4
		la $a0, space
		syscall
		li $v0, 1
		move $a0, $t3
		syscall
		li $v0, 4
		la $a0, newline
		syscall
		
	label:
		addi $t1, $t1, -1
		addi $t2, $t2, -4
		
		j for_begin_4
	for_end_4:
	addi $t0, $t0, -1
	j for_begin_3
for_end_3:

li $v0, 10
syscall