.data
symbol: .space 28
array: .space 28
space: .asciiz " "
newline: .asciiz "\n" 
stack: .space 4000

.text
main:
	la $sp, stack
	addi $sp, $sp, 4000
	li $v0, 5
	syscall
	move $s0, $v0			# $s0 = n
	li $s1, 4					# $s1 = increment of address
	li $a0, 0
	jal FullArray
	li $v0, 10
	syscall

FullArray:
	move $s2, $a0			# $s2 = index
	if_index_equal_n_begin:
		bne $s2, $s0, if_index_equal_n_end
		li $t0, 0
		loop_print_begin:
			beq $t0, $s0, loop_print_end
			mult $t0, $s1
			mflo $t1
			lw $t1, array($t1)
			li $v0, 1
			move $a0, $t1
			syscall
			li $v0, 4
			la $a0, space
			syscall
			addi $t0, $t0, 1
			j loop_print_begin
		loop_print_end:
		li $v0, 4
		la $a0, newline
		syscall
		jr $ra
	if_index_equal_n_end:
		
	li $t0, 0
	loop_generate_begin:
		beq $t0, $s0, loop_generate_end
		if_not_symbol_begin:
			mult $t0, $s1
			mflo $t2									# $t2 = address of symbol[i]
			lw $t3, 0($t2)						# $t3 = symbol[i]
			bne $t3, $zero, if_not_symbol_end
			mult $s2, $s1
			mflo $t4
			addi $t5, $t0, 1
			sw $t5, array($t4)
			li $t5, 1
			sw $t5, 0($t2)
			
			addi $sp, $sp, -4
			sw $ra, 0($sp)
			addi $sp, $sp, -4
			sw $t0, 0($sp)
			addi $sp, $sp, -4
			sw $s2, 0($sp)
			
			addi $t5, $s2, 1
			move $a0, $t5
			jal FullArray
			
			lw $s2, 0($sp)
			addi $sp, $sp, 4
			lw $t0, 0($sp)
			addi $sp, $sp, 4
			lw $ra, 0($sp)
			addi $sp, $sp, 4
			
			mult $t0, $s1
			mflo $t6
			sw $zero, symbol($t6)
		if_not_symbol_end:
		addi $t0, $t0, 1
		j loop_generate_begin
	loop_generate_end:
	jr $ra