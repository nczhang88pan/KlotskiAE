# int strncmp(const char *_l, const char *_r, size_t n)
.global strncmp
.type strncmp,@function
strncmp:
    test %rdx,%rdx
    je 1f
	# dereference rdi

    # end 
    mov (%rdi),%al
    test %al,%al
    je 3f

    mov $0x1,%ecx
    sub %rdx,%rcx
    inc %rdi

4:  movzbl (%rsi),%edx
    cmp %dl,%al
    jne 2f
    test %rcx,%rcx
    je 2f
    test %dl,%dl
    je 2f
    inc %rsi
    mov (%rdi),%al
    inc %rcx
    inc %rdi
    test %al,%al
    jne 4b 
    
3:  xor %eax,%eax
2:  movzbl %al,%eax
    movzbl (%rsi),%ecx
    sub %ecx,%eax
    ret
1:  xor %eax, %eax
    ret