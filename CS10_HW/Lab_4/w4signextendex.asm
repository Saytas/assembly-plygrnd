# Unit 4 Example CS10 
# Program Name:  w4signextendex.asm
# Description: Program to demonstrate how the assembler
#              handles sign extends an immediate operand.
# Registers used:
# 0 -  zero
# t1 - used to hold sign-extended result
# t2 - used to hold sign-extend pos result
# t3 - used to hold sign-extend neg result
# a0 - address of string
# v0 - syscall parameter 

    .data
se_msg:   .asciiz "Assembler sign-extends imm operands\n"

    .text
main:                # MARS start execution at main
   la $a0, se_msg    # load the addr of se_msg into $a0
   li $v0, 4         # 4 is the print_string syscall
   syscall           # do the syscall
   addi $t2, $0, 10  # $t2 ,<- $0 + sign-extend[10]
   addi $t3, $0, -10 # $t3 <- $0 + sign-extend[-10]
   li $v0, 10        # 10 is the exit syscall
   syscall           # do the syscall
   

