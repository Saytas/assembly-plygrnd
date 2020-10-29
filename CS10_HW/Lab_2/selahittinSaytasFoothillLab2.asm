# CS10 Lab 2
# Program to demonstrate a basic hello world program in MIPS
# also prints out various strings and an integer
# Development Environment:  MARS MIPS Simulator
# Name:  Selahittin Saytas
# Solution File: selahittinSaytasFoothillLab2.asm
# Date:  10/05/20
# Registers Used:
# $a0 : holds address of hello_msg, last_name, foothill_id_str, foothill_id_int, 
#	course_info, info_one, info_two, and info_three
# $v0 : holds address sycalls

	.data			# Data declaration section
				# String and integer variables to be printed
hello_msg:		.asciiz	"Greetings\t: Hello World!\n"
last_name:		.asciiz	"Last Name\t: Saytas\n"
foothill_id_str:	.asciiz	"Foothill ID\t: "
foothill_id_int:	.word	20373335
course_info:		.asciiz "\nCourse Info\t:\n\n"
info_one:		.asciiz "\t\t1- Lab assignments open on Wednesdays at 8:00AM and due Tuesday by midnight\n"
info_two:		.asciiz "\t\t2- Midterm is on Tuesday of week 6\n"
info_three:		.asciiz "\t\t3- Final is on Tuesday of week 12\n"

	.text			# Assembly language instructions go in text segment
main:				# Start of code section
	la $a0, hello_msg	# Load the addr of 'hello_msg' into $a0 register
	li $v0, 4		# 4 is the print_string syscall
	syscall 		# syscall performs operation specifiead in $v0 register
	
	la $a0, last_name	# Load the addr of 'last_name' into $a0 register
	li $v0, 4		# 4 is the print_string syscall
	syscall			# syscall performs operation specifiead in $v0 register
	
	la $a0, foothill_id_str	# Load the addr of 'foothill_id_str' into $a0 register
	li $v0, 4		# 4 is the print_string syscall
	syscall			# syscall performs operation specifiead in $v0 register
	
	lw $a0, foothill_id_int	# Load the addr of 'foothill_id_int' into $a0 register
	li $v0, 1		# 1 is the print_int syscall
				# Print integer in $a0 out using syscall 1
	syscall			# syscall performs operation specifiead in $v0 register
	
	la $a0, course_info	# Load the addr of 'course_info' into $a0 register
	li $v0, 4		# 4 is the print_string syscall
	syscall			# syscall performs operation specifiead in $v0 register
	
	la $a0, info_one	# Load the addr of 'info_one' into $a0 register
	li $v0, 4		# 4 is the print_string syscall
	syscall			# syscall performs operation specifiead in $v0 register
	
	la $a0, info_two	# Load the addr of 'info_two' into $a0 register
	li $v0, 4		# 4 is the print_string syscall
	syscall			# syscall performs operation specifiead in $v0 register
	
	la $a0, info_three	# Load the addr of 'info_three' into $a0 register
	li $v0, 4		# 4 is the print_string syscall
	syscall			# syscall performs operation specifiead in $v0 register
	
	li $v0, 10		# 10 is the exit syscall
	syscall			# Do the syscall
