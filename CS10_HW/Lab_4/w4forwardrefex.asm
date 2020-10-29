# Unit 4 Example CS10 
# Program Name:  w4forwardrefex.asm
# Description: Program to demonstrate how the assembler
#              handles forward references (i.e. calculate
#              branch address).
# Registers used:
# t0 - used to hold the test result
# t1 - used to hold op1
# t2 - used to hold op2
# t3 = used to hold op3
# a0 - address of string
# v0 - syscall parameter 

    .data
asm_msg:   .asciiz "Assembler forward references\n"

    .text
main:                # MARS start execution at main
   la $a0, asm_msg   # load the addr of asm_msg into $a0
   li $v0, 4         # 4 is the print_string syscall
   syscall           # do the syscall
   li $t1, 1
   li $t2, 2
   li $t3, 3
   bne $t1, $t2, L   # assembler will change to bne $t1, $t2, +1
   sll $t0, $t0, 0   # inst if not branch 
L: addiu $t2, $t3, 0x2   
   li $v0, 10        # 10 is the exit syscall
   syscall           # do the syscall
   

