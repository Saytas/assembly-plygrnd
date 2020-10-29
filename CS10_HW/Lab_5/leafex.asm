# Unit 6 Example CS10 
# Program Name:  w6leafex.asm
# Description: Program to demonstrate implementing a 
#              leaf procedure in MIPS.
# Discussion: A leaf procedure is a procedure that does not
#             make any subroutine calls.  That is, there 
#             is no jal call(i.e. findMin3 procedure).
# Pros: Leaf procedures run efficiently on a RISC machine,
#       because there is less need (or sometimes no need)
#       to use the stack at all.  Arguments are passed to
#       the procedure through registers $a0-$a3 and return
#       values are returned using registers $v0-$v1.
# Registers used:
# a0 - holds x
# a1 - holds y
# a2 - holds z
# t0 - hold min value
# v0 - return min value from function 
# ra - return address 

    .data
min_msg:   .asciiz "Find min of 3 values\n"

    .text
main:                         # MARS start execution at main
          la $a0, min_msg     # load the addr of min_msg into $a0
          li $v0, 4           # 4 is the print_string syscall
          syscall             # do the syscall
   
          li $a0, 3           # set arg 0
          li $a1, 4           # set arg 1
          li $a2, 5           # set arg 2
          jal findMin3
          move $t0, $v0       # save return value to $t0
   
          li $v0, 10          # 10 is the exit syscall
          syscall             # do the syscall
   
findMin3: move $t0, $a0       # min = x        
          bge $a1, $t0, IF2   # branch if !(y < min)
          move $t0, $a1       # min = y
IF2:      bge $a1, $t0, FOUND # branch if !(z < min)   
          move $t0, $a2       # min = z
FOUND:    move $v0, $t0       # retval = min
          jr $ra              # return 
   
  

   

