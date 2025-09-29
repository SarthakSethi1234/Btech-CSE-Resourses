.data

expression: .asciiz "(ab)(j+a()))))"
len: .word 12
opening: .asciiz "More number of opening paranthesis \n"
closing: .asciiz "More number of closing paranthesis \n"
valid: .asciiz "Balanced Paranthesis \n"
invalid: .asciiz "Unbalanced Paranthesis \n"

.text

la $a1, expression # load the base address of teh expression into $a1 register
li $s0, 0 # count=0
lw $s1, len # $s1= len
li $t0, 1 #i==1

jal paranCheck

beqz $s0, validParan # if( count==0) then it is a valid paranthesis
bnez $s0, invalidParan # if( count!=0) then it is a valid paranthesis


paranCheck:

bgt $t0, $s1, return # if(i>n) character then return 

lb $t1, 0($a1) # ch = arr[i]

beq $t1, '(', inc # if(ch== '(' ) increase the counter
beq $t1, ')', dec # if( ch==')' ) decrease the counter

addi $a1, $a1, 1 # move to next character
addi $t0, $t0, 1 # i++

j paranCheck

inc:

addi $s0, $s0, 1 # count++
addi $a1, $a1, 1 # move to next character
addi $t0, $t0, 1 # i++

j paranCheck

dec:

addi $s0, $s0, -1 # count--
addi $a1, $a1, 1 # move to next character
addi $t0, $t0, 1 # i++

j paranCheck

return:

jr $ra

validParan:

li $v0, 4
la $a0, valid # print it is valid paranthesis
syscall

j exit

invalidParan:

li $v0, 4
la $a0, invalid # print it is invalid paranthesis
syscall
blt $s0, $zero, closingParan # if(count<0) the more number of closing brackets
bgt $s0, $zero, openingParan # if(count>0) the more number of opening brackets

closingParan:

li $v0, 4
la $a0, closing # print more number of closing brackets
syscall

j exit

openingParan:

li $v0, 4
la $a0, opening # print more number of opeing brackets
syscall

j exit

exit: 

li $v0, 10 # terminate the program
syscall


