.data

arr: .space 400
msg1: .asciiz "Enter the size of the array: \n"
msg2: .asciiz "Enter the element in the array: \n"
msg3: .asciiz "The sum of the array elements in the array is: \n"

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

la $a1, arr # base address

input_loop:

bgt $t0, $s0, sort # if i>n then calculate the sum of the elements

li $v0, 5
syscall
sw $v0, 0($a1) # store the number in the array

addi $t0, $t0, 1 # i++
addi $a1, $a1, 4 # move to the next element

j input_loop

sort:

li $s1, 0 #i=0
addi $s3, $s0, -1 # i goes till n-1

jal bubbleSort

li $v0, 10 # exit the program
syscall

bubbleSort:

la $a1, arr # base address

outer_loop:

bgt $s1, $s3, return # if i>n-1 then the array has been sorted [FOR FOR OUTER LOOP]
li $s2, 0 #j=0 
sub $s4, $s3, $s1 # $s3=n-i-1

j inner_loop

addi $s1, $s1, 1 # i++

inner_loop:

bgt $s2, $s4, inc_i # if j> n-1-i then increase i and go t the outer loop

sll $t4, $s2, 2 # offset= j*4

compare:

add $t5, $a1, $t4 # new address= base address+offset

lw $t0, 0($t5) # $t0= arr[j]
lw $t1, 4($t5) # $t1= arr[j+1]

bgt $t0, $t1, swap # if arr[j] > arr[j+1] then swap

addi $s2, $s2, 1 # j++

j inner_loop

swap:

sw $t0, 4($t5)
sw $t1, 0($t5)

addi $s2, $s2, 1 # j++

j inner_loop

inc_i:

addi $s1, $s1, 1 # i++
j outer_loop

return:

jr $ra


