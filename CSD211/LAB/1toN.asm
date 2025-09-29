.data

msg1: .asciiz "Enter the value of N: \n"
msg2: .asciiz "Numbers from 1 to N: \n"
newline: .asciiz "\n"

.text

li $v0, 4 
la $a0, msg1
syscall

li $v0, 5
syscall
move $s0, $v0 # $s0 has N
move $t0, $v0 # $t0 also has N ie i=N

li $v0, 4
la $a0, msg2
syscall

push_loop:

beqz $t0, pop_loop # if i==0 start popping the elements

addi $sp, $sp, -4
sw $t0, 0($sp) # Store the value of N onto the stack

addi $t0, $t0, -1 # i--

j push_loop

pop_loop:

beqz $s0, exit # if N==0 then exit

lw $a0, 0($sp) # pop the value of N off the stack
addi $sp, $sp, 4

li $v0, 1 # print the integer
syscall

li $v0,  4
la $a0, newline # print a new line
syscall

addi $s0, $s0, -1 # N--

j pop_loop

exit:

li $v0, 10
syscall



