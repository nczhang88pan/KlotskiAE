
net_b.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <mbedtls_net_connect>:
   0:	31 c0                	xor    %eax,%eax
   2:	c3                   	retq   
   3:	66 66 66 66 2e 0f 1f 	data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
   a:	84 00 00 00 00 00 

0000000000000010 <mbedtls_net_set_block>:
  10:	31 c0                	xor    %eax,%eax
  12:	c3                   	retq   
  13:	66 66 66 66 2e 0f 1f 	data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  1a:	84 00 00 00 00 00 

0000000000000020 <mbedtls_net_set_nonblock>:
  20:	31 c0                	xor    %eax,%eax
  22:	c3                   	retq   
  23:	66 66 66 66 2e 0f 1f 	data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  2a:	84 00 00 00 00 00 

0000000000000030 <mbedtls_net_usleep>:
  30:	c3                   	retq   
  31:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  38:	0f 1f 84 00 00 00 00 
  3f:	00 

0000000000000040 <mbedtls_net_recv>:
  40:	31 c0                	xor    %eax,%eax
  42:	c3                   	retq   
  43:	66 66 66 66 2e 0f 1f 	data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  4a:	84 00 00 00 00 00 

0000000000000050 <mbedtls_sgx_net_recv>:
  50:	31 c0                	xor    %eax,%eax
  52:	c3                   	retq   
  53:	66 66 66 66 2e 0f 1f 	data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  5a:	84 00 00 00 00 00 

0000000000000060 <mbedtls_net_init>:
  60:	c7 07 ff ff ff ff    	movl   $0xffffffff,(%rdi)
  66:	c3                   	retq   
  67:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  6e:	00 00 

0000000000000070 <mbedtls_net_bind>:
  70:	31 c0                	xor    %eax,%eax
  72:	c3                   	retq   
  73:	66 66 66 66 2e 0f 1f 	data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  7a:	84 00 00 00 00 00 

0000000000000080 <mbedtls_net_accept>:
  80:	31 c0                	xor    %eax,%eax
  82:	c3                   	retq   
  83:	66 66 66 66 2e 0f 1f 	data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  8a:	84 00 00 00 00 00 

0000000000000090 <mbedtls_net_recv_timeout>:
  90:	31 c0                	xor    %eax,%eax
  92:	c3                   	retq   
  93:	66 66 66 66 2e 0f 1f 	data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  9a:	84 00 00 00 00 00 

00000000000000a0 <mbedtls_net_send>:
  a0:	31 c0                	xor    %eax,%eax
  a2:	c3                   	retq   
  a3:	66 66 66 66 2e 0f 1f 	data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  aa:	84 00 00 00 00 00 

00000000000000b0 <mbedtls_net_free>:
  b0:	c3                   	retq   
