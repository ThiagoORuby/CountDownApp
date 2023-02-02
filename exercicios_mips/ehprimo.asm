# checa se é primo
.data
message: .asciiz "Digite um numero: "
prime_m: .asciiz "O valor é primo\n"
notprime_m: .asciiz "O valor não é primo\n"

.text
main:
	# init
	li $v0, 4
	la $a0, message
	syscall
	
	# input number
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $t0, 2  # i = 2
	# loop check
	loop: 
		div $s0, $t0 # s0 / t0
		mfhi $t1 # resto de s0 / t0
		
		beq $s0, 2, prime # if s0 == 2 go to is prime
		beq $t1, 0, not_prime # if resto == 0 go to not_prime
		blt 
		
		mul $t2, $t0, $t0 # t2 = t1 * t1
		addi $t0, $t0, 1 # t1++
		
		bgt $t2, $s0, prime # if t2 > s0, go to is prime
		j loop
	
	prime:
		li $v0, 4
		la $a0, prime_m
		syscall
		j exit
	
	not_prime:
		li $v0, 4
		la $a0, notprime_m
		syscall
		j exit
	
	exit:
	li $v0, 10
	syscall