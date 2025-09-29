.data

str: .asciiz "Crypt"
len: .word 8
msg: .asciiz "The count of vowels in teh string is: "

.text 

la $a1, str # load the base address of str into $a1
lw $s1, len # store the length of the string in $s1
li $s2, 0 # count = 0
li $t0, 1 # i=1

jal vowChecker

li $v0, 4
la $a0, msg # print the output msg
syscall

li $v0, 1
move $a0, $s2
syscall

li $v0, 10 # terminate the program
syscall 

vowChecker:

bge $t0, $s1, return # if(i>n) then return count

lb $t1, 0($a1) # ch= str.charAt(i)

# if ( ch=='A' || ch=='E' || ch=='I' || ch=='O' || ch=='U' || ch=='a' || ch=='e' || ch=='i' || ch=='o' || ch=='u') then count++

beq $t1, 'A', inc 
beq $t1, 'E', inc
beq $t1, 'I', inc
beq $t1, 'O', inc
beq $t1, 'U', inc
beq $t1, 'a', inc
beq $t1, 'e', inc
beq $t1, 'i', inc
beq $t1, 'o', inc
beq $t1, 'u', inc

addi $a1, $a1, 1 # move the address pointer to next character
addi $t0, $t0, 1 # i++

j vowChecker

inc:

addi $s2, $s2, 1 # count++
addi $a1, $a1, 1 # move the address pointer to next character
addi $t0, $t0, 1 # i++

j vowChecker

j vowChecker

return:

jr $ra





