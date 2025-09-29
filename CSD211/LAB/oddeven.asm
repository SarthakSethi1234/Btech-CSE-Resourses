.data

arr: .word 1,2,3,4,5,6,7,8,9,10,11,13,15,17,19
len: .word 15
msg1: .asciiz "Count of odd elements in the array is: "
msg2: .asciiz "Count of even elements in the array is: "
newline: .asciiz "\n"

.text

la $a0, arr # load the base address of the array
lw $s0, len # load the length of the array into $s1
li $t0, 1 # i=1
li $s1, 0 # oddCount=0
li $s2, 0 # evenCountn=0

jal oddeven

li $v0, 4
la $a0, msg1 # print a message for oddCount
syscall

li $v0, 1
move $a0, $s1
syscall

li $v0, 4
la $a0, newline # print a new line
syscall


li $v0, 4
la $a0, msg2 # print a message for evenCount
syscall

li $v0, 1
move $a0, $s2
syscall

li $v0, 10 # terminate the program
syscall


oddeven:

bgt $t0, $s0, return # if(i>n) return and print odd and even count

lw $t1, 0($a0) # num=arr[i]

li $t2, 2 
div $t1, $t2 
mfhi $t2 # $t2 contains teh remainder

beqz $t2, evenCount # if rem==0 then num is even and increase even count
bnez $t2, oddCount # if rem!=0 then num is odd and increase odd count

evenCount:

addi $s2, $s2, 1 # evenCount++
addi $a0, $a0, 4 # move to the next element
addi $t0, $t0, 1 # i++

j oddeven

oddCount:

addi $s1, $s1, 1 # oddCount++
addi $a0, $a0, 4 # move to the next element
addi $t0, $t0, 1 # i++

j oddeven

return:

jr $ra