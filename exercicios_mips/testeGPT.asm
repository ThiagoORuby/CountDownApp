.data
fmt: .asciiz "O valor é: %d\n"

.text
li $v0, 11
move $a0, 12345
la $a1, fmt
syscall

sll