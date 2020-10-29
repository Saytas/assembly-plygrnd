# Example CS10 Lab 2
# Program to demonstrate a basic hello world program in MIPS.
# Development Environment:  MARS MIPS Simulator
# Name:  Ann Foothill
# Solution File: a2hello.asm
# Date:  10/3/18
# Registers Used:
# $a0 : holds address of hello_msg
# $v0 : holds addr sycalls

	.data
hello_msg:	.asciiz	"Hello World!\n"

	.text
main:				
   la $a0, hello_msg # load the addr of hello_msg into $a0.
   li $v0, 4         # 4 is the print_string syscall.
   syscall           # do the syscall.
   li $v0, 10        # 10 is the exit syscall.
   syscall           # do the syscall

