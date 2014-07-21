.text

.global main
.type main, @function

main:
    /* You can move around full 8-byte words, 4-byte halfwords,
       2-byte "quarterwords", and single bytes.
       For historical reasons, 2-byte data units are often referred to
       as "words", and so full 64-bit words are "quad-words".

       x86_64 offers 16 64-bit registers (RAX, RBX, RCX, RDX, RSI, RDI,
       RBP, RSP, and R8 to R15).

       For "legacy" registers (RAX, RBX, RCX, RDX, RDI, RSI, RBP, RSP),
       you should use the following syntax for accessing parts of it
       (by example of EAX):
           RAX for 64-bit
           EAX for 32-bit
           AX for 16-bit
           AH for higher 8 bit of AX
           AL for lower 8 bit of AX

       For "new" registers syntax is a bit more consistent:
           R8 for 64-bit
           R8D for 32-bit (from "double [16-bit] word")
           R8W for 16-bit (from 16-bit word)
           R8B for 8-bit

       Use "mov <source>, <destination>" instruction to load a value
       into a register. */

    /* Load constant 0 into %ah 
       Constant encoded in the instruction is often referred
       to as "immediate operand", as opposed to register 
       or memory address operand */
    mov $0, %ah

    /* Load contents of %rax into %r15 */
    mov %eax, %r15d
    mov %al, %r9b

    /* Load memory address of the "main" function into %r11 
    mov main, %r11

    /* Note the absense of "$": bare number or symbol is  
       interpreted as memory address (pointer) instead of
       a constant. Accessing an arbitrary address this way
       will give unexpected result (most commonly sefgault).
       Don't confuse constants with pointers, like in
           mov 10, %rax
       where you meant loading immediate,
           mov $10, %rax
     */


    /* You may specify data width suffix (b, w, l, q) explicitly.
       In many cases it's not needed, width is inferred from the
       register operand. Most people do specify it anyway though. */
    movb $0xAB,              %al
    movw $0xABCD,            %ax
    movl $0xABCDEF99,        %ecx
    movq $0x123456789ABCDEF, %rdx

    /* If you want to save a value from a register for a short time,
       you can push it on stack.
       Sometimes you even have to. */
    push  %rax
    push  %r14

    /* Don't forget to retrieve it from there when you are done
       messing up with that register! */
    pop   %rax
    pop  %r14

    ret

.size main, .-main
