# CS10 Lab 4
# Program prompts user to enter a top value and
# computes the sum of all odd integers from
# 1 inclusive up to (and possibly including) top
# also uses a looping construct to generate the sum
# then displays the result sum to the MARS Run I/O window
# Development Environment:  MARS MIPS Simulator
# Name:  Selahittin Saytas
# Solution File: selahittinSaytasFoothillLab4.asm
# Date:  10/18/20
# Registers Used:
# $a0 : holds address of strings and integer to be printed
# $v0 : holds address syscalls
# $t0 : holds user entered int value
# $t1 : holds loop start value 1

	.data				# Data declaration section
					# String and integer variables to be printed
familyName:		.asciiz "Family name\t\t: Saytas\n"
studentId:		.asciiz "Student ID\t\t: 20373335\n"
prompt:			.asciiz "Please enter top value\t: "

	.text				# Assembly language instructions go in text segment
main:					# Start of code section	
	la $a0, familyName		# Load the addr of 'familyName' into $a0 register
	li $v0, 4			# 4 is the print_string syscall
	syscall 			# syscall performs operation specified in $v0 register
	
	la $a0, studentId		# Load the addr of 'studentId' into $a0 register
	li $v0, 4			# 4 is the print_string syscall
	syscall				# syscall performs operation specified in $v0 register
	
	la $a0, prompt			# Load the addr of 'prompt' into $a0 register
	li $v0, 4			# 4 is the print_string syscall
	syscall				# syscall performs operation specified in $v0 register
	
	li, $v0, 5			# Use read_int to read in a number into $v0
	syscall				# syscall performs operation specified in $v0 register
	move $t0, $v0			# Copies user input away safely from $v0 into $t0
	
	li $t1, 1			# Start at 1
	move $a0, $t1			# Move the top value $t1 into $a0 so that
					# we can print it with print_int
	add $a0, $zero, $zero		# Initialize running sum $a0 = 0

top_of_loop:
	bgt $t1, $t0, end_of_loop	# Break out if loop exceeds  $t0 user input
	add $a0, $a0, $t1		# Sum odd integers
	add $t1, $t1, 2			# $t1 = $t1 + 2
	b top_of_loop			# Loop back

end_of_loop:
	li $v0, 1			# 1 is the print_int syscall
	syscall				# syscall performs operation specified in $v0 register
	
	# Exit syscall
	li $v0, 10			# 10 is the exit syscall
	syscall				# Do the syscall
