
fabs.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <fabs>:
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	f2 0f 11 45 f0       	movsd  %xmm0,-0x10(%rbp)
   9:	f2 41 0f 10 47 10    	movsd  0x10(%r15),%xmm0
   f:	66 0f 54 c1          	andpd  %xmm1,%xmm0
  13:	41 5e                	pop    %r14
  15:	c4 43 fb f0 f6 0c    	rorx   $0xc,%r14,%r14
  1b:	67 4f 03 34 f7       	add    (%r15d,%r14d,8),%r14
  20:	c4 43 fb f0 f6 34    	rorx   $0x34,%r14,%r14
  26:	41 ff e6             	jmpq   *%r14
  29:	f2 0f 10 45 f8       	movsd  -0x8(%rbp),%xmm0
  2e:	5d                   	pop    %rbp
  2f:	c3                   	retq   
