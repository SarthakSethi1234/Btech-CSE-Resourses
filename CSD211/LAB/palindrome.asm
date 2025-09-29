.data

str: .asciiz "doggod"
len: .word 6
msg1: .asciiz "It is a palindrome "
msg2: .asciiz "It is not a palindrome "

.text

la $a0, str # load the base address of word into $a0
lw $s0, len # load the length of the string in $s0
li $t0, 1 #i==1

jal palindrome

beq $s3, 1, ispalindrome # if flag=1 then it is a palindrome

# otherwise flag=0

li $v0, 4
la $a0, msg2 # print it is not a palindrome
syscall

j exit

palindrome:

push:

bgt $t0, $s0, pop # if i>n start popping the elements and comapre the elements

lb $t1, 0($a0) # ch=str.charAt(i)

addi $sp, $sp, -4 # push the character onto the stack
sw $t1, 0($sp)

addi $a0, $a0, 1 # move to the next character
addi $t0, $t0, 1 # i++

j push

pop:

la $a0, str # relaod $a0 with the base address of the string

poploop:

beqz $t0, setTrue # if i==0, set the flag to true

lb $t1, 0($a0) # ch=str.charAt(i)

lw $t2, 0($sp)
addi $sp, $sp, 4 # pop the character from the stack

bne $t2, $t1, setFalse # if ch1 != ch2 then set the flag to false

addi $a0, $a0, 1 # move to the next character
addi $t0, $t0, -1 # i--

j poploop

setTrue:

li $s3, 1
jr $ra

setFalse:

li $s3, 0 
jr $ra

ispalindrome:

li $v0, 4
la $a0, msg1 # print that it is a palindrome
syscall

exit:

li $v0, 10 # exit the program
syscall








