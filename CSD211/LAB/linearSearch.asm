.data

arr: .word 1,5,6,9,10,30,45
len: .word 7
found: .asciiz "Element found "
notFound: .asciiz "Element not found "


.text

la $a0, arr # base address
lw $s0, len # length of the array

li $v0, 5
syscall
move $s1, $v0 # $s contains teh elment to be searched 

li $t0, 1 # i=1

loop:

lw $s3, 0($a0) # $s3 contains the first element in the array

beq $s1, $s3, foundEle # if target==arr[i] the found
bgt $t0, $s0, notFoundEle # if i>len then not found

addi $a0, $a0, 4 # move to the next element in the array
addi $t0, $t0, 1 # i++

j loop

foundEle:

li $v0, 4
la $a0, found
syscall

j exit

notFoundEle:

li $v0, 4
la $a0, notFound
syscall

j exit

exit:

li $v0, 10
syscall


