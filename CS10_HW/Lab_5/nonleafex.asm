# Unit 6 Example CS10 
# Program Name:  w6nonleafex.asm
# Description: Program to demonstrate implementing a 
#              non leaf procedure in MIPS.
# Discussion: A non-leaf procedure is one that does call
#             another procedure.  That is, there is a 
#             jump-and-link (jal) instruction.
# Registers used:
# a0 - holds recursive arg N
# t0 - fac result 
# sp - stack pointer
# v0 - return min value from function 
# ra - return address 

    .data
rec_msg:   .asciiz "Recursion in MIPS - Factorial\n"

    .text
main:                            # MARS start execution at main
          la $a0, rec_msg        # load the addr of rec_msg into $a0
          li $v0, 4              # 4 is the print_string syscall
          syscall                # do the syscall
   
          li $a0, 3              # set arg 0
         
          jal fac3
          move $t0, $v0          # save return value to $t0
   
          li $v0, 10             # 10 is the exit syscall
          syscall                # do the syscall
   
fac3:     li $t0, 1              # check for base case
          bgt $a0, $t0, recurse
          li $v0, 1              # base hit, set return value
          jr $ra                 # return 
   
recurse:  addi $sp, $sp, -8      # make room on stack for 
          sw $ra, 4($sp)         # return address, and 
          sw $a0, 0($sp)         # N
          
          addi $a0, $a0, -1      # calc N-1 for recursive call
          jal fac3               # calc(N-1)!
          
          lw $t1, 0($sp)         # restore N from stack
          mul $v0, $v0, $t1      # multiply (N-1)! by N
          
          lw $ra, 4($sp)         # restore return addrss from stack
          addi $sp, $sp, 8       # retore stack pointer
          jr $ra                 # return 

   

