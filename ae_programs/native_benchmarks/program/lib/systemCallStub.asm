
systemCallStub.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <clock>:
   0:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14
   7:	e9 00 00 00 00       	jmpq   c <clock+0xc>
   c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  11:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  18:	0f 1f 84 00 00 00 00 
  1f:	00 

0000000000000020 <time>:
  20:	49 c7 c6 01 00 00 00 	mov    $0x1,%r14
  27:	e9 00 00 00 00       	jmpq   2c <time+0xc>
  2c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  31:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  38:	0f 1f 84 00 00 00 00 
  3f:	00 

0000000000000040 <localtime>:
  40:	49 c7 c6 02 00 00 00 	mov    $0x2,%r14
  47:	e9 00 00 00 00       	jmpq   4c <localtime+0xc>
  4c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  51:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  58:	0f 1f 84 00 00 00 00 
  5f:	00 

0000000000000060 <gmtime>:
  60:	49 c7 c6 03 00 00 00 	mov    $0x3,%r14
  67:	e9 00 00 00 00       	jmpq   6c <gmtime+0xc>
  6c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  71:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  78:	0f 1f 84 00 00 00 00 
  7f:	00 

0000000000000080 <mktime>:
  80:	49 c7 c6 04 00 00 00 	mov    $0x4,%r14
  87:	e9 00 00 00 00       	jmpq   8c <mktime+0xc>
  8c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  91:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  98:	0f 1f 84 00 00 00 00 
  9f:	00 

00000000000000a0 <gettimeofday>:
  a0:	49 c7 c6 05 00 00 00 	mov    $0x5,%r14
  a7:	e9 00 00 00 00       	jmpq   ac <gettimeofday+0xc>
  ac:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  b1:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  b8:	0f 1f 84 00 00 00 00 
  bf:	00 

00000000000000c0 <puts>:
  c0:	49 c7 c6 06 00 00 00 	mov    $0x6,%r14
  c7:	e9 00 00 00 00       	jmpq   cc <puts+0xc>
  cc:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  d1:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  d8:	0f 1f 84 00 00 00 00 
  df:	00 

00000000000000e0 <open>:
  e0:	49 c7 c6 07 00 00 00 	mov    $0x7,%r14
  e7:	e9 00 00 00 00       	jmpq   ec <open+0xc>
  ec:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  f1:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  f8:	0f 1f 84 00 00 00 00 
  ff:	00 

0000000000000100 <close>:
 100:	49 c7 c6 08 00 00 00 	mov    $0x8,%r14
 107:	e9 00 00 00 00       	jmpq   10c <close+0xc>
 10c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 111:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 118:	0f 1f 84 00 00 00 00 
 11f:	00 

0000000000000120 <read>:
 120:	49 c7 c6 09 00 00 00 	mov    $0x9,%r14
 127:	e9 00 00 00 00       	jmpq   12c <read+0xc>
 12c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 131:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 138:	0f 1f 84 00 00 00 00 
 13f:	00 

0000000000000140 <write>:
 140:	49 c7 c6 0a 00 00 00 	mov    $0xa,%r14
 147:	e9 00 00 00 00       	jmpq   14c <write+0xc>
 14c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 151:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 158:	0f 1f 84 00 00 00 00 
 15f:	00 

0000000000000160 <lseek>:
 160:	49 c7 c6 0b 00 00 00 	mov    $0xb,%r14
 167:	e9 00 00 00 00       	jmpq   16c <lseek+0xc>
 16c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 171:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 178:	0f 1f 84 00 00 00 00 
 17f:	00 

0000000000000180 <socket>:
 180:	49 c7 c6 0c 00 00 00 	mov    $0xc,%r14
 187:	e9 00 00 00 00       	jmpq   18c <socket+0xc>
 18c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 191:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 198:	0f 1f 84 00 00 00 00 
 19f:	00 

00000000000001a0 <bind>:
 1a0:	49 c7 c6 0d 00 00 00 	mov    $0xd,%r14
 1a7:	e9 00 00 00 00       	jmpq   1ac <bind+0xc>
 1ac:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 1b1:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 1b8:	0f 1f 84 00 00 00 00 
 1bf:	00 

00000000000001c0 <connect>:
 1c0:	49 c7 c6 0e 00 00 00 	mov    $0xe,%r14
 1c7:	e9 00 00 00 00       	jmpq   1cc <connect+0xc>
 1cc:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 1d1:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 1d8:	0f 1f 84 00 00 00 00 
 1df:	00 

00000000000001e0 <listen>:
 1e0:	49 c7 c6 0f 00 00 00 	mov    $0xf,%r14
 1e7:	e9 00 00 00 00       	jmpq   1ec <listen+0xc>
 1ec:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 1f1:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 1f8:	0f 1f 84 00 00 00 00 
 1ff:	00 

