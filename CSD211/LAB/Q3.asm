.data

N: .word 6

.text

lw $s1, N 
li $s0, 1 # fact=1

loop:

beqz $s1, print

mul $s0, $s0, $s1 # fact = fact*N

addi $s1, $s1, -1  # N--

j loop

print:

li $v0, 1
move $a0, $s0
syscall

li $v0, 10
syscall
