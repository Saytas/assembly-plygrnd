# Lab 4 CS10 w4whileloop.asm
# Program to demonstrate basic MIPS branch instructions
# by printing out the numbers 1 to 20 as per a WHILE loop

		.data
newline:	.asciiz	"\n"

		.text
main:		 li $t0, 1   # Start at 1
top_of_loop: bgt $t0, 20, end_of_loop  # Break out if $t0 exceeds loop ub

		move $a0, $t0   # print_int($t0)
		li $v0, 1		
		syscall

		la $a0, newline # print out a newline
		li $v0, 4
		syscall

		add $t0, $t0, 1 # $t0++
		b top_of_loop   # and loop back

end_of_loop:	li $v0, 10  # exit syscall
		syscall