0000000000000200 <accept>:
 200:	49 c7 c6 10 00 00 00 	mov    $0x10,%r14
 207:	e9 00 00 00 00       	jmpq   20c <accept+0xc>
 20c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 211:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 218:	0f 1f 84 00 00 00 00 
 21f:	00 

0000000000000220 <fstat>:
 220:	49 c7 c6 11 00 00 00 	mov    $0x11,%r14
 227:	e9 00 00 00 00       	jmpq   22c <fstat+0xc>
 22c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 231:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 238:	0f 1f 84 00 00 00 00 
 23f:	00 

0000000000000240 <send>:
 240:	49 c7 c6 12 00 00 00 	mov    $0x12,%r14
 247:	e9 00 00 00 00       	jmpq   24c <send+0xc>
 24c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 251:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 258:	0f 1f 84 00 00 00 00 
 25f:	00 

0000000000000260 <recv>:
 260:	49 c7 c6 13 00 00 00 	mov    $0x13,%r14
 267:	e9 00 00 00 00       	jmpq   26c <recv+0xc>
 26c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 271:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 278:	0f 1f 84 00 00 00 00 
 27f:	00 

0000000000000280 <sendto>:
 280:	49 c7 c6 14 00 00 00 	mov    $0x14,%r14
 287:	e9 00 00 00 00       	jmpq   28c <sendto+0xc>
 28c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 291:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 298:	0f 1f 84 00 00 00 00 
 29f:	00 

00000000000002a0 <recvfrom>:
 2a0:	49 c7 c6 15 00 00 00 	mov    $0x15,%r14
 2a7:	e9 00 00 00 00       	jmpq   2ac <recvfrom+0xc>
 2ac:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 2b1:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 2b8:	0f 1f 84 00 00 00 00 
 2bf:	00 

00000000000002c0 <gethostname>:
 2c0:	49 c7 c6 16 00 00 00 	mov    $0x16,%r14
 2c7:	e9 00 00 00 00       	jmpq   2cc <gethostname+0xc>
 2cc:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 2d1:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 2d8:	0f 1f 84 00 00 00 00 
 2df:	00 

00000000000002e0 <getaddrinfo>:
 2e0:	49 c7 c6 17 00 00 00 	mov    $0x17,%r14
 2e7:	e9 00 00 00 00       	jmpq   2ec <getaddrinfo+0xc>
 2ec:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 2f1:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 2f8:	0f 1f 84 00 00 00 00 
 2ff:	00 

0000000000000300 <getenv>:
 300:	49 c7 c6 18 00 00 00 	mov    $0x18,%r14
 307:	e9 00 00 00 00       	jmpq   30c <getenv+0xc>
 30c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 311:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 318:	0f 1f 84 00 00 00 00 
 31f:	00 

0000000000000320 <getsockname>:
 320:	49 c7 c6 19 00 00 00 	mov    $0x19,%r14
 327:	e9 00 00 00 00       	jmpq   32c <getsockname+0xc>
 32c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 331:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 338:	0f 1f 84 00 00 00 00 
 33f:	00 

0000000000000340 <getsockopt>:
 340:	49 c7 c6 1a 00 00 00 	mov    $0x1a,%r14
 347:	e9 00 00 00 00       	jmpq   34c <getsockopt+0xc>
 34c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 351:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 358:	0f 1f 84 00 00 00 00 
 35f:	00 

0000000000000360 <getservbyname>:
 360:	49 c7 c6 1b 00 00 00 	mov    $0x1b,%r14
 367:	e9 00 00 00 00       	jmpq   36c <getservbyname+0xc>
 36c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 371:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 378:	0f 1f 84 00 00 00 00 
 37f:	00 

0000000000000380 <getprotobynumber>:
 380:	49 c7 c6 1c 00 00 00 	mov    $0x1c,%r14
 387:	e9 00 00 00 00       	jmpq   38c <getprotobynumber+0xc>
 38c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 391:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 398:	0f 1f 84 00 00 00 00 
 39f:	00 

00000000000003a0 <setsockopt>:
 3a0:	49 c7 c6 1d 00 00 00 	mov    $0x1d,%r14
 3a7:	e9 00 00 00 00       	jmpq   3ac <setsockopt+0xc>
 3ac:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 3b1:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 3b8:	0f 1f 84 00 00 00 00 
 3bf:	00 

00000000000003c0 <htons>:
 3c0:	49 c7 c6 1e 00 00 00 	mov    $0x1e,%r14
 3c7:	e9 00 00 00 00       	jmpq   3cc <htons+0xc>
 3cc:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 3d1:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 3d8:	0f 1f 84 00 00 00 00 
 3df:	00 

