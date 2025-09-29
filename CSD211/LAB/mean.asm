.data

arr: .float 1.0,2.0,3.0,4.0,5.0,6.0
len: .float 6.0
msg: .asciiz "The median of the array is: "
zero: .float 0.0

.text

la $a0, arr # base address

l.s $f1, zero # sum=0.0
li $t0, 0 # i=0
l.s $f2, len # length
li $s0, 6

sum_loop:

beq $t0, $s0, calculate # if i==N then calculate mean

l.s $f2, 0($a0) # load arr[i]
add.s $f1, $f1, $f2 # sum= sum+arr[i]
addi $a0, $a0, 4 # move to the next address

addi $t0, $t0, 1 # i++
j sum_loop

calculate:

div.s $f12, $f1, $f2

li $v0, 4
la $a0, msg
syscall

li $v0, 2
syscall



