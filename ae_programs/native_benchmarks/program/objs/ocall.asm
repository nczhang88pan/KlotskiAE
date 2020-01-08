
ocall.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <sgx_ocall>:
   0:	49 89 e6             	mov    %rsp,%r14
   3:	49 bd 00 00 00 00 00 	movabs $0x0,%r13
   a:	00 00 00 
   d:	49 8b 65 00          	mov    0x0(%r13),%rsp
  11:	4d 89 75 00          	mov    %r14,0x0(%r13)
  15:	e8 00 00 00 00       	callq  1a <sgx_ocall+0x1a>
  1a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  20:	49 89 e6             	mov    %rsp,%r14
  23:	49 bd 00 00 00 00 00 	movabs $0x0,%r13
  2a:	00 00 00 
  2d:	49 8b 65 00          	mov    0x0(%r13),%rsp
  31:	4d 89 75 00          	mov    %r14,0x0(%r13)
  35:	49 be 00 00 00 00 00 	movabs $0x0,%r14
  3c:	00 00 00 
  3f:	90                   	nop
  40:	49 bf 00 00 00 00 00 	movabs $0x0,%r15
  47:	00 00 00 
  4a:	c3                   	retq   
  4b:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  51:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  58:	0f 1f 84 00 00 00 00 
  5f:	00 

0000000000000060 <sgx_ocall.loader>:
  60:	c3                   	retq   
