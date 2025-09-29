.data

arr: .word
msg1: .asciiz "Enter the size of the array: \n"
msg2: "Enter the element in the array: \n"
msg3: "The sum of the array elements in the array is: \n"

.text

li $v0, 4
la $a0, msg1 # enter the size of the array
syscall

li $v0, 5
syscall # taking n input from the user
move $s0, $v0

li $t0, 1 # i=1

li $v0, 4
la $a0, msg2 # enter the array elements
syscall

la $a1, arr # load the base address of the array

input_loop:

bgt $t0, $s0, calcSum # if i>n then calculate the sum of the elements

li $v0, 5
syscall
sw $v0, 0($a1) # store the number in the array

addi $a1, $a1, 4 # move to the next address
addi $t0, $t0, 1 # i++

j input_loop

calcSum:

la $a1, arr # load base address
li $t0, 1 # i=1
li $s1, 0 # sum=0

loop:

bgt $t0, $s0, printSum # if i>n then print the sum

lw $t1, 0($a1) # $t1= arr[i]
add $s1, $s1, $t1 # sum=sum+arr[i]

addi $t0, $t0, 1 #i++
addi $a1, $a1, 4 # move to the next element

j loop

printSum:

li $v0, 4
la $a0, msg3 # print the output message
syscall

li $v0, 1
move $a0, $s1 # print the sum
syscall

li $v0, 10 # exit the program
syscall
