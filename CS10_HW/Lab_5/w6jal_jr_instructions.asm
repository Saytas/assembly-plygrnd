#  Lab 5 CS10 w6jal_jr_instructions.asm 
#  Program to demonstrate the jal and jr MIPS instructions
#
		.data
string1:	.asciiz "Hello world!\n"
string2:	.asciiz "The second string\n"

		.text
main:   la $a0, string1 # Print the first string out
		li $v0, 4
		syscall

                        # Now call the function() with no arguments.
                        # We use the jal instruction. This stores the
                        # address of the instruction after the jal into
                        # the $ra (return address) register, and then
                        # jumps to the first instruction of the function
		jal function

		li $v0, 4       # $a0 should still contain a pointer to the first
		syscall         # string, shouldn't it? So let's print it out again

		li $v0, 10      # Finally, exit the program
		syscall


# This function is called from main(). It prints a string and returns
function:	la $a0, string2
		li $v0, 4
		syscall         # Print out the string

		jr $ra          # Jump back to the instruction that the $ra
                        # register points to