00000000000003e0 <htonl>:
 3e0:	49 c7 c6 1f 00 00 00 	mov    $0x1f,%r14
 3e7:	e9 00 00 00 00       	jmpq   3ec <htonl+0xc>
 3ec:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 3f1:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 3f8:	0f 1f 84 00 00 00 00 
 3ff:	00 

0000000000000400 <ntohs>:
 400:	49 c7 c6 20 00 00 00 	mov    $0x20,%r14
 407:	e9 00 00 00 00       	jmpq   40c <ntohs+0xc>
 40c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 411:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 418:	0f 1f 84 00 00 00 00 
 41f:	00 

0000000000000420 <ntohl>:
 420:	49 c7 c6 21 00 00 00 	mov    $0x21,%r14
 427:	e9 00 00 00 00       	jmpq   42c <ntohl+0xc>
 42c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 431:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 438:	0f 1f 84 00 00 00 00 
 43f:	00 

0000000000000440 <signal>:
 440:	49 c7 c6 22 00 00 00 	mov    $0x22,%r14
 447:	e9 00 00 00 00       	jmpq   44c <signal+0xc>
 44c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 451:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 458:	0f 1f 84 00 00 00 00 
 45f:	00 

0000000000000460 <shutdown>:
 460:	49 c7 c6 23 00 00 00 	mov    $0x23,%r14
 467:	e9 00 00 00 00       	jmpq   46c <shutdown+0xc>
 46c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 471:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 478:	0f 1f 84 00 00 00 00 
 47f:	00 

0000000000000480 <exit>:
 480:	49 c7 c6 24 00 00 00 	mov    $0x24,%r14
 487:	e9 00 00 00 00       	jmpq   48c <exit+0xc>
 48c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 491:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 498:	0f 1f 84 00 00 00 00 
 49f:	00 

00000000000004a0 <mbedtls_net_bind>:
 4a0:	49 c7 c6 25 00 00 00 	mov    $0x25,%r14
 4a7:	e9 00 00 00 00       	jmpq   4ac <mbedtls_net_bind+0xc>
 4ac:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 4b1:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 4b8:	0f 1f 84 00 00 00 00 
 4bf:	00 

00000000000004c0 <mbedtls_net_accept>:
 4c0:	49 c7 c6 26 00 00 00 	mov    $0x26,%r14
 4c7:	e9 00 00 00 00       	jmpq   4cc <mbedtls_net_accept+0xc>
 4cc:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 4d1:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 4d8:	0f 1f 84 00 00 00 00 
 4df:	00 

00000000000004e0 <mbedtls_net_recv_timeout>:
 4e0:	49 c7 c6 27 00 00 00 	mov    $0x27,%r14
 4e7:	e9 00 00 00 00       	jmpq   4ec <mbedtls_net_recv_timeout+0xc>
 4ec:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 4f1:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 4f8:	0f 1f 84 00 00 00 00 
 4ff:	00 

0000000000000500 <mbedtls_net_send>:
 500:	49 c7 c6 28 00 00 00 	mov    $0x28,%r14
 507:	e9 00 00 00 00       	jmpq   50c <mbedtls_net_send+0xc>
 50c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 511:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 518:	0f 1f 84 00 00 00 00 
 51f:	00 
 520:	49 c7 c6 29 00 00 00 	mov    $0x29,%r14
 527:	e9 00 00 00 00       	jmpq   52c <mbedtls_net_send+0x2c>
 52c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 531:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 538:	0f 1f 84 00 00 00 00 
 53f:	00 

0000000000000540 <sgx_measure_start>:
 540:	49 c7 c6 2b 00 00 00 	mov    $0x2b,%r14
 547:	e9 00 00 00 00       	jmpq   54c <sgx_measure_start+0xc>
 54c:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
 551:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
 558:	0f 1f 84 00 00 00 00 
 55f:	00 

0000000000000560 <sgx_measure_wait>:
 560:	49 c7 c6 2c 00 00 00 	mov    $0x2c,%r14
 567:	e9 00 00 00 00       	jmpq   56c <do_sgx_ocall>

000000000000056c <do_sgx_ocall>:
 56c:	48 89 24 25 00 00 00 	mov    %rsp,0x0
 573:	00 
 574:	48 8b 24 25 00 00 00 	mov    0x0,%rsp
 57b:	00 
 57c:	4e 8b 34 f5 00 00 00 	mov    0x0(,%r14,8),%r14
 583:	00 
 584:	41 ff d6             	callq  *%r14
 587:	48 8b 24 25 00 00 00 	mov    0x0,%rsp
 58e:	00 
 58f:	c3                   	retq   

0000000000000590 <secureCopy>:
 590:	c3                   	retq   
