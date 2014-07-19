/***************************************************************
 This program does nothing, just exits correctly
 and returns an exit code to the operating system.

 Compile it with, run,  and check the exit code:
   gcc -o empty ./00_empty.s
   ./empty
   echo $?
 ***************************************************************/

/* Things that start with "." are _assembler directives_,
   they tell the assembler what to do.
   Things that end with ":" are _symbols_, the assembler
   converts them to memory addresses.
   The rest is actual CPU instructions. */

/* .file directive is for file identification, safe to omit */
.file "00_empty.s"

.text /* Magic */

/* We need the main function. There is no special syntax for it,
   so we just create a symbol that points to some CPU instructions. 
   The name "main" has some significance to GCC though: it uses it
   as default _entry point_. */
main:
    /* To do what the header says, we need to leave the exit code
       for the OS somewhere and tell it we are done.
       The OS expects the EAX register to contain the exit code,
       and "ret" is the "subroutine return" instruction.

       Constants are prefixed with "$", hexadecimal numbers are marked with "0x",
       registers are prefixed with "%".
       The purpose of those prefixes, apart from providing visual cues,
       is to prevent name collisions with C parts in inline assembly. */

    movl $0x2A, %eax    /* Put number hexadecimal number 2A in EAX */
    ret                 /* Return from the "main" subroutine */

/* Magic again */
.global main
.type main, @function
.size main, .-main

/* Excercises:
     Change 0x2A to another number and see what happens
 */
