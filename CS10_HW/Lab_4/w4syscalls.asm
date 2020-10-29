# Lab 4 CS10 w4syscalls.asm
# Program to demonstrate some MARS system calls
#
	.data
prompt:	.asciiz	"Please tell me how old you are: "
result:	.asciiz	"You told me that your age is "

	.text
main:
	li $v0, 4      # Perform the print_string
	la $a0, prompt # using the prompt
	syscall
	               # Use read_int to read in
	li $v0, 5      # a number into $v0
	syscall
	move $t0, $v0  # Copy it away safely into $t0

	li $v0, 4      # Print out the result string
	la $a0, result
	syscall
	               # Move the age into $a0
	move $a0, $t0  # so that we can print it
	li $v0, 1      # with print_int 
	syscall
	               # Now exit the program
	li $v0, 10
	syscall
