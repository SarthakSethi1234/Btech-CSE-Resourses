.data

str: .space 100
msg1:.asciiz "Enter the length of the string: \n"
msg2:.asciiz "Enter the string: \n"
msg3: .asciiz "The string that you entered is: \n"

.text

li $v0, 4
la $a0, msg1 # length input message
syscall

li $v0, 5
syscall # length store in $s0
move $s0, $v0 

# reading the string

li $v0, 8
la $a0, str
move $a1, $s0
syscall

li $v0, 4
la $a0, msg3
syscall

li $v0, 4
la $a0, str
syscall

