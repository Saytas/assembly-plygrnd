# CS10 Lab 5
# Program calls a procedure to calculate the 
# average of two values then displays the 
# result sum to the MARS Run I/O window
# Development Environment:  MARS MIPS Simulator
# Name:  Selahittin Saytas
# Solution File: selahittinSaytasFoothillLab5.asm
# Date:  11/01/20
# Registers Used:
# $a0 	: holds address of strings and integer to be printed
# $v0 	: holds address syscalls
# $s0	: holds the integer value 12
# $s1 	: holds the integer value 16
# $s2 	: holds the integer value 2 to find the average
# $t0 	: holds the right most digit of the student ID
# $t1 	: holds the sum of $s0 and $s1
# $t7 	: holds the average number $t7 = ($s0 + $s1) / $s2
# $sp 	: stack pointer
# $sw 	: save word
# $ra 	: return address 
# $zero : Used to ...

	.data				# Data declaration section
					# String and integer variables to be printed
familyName:		.asciiz "Family name\t\t: Saytas\n"
studentId:		.asciiz "Student ID\t\t: 20373335\n"

	.text				# Assembly language instructions go in text segment
main:					# Start of code section	
	la $a0, familyName		# Load the addr of 'familyName' into $a0 register
	li $v0, 4			# 4 is the print_string syscall
	syscall 			# syscall performs operation specified in $v0 register
	
	la $a0, studentId		# Load the addr of 'studentId' into $a0 register
	li $v0, 4			# 4 is the print_string syscall
	syscall				# syscall performs operation specified in $v0 register
	
	li $s0, 12			# Load the 32-bit constant '12' into register $s0
	li $s1, 16			# Load the 32-bit constant '16' into register $s1
	li $s2, 2			# Load the 32-bit constant '2' into register $s2
	
	sub $sp, $sp, 12		# Save registers on stack by making 12 bytes room for 3 words
	sw $s0, 8($sp)			# Store $s0 on stack
	sw $s1, 4($sp)			# Store $s1 on stack
	
	jal ss_avg			# Now call the ss_avg() with no arguments.
					# We use the jal instruction. This stores the
					# address of the instruction after the jal into
					# the $ra (return address) register, and then
					# jumps to the first instruction of the function
	
	lw $t7, 0($sp)			# Reload our original argument from the stack frame by restoring $t0
	addi $sp, $sp, 8		# Restore the stack pointer
	
	add $a0, $t7, $zero		# Set register $a0 to $t0
	li $v0, 1			# 1 is the print_int syscall
	syscall				# syscall performs operation specified in $v0 register
	
	# Exit syscall
	li $v0, 10			# 10 is the exit syscall
	syscall				# Do the syscall
	
# This function is called from main()
ss_avg:
	lw $s0, 8($sp)			# Restore return address of registers from stack
	lw $s1, 4($sp)			# Restore return address of registers from stack
	addi $sp, $sp, 8		# Restore the stack pointer
	sw $t0, 0($sp)			# Store the data fetched into the stack
	
	add $t1, $s0, $s1		# Store the result of sum in  $t1 # $t1 = $s0 + $s1
	
	div $t0, $t1, $s2		# Store the result of division in $t0 # $t0 = $t1 / $s2
	sw $t0, 4($sp)			# Save $t0 on the stack
	li $t0, 5			#
	
	# Restore return address  by popping the stack
	lw $t0, 0($sp)			# Reload our original argument from the stack frame by restoring $t0
	addi $sp, $sp, 4		# Adjust $sp
	jr $ra				# Jump back to the instruction that the $ra register points to
