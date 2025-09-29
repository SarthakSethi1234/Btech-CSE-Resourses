.data

msg: .asciiz "The sum of all the numbers is: "

.text

li $s0, 0 # sum=0

#Infinite loop to take input from the user and send it to sumFunc

input_loop:

li $v0, 5
syscall 

beq $v0, $zero exit # if N==0 then exit this loop and print the sum

move $s1, $v0 # move the entered integer from $v0 to $s1

# call the sumFunc
jal sumFunc

j input_loop

sumFunc:

add $s0, $s0, $s1 # sum = sum+N

jr $ra # return

exit:

li $v0, 4
la $a0, msg # print the output message
syscall

li $v0, 1
move $a0, $s0 # print the sum
syscall

li $v0, 10 # exit the program
syscall
