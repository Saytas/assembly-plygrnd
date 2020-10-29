# Lab 5 CS10 w6factorial.asm 
# This programs demonstrates the use of MIPS calling conventions
# and stack frames for a recursive function: Factorial(x). The
# function receives its single argument in $a0, and returns
# Factorial($a0) in register $v0.
# 

		.text
main:	subu $sp, $sp, 24        # Build our stack frame
		sw $ra, 20($sp)

		li $a0, 6                # Let's do Factorial(6)
		jal factorial            # Get the result back in $v0,
		move $a0, $v0            # and print it out
		li $v0, 1
		syscall

		li $v0, 10               # exit
		syscall


factorial: subu $sp, $sp, 24     # Minimum frame size is 24 bytes
		sw $ra, 20($sp)          # Save our return address before
                                 # We call another copy of ourselves.
		sw $a0, 0($sp)           # Save our argument as well, so we
                                 # can multiply using it later.
		bgt $a0, 1, notbasecase  # If arg > 1, not the base case, skip
basecase:	li $v0, 1            # Base case: fact(1) is 1.
		b factreturn             # We can return the result now.

notbasecase:  subi $a0, $a0, 1	 # Not the base case, so subtract 1 from our
		jal factorial            # argument and call another copy of ourselves.
                                 # At this point, the call returns with result in $v0
		lw $a0, 0,($sp)          # Reload our original argument from the stack frame
		mulo $v0, $a0, $v0       # Do result = our argument * Factorial(our argument - 1)

factreturn:	lw $ra, 20($sp)      # Restore our return address
		addu $sp, $sp, 24        # Destroy our frame
		jr $ra                   # and return to the caller
