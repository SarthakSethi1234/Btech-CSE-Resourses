.data

Cent: .float 0.0
Faren: .float 0.0

nine: .float 9.0
five: .float 5.0
thirty_two: .float 32.0

.text

l.s $f1, nine
l.s $f2, five
l.s $f3, thirty_two

# lets calculate (9/5) first

div.s $f0, $f1, $f2 # $f0 = $f3/$f4

l.s $f4, Cent

mul.s $f5, $f0, $f4 # (9/5)*Cent

add.s $f0, $f5, $f3 # (9/5)*Cent +32

li $v0, 2
mov.s $f12, $f0
syscall


