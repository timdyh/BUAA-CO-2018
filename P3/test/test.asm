.data
one: .word 1
two: .word 2
three: .word 3
four: .word 4
addr: .word 0x0000302c

.text
lw $t0, 0($zero)
lw $t1, 4($zero)
lw $t2, 8($zero)
lw $t3, 12($zero)
lw $a0, 16($zero)

jalr $a1, $a0

sw $s0, 16($zero)
sw $s1, 20($zero)
sw $s2, 24($zero)
sw $s3, 28($zero)

jal end

function:
addu $s0, $t0, $t1
subu $s1, $t3, $t0
beq $s0, $s1, label
ori $s2, $s0, 123

label:
lui $s2, 123
ori $s3, $s2, 321
nop
jr $a1

end: