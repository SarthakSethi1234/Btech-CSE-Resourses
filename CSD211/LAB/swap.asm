.data

arr: .word 20, 19, 5, 3, 12
len: .word  5

.text

li $s0, 10
li $s1, 20

# swapping with a temporary register
move $s2, $s0
move $s0, $s1
move $s1, $s2

#swapping without using a third register

sub $s0, $s0, $s1 # a = a-b
add $s1, $s1, $s0 # b= b+(a-b)
sub $s0, $s1, $s0 # a= a-(a-b)

la $a0, arr # base address of the array
lw $s0, len # length

# offset for accessing the first element= 4*0
lw $t0, 0($a0)

# offset for accessing the second element= 4
lw $t1, 4($a0)

add $t0, $t0, $t1 # adding the two numbers

# offset for the space just next to where the last element is stored= 4*5=20

sw $t0, 20($a0)



