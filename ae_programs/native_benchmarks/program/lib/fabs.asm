
fabs.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <fabs>:
   0:	f2 41 0f 10 47 10    	movsd  0x10(%r15),%xmm0
   6:	66 0f 54 c1          	andpd  %xmm1,%xmm0
   a:	41 5e                	pop    %r14
   c:	c4 43 fb f0 f6 0c    	rorx   $0xc,%r14,%r14
  12:	67 4f 03 34 f7       	add    (%r15d,%r14d,8),%r14
  17:	c4 43 fb f0 f6 34    	rorx   $0x34,%r14,%r14
  1d:	41 ff e6             	jmpq   *%r14
