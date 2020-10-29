# CS10 Lab 3
# Program prints out various strings and integers
# does basic arithmetic calculations using control
# statetement if branch
# Development Environment:  MARS MIPS Simulator
# Name:  Selahittin Saytas
# Solution File: selahittinSaytasFoothillLab3.asm
# Date:  10/12/20
# Registers Used:
# $a0 : holds address of strings and integer to be printed
# $v0 : holds address syscalls
# $s0 : holds the sum of the numbers in my student ID
# $s1 : holds the number of letters in my last name
# $t0 : holds if branch result
# $t1 : holds the result of expression1
# $t2 : holds the result of expression2
# $t3 : holds the result of expression3
# $t4 : holds the result of expression4

	.data			# Data declaration section
				# String and integer variables to be printed
id:			.word	20373335
myId:			.word	26
nLet:			.word	6

familyName:		.asciiz "\nMy family name is Saytas"
studentId:		.asciiz "\nMy Student ID is "
valId:			.asciiz "\nThe value of myId is "
numCharacter:		.asciiz "\nThe number of characters in my last name is "

expression1:		.asciiz	"\n\nnLet + myId = "
expression2:		.asciiz	"\nnLet - myId = "
expression3:		.asciiz	"\nnLet * 4 = "
expression4:		.asciiz	"\neven adjust(nLet + myId) / 2 = "

	.text			# Assembly language instructions go in text segment
main:				# Start of code section	
	la $a0, familyName	# Load the addr of 'familyName' into $a0 register
	li $v0, 4		# 4 is the print_string syscall
	syscall 		# syscall performs operation specified in $v0 register
	
	la $a0, studentId	# Load the addr of 'studentId' into $a0 register
	li $v0, 4		# 4 is the print_string syscall
	syscall			# syscall performs operation specified in $v0 register
	
	lw $a0, id		# Load the addr of 'id' into $a0 register
	li $v0, 1		# 1 is the print_int syscall
	syscall			# syscall performs operation specified in $v0 register
	
	lw $s0 myId		# 'myId' the sum of the numbers in my student ID
	lw $s1 nLet		# 'nLet' the number of letters in my last name
	
	la $a0, valId		# Load the addr of 'valId' into $a0 register
	li $v0, 4		# 4 is the print_string syscall
	syscall			# syscall performs operation specified in $v0 register
	move $a0, $s0		# Moves integer $s0 into $a0
	li $v0, 1		# 1 is the print_int syscall
	syscall			# syscall performs operation specified in $v0 register
	
	la $a0, numCharacter	# Load the addr of 'numCharacter' into $a0 register
	li $v0, 4		# 4 is the print_string syscall
	syscall			# syscall performs operation specified in $v0 register
	move $a0, $s1		# Moves integer $s1 into $a0
	li $v0, 1		# 1 is the print_int syscall
	syscall			# syscall performs operation specified in $v0 register
	
	
	
	# Prints expression 1
	la $a0, expression1	# Load the addr of 'expression1' into $a0 register
	li $v0, 4		# 4 is the print_string syscall
	syscall			# syscall performs operation specified in $v0 register
	add $t1, $s1, $s0	# Puts sum of $s1 and $s0 into $t1
	move $a0, $t1		# Moves integer $t1 into $a0
	li $v0, 1		# 1 is the print_int syscall
	syscall			# syscall performs operation specified in $v0 register
	
	# Prints expression 2
	la $a0, expression2	# Load the addr of 'expression2' into $a0 register
	li $v0, 4		# 4 is the print_string syscall
	syscall			# syscall performs operation specified in $v0 register
	sub $t2, $s1, $s0	# Puts the difference of $s1 and $s0 into $t2
	move $a0, $t2		# Moves integer $t2 into $a0
	li $v0, 1		# 1 is the print_int syscall
	syscall			# syscall performs operation specified in $v0 register
	
	# Prints expression 3
	la $a0, expression3	# Load the addr of 'expression3' into $a0 register
	li $v0, 4		# 4 is the print_string syscall
	syscall			# syscall performs operation specified in $v0 register
	sll $t3, $s1, 2		# Shift bits to the left - $t3 = $s1 << 2 bit position
				# Take $s1 and shift it over 2 bits - (equivalent to multiply by 4)
	move $a0, $t3		# Moves integer $t3 into $a0
	li $v0, 1		# 1 is the print_int syscall
	syscall			# syscall performs operation specified in $v0 register
	
	# Testing if even or not
	andi $t0, $t1, 1
	j EVEN
	
	EVEN:
	# Prints expression 4
	la $a0, expression4	# Load the addr of 'expression4' into $a0 register
	li $v0, 4		# 4 is the print_string syscall
	syscall			# syscall performs operation specified in $v0 register
	srl $t4, $t1, 1		# Shift bits to the right - $t4 = $t1 >> 1 bit position
				# (equivalent to dividing by first power of 2)
	move $a0, $t4		# Moves integer $t4 into $a0
	li $v0, 1		# 1 is the print_int syscall
	syscall			# syscall performs operation specified in $v0 register
	
	li $v0, 10		# 10 is the exit syscall
	syscall			# Do the syscall
