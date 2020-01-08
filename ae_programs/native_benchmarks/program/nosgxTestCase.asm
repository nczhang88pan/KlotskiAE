
nosgxTestCase:     file format elf64-x86-64


Disassembly of section .text:

0000000034800100 <enclave_main>:
    34800100:	41 54                	push   %r12
    34800102:	53                   	push   %rbx
    34800103:	50                   	push   %rax
    34800104:	48 8d 1d 45 6f 20 00 	lea    0x206f45(%rip),%rbx        # 34a07050 <buf>
    3480010b:	48 8d 35 44 63 00 00 	lea    0x6344(%rip),%rsi        # 34806456 <a_spin+0x26>
    34800112:	48 8d 15 44 63 00 00 	lea    0x6344(%rip),%rdx        # 3480645d <a_spin+0x2d>
    34800119:	b9 0c 00 00 00       	mov    $0xc,%ecx
    3480011e:	31 c0                	xor    %eax,%eax
    34800120:	48 89 df             	mov    %rbx,%rdi
    34800123:	e8 88 01 00 00       	callq  348002b0 <sprintf>
    34800128:	48 89 df             	mov    %rbx,%rdi
    3480012b:	e8 80 04 00 00       	callq  348005b0 <puts>
    34800130:	4c 8b 25 c9 6e 20 00 	mov    0x206ec9(%rip),%r12        # 34a07000 <str>
    34800137:	4c 89 e7             	mov    %r12,%rdi
    3480013a:	e8 f1 02 00 00       	callq  34800430 <strlen>
    3480013f:	be 6c 00 00 00       	mov    $0x6c,%esi
    34800144:	4c 89 e7             	mov    %r12,%rdi
    34800147:	48 89 c2             	mov    %rax,%rdx
    3480014a:	e8 51 00 00 00       	callq  348001a0 <memchr>
    3480014f:	49 89 c4             	mov    %rax,%r12
    34800152:	b9 0f 00 00 00       	mov    $0xf,%ecx
    34800157:	31 c0                	xor    %eax,%eax
    34800159:	48 89 df             	mov    %rbx,%rdi
    3480015c:	48 8d 35 f3 62 00 00 	lea    0x62f3(%rip),%rsi        # 34806456 <a_spin+0x26>
    34800163:	48 8d 15 f3 62 00 00 	lea    0x62f3(%rip),%rdx        # 3480645d <a_spin+0x2d>
    3480016a:	e8 41 01 00 00       	callq  348002b0 <sprintf>
    3480016f:	48 89 df             	mov    %rbx,%rdi
    34800172:	e8 39 04 00 00       	callq  348005b0 <puts>
    34800177:	4c 89 e7             	mov    %r12,%rdi
    3480017a:	e8 31 04 00 00       	callq  348005b0 <puts>
    3480017f:	31 ff                	xor    %edi,%edi
    34800181:	e8 ea 07 00 00       	callq  34800970 <exit>
    34800186:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    3480018d:	00 00 00 

0000000034800190 <enclave_main_start>:
    34800190:	50                   	push   %rax
    34800191:	e8 6a ff ff ff       	callq  34800100 <enclave_main>
    34800196:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    3480019d:	00 00 00 

00000000348001a0 <memchr>:
    348001a0:	48 85 d2             	test   %rdx,%rdx
    348001a3:	0f 95 c0             	setne  %al
    348001a6:	0f 85 28 00 00 00    	jne    348001d4 <.LBB0_2>
    348001ac:	e9 3f 00 00 00       	jmpq   348001f0 <.LBB0_5>
    348001b1:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    348001b8:	0f 1f 84 00 00 00 00 
    348001bf:	00 

00000000348001c0 <.LBB0_4>:
    348001c0:	48 ff c7             	inc    %rdi
    348001c3:	48 83 fa 01          	cmp    $0x1,%rdx
    348001c7:	48 8d 52 ff          	lea    -0x1(%rdx),%rdx
    348001cb:	0f 95 c0             	setne  %al
    348001ce:	0f 84 1c 00 00 00    	je     348001f0 <.LBB0_5>

00000000348001d4 <.LBB0_2>:
    348001d4:	89 f9                	mov    %edi,%ecx
    348001d6:	83 e1 07             	and    $0x7,%ecx
    348001d9:	48 85 c9             	test   %rcx,%rcx
    348001dc:	0f 84 0e 00 00 00    	je     348001f0 <.LBB0_5>
    348001e2:	40 38 37             	cmp    %sil,(%rdi)
    348001e5:	0f 85 d5 ff ff ff    	jne    348001c0 <.LBB0_4>
    348001eb:	e9 08 00 00 00       	jmpq   348001f8 <.LBB0_6>

00000000348001f0 <.LBB0_5>:
    348001f0:	84 c0                	test   %al,%al
    348001f2:	0f 84 9d 00 00 00    	je     34800295 <.LBB0_14>

00000000348001f8 <.LBB0_6>:
    348001f8:	40 38 37             	cmp    %sil,(%rdi)
    348001fb:	0f 84 96 00 00 00    	je     34800297 <.LBB0_15>
    34800201:	48 83 fa 08          	cmp    $0x8,%rdx
    34800205:	0f 82 62 00 00 00    	jb     3480026d <.LBB0_11>
    3480020b:	40 0f b6 ce          	movzbl %sil,%ecx
    3480020f:	49 ba 01 01 01 01 01 	movabs $0x101010101010101,%r10
    34800216:	01 01 01 
    34800219:	4c 0f af d1          	imul   %rcx,%r10
    3480021d:	49 b8 80 80 80 80 80 	movabs $0x8080808080808080,%r8
    34800224:	80 80 80 
    34800227:	49 b9 ff fe fe fe fe 	movabs $0xfefefefefefefeff,%r9
    3480022e:	fe fe fe 
    34800231:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800238:	0f 1f 84 00 00 00 00 
    3480023f:	00 

0000000034800240 <.LBB0_9>:
    34800240:	48 8b 0f             	mov    (%rdi),%rcx
    34800243:	4c 31 d1             	xor    %r10,%rcx
    34800246:	48 89 c8             	mov    %rcx,%rax
    34800249:	48 f7 d0             	not    %rax
    3480024c:	4c 01 c9             	add    %r9,%rcx
    3480024f:	4c 21 c0             	and    %r8,%rax
    34800252:	48 85 c8             	test   %rcx,%rax
    34800255:	0f 85 25 00 00 00    	jne    34800280 <.LBB0_12>
    3480025b:	48 83 c7 08          	add    $0x8,%rdi
    3480025f:	48 83 c2 f8          	add    $0xfffffffffffffff8,%rdx
    34800263:	48 83 fa 07          	cmp    $0x7,%rdx
    34800267:	0f 87 d3 ff ff ff    	ja     34800240 <.LBB0_9>

000000003480026d <.LBB0_11>:
    3480026d:	48 85 d2             	test   %rdx,%rdx
    34800270:	0f 84 1f 00 00 00    	je     34800295 <.LBB0_14>
    34800276:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    3480027d:	00 00 00 

0000000034800280 <.LBB0_12>:
    34800280:	40 38 37             	cmp    %sil,(%rdi)
    34800283:	0f 84 0e 00 00 00    	je     34800297 <.LBB0_15>
    34800289:	48 ff c7             	inc    %rdi
    3480028c:	48 ff ca             	dec    %rdx
    3480028f:	0f 85 eb ff ff ff    	jne    34800280 <.LBB0_12>

0000000034800295 <.LBB0_14>:
    34800295:	31 d2                	xor    %edx,%edx

0000000034800297 <.LBB0_15>:
    34800297:	48 85 d2             	test   %rdx,%rdx
    3480029a:	48 0f 44 fa          	cmove  %rdx,%rdi
    3480029e:	48 89 f8             	mov    %rdi,%rax
    348002a1:	c3                   	retq   
    348002a2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    348002a9:	00 00 00 
    348002ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000348002b0 <sprintf>:
    348002b0:	48 81 ec 88 01 00 00 	sub    $0x188,%rsp
    348002b7:	84 c0                	test   %al,%al
    348002b9:	0f 29 bc 24 b0 00 00 	movaps %xmm7,0xb0(%rsp)
    348002c0:	00 
    348002c1:	0f 29 b4 24 a0 00 00 	movaps %xmm6,0xa0(%rsp)
    348002c8:	00 
    348002c9:	0f 29 ac 24 90 00 00 	movaps %xmm5,0x90(%rsp)
    348002d0:	00 
    348002d1:	0f 29 a4 24 80 00 00 	movaps %xmm4,0x80(%rsp)
    348002d8:	00 
    348002d9:	0f 29 5c 24 70       	movaps %xmm3,0x70(%rsp)
    348002de:	0f 29 54 24 60       	movaps %xmm2,0x60(%rsp)
    348002e3:	0f 29 4c 24 50       	movaps %xmm1,0x50(%rsp)
    348002e8:	0f 29 44 24 40       	movaps %xmm0,0x40(%rsp)
    348002ed:	48 89 7c 24 38       	mov    %rdi,0x38(%rsp)
    348002f2:	4c 89 4c 24 30       	mov    %r9,0x30(%rsp)
    348002f7:	4c 89 44 24 28       	mov    %r8,0x28(%rsp)
    348002fc:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
    34800301:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
    34800306:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
    3480030b:	0f 84 74 00 00 00    	je     34800385 <.LBB0_2>
    34800311:	0f 28 44 24 40       	movaps 0x40(%rsp),%xmm0
    34800316:	0f 29 84 24 f0 00 00 	movaps %xmm0,0xf0(%rsp)
    3480031d:	00 
    3480031e:	0f 28 4c 24 50       	movaps 0x50(%rsp),%xmm1
    34800323:	0f 29 8c 24 00 01 00 	movaps %xmm1,0x100(%rsp)
    3480032a:	00 
    3480032b:	0f 28 54 24 60       	movaps 0x60(%rsp),%xmm2
    34800330:	0f 29 94 24 10 01 00 	movaps %xmm2,0x110(%rsp)
    34800337:	00 
    34800338:	0f 28 5c 24 70       	movaps 0x70(%rsp),%xmm3
    3480033d:	0f 29 9c 24 20 01 00 	movaps %xmm3,0x120(%rsp)
    34800344:	00 
    34800345:	0f 28 a4 24 80 00 00 	movaps 0x80(%rsp),%xmm4
    3480034c:	00 
    3480034d:	0f 29 a4 24 30 01 00 	movaps %xmm4,0x130(%rsp)
    34800354:	00 
    34800355:	0f 28 ac 24 90 00 00 	movaps 0x90(%rsp),%xmm5
    3480035c:	00 
    3480035d:	0f 29 ac 24 40 01 00 	movaps %xmm5,0x140(%rsp)
    34800364:	00 
    34800365:	0f 28 b4 24 a0 00 00 	movaps 0xa0(%rsp),%xmm6
    3480036c:	00 
    3480036d:	0f 29 b4 24 50 01 00 	movaps %xmm6,0x150(%rsp)
    34800374:	00 
    34800375:	0f 28 bc 24 b0 00 00 	movaps 0xb0(%rsp),%xmm7
    3480037c:	00 
    3480037d:	0f 29 bc 24 60 01 00 	movaps %xmm7,0x160(%rsp)
    34800384:	00 

0000000034800385 <.LBB0_2>:
    34800385:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
    3480038a:	48 89 84 24 e8 00 00 	mov    %rax,0xe8(%rsp)
    34800391:	00 
    34800392:	48 8b 4c 24 28       	mov    0x28(%rsp),%rcx
    34800397:	48 89 8c 24 e0 00 00 	mov    %rcx,0xe0(%rsp)
    3480039e:	00 
    3480039f:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    348003a4:	48 89 94 24 d8 00 00 	mov    %rdx,0xd8(%rsp)
    348003ab:	00 
    348003ac:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    348003b1:	48 89 b4 24 d0 00 00 	mov    %rsi,0xd0(%rsp)
    348003b8:	00 
    348003b9:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    348003be:	4c 8b 44 24 38       	mov    0x38(%rsp),%r8
    348003c3:	4c 8d 8c 24 c0 00 00 	lea    0xc0(%rsp),%r9
    348003ca:	00 
    348003cb:	4c 89 8c 24 80 01 00 	mov    %r9,0x180(%rsp)
    348003d2:	00 
    348003d3:	4c 8d 8c 24 90 01 00 	lea    0x190(%rsp),%r9
    348003da:	00 
    348003db:	4c 89 8c 24 78 01 00 	mov    %r9,0x178(%rsp)
    348003e2:	00 
    348003e3:	c7 84 24 74 01 00 00 	movl   $0x30,0x174(%rsp)
    348003ea:	30 00 00 00 
    348003ee:	c7 84 24 70 01 00 00 	movl   $0x10,0x170(%rsp)
    348003f5:	10 00 00 00 
    348003f9:	48 8d 94 24 70 01 00 	lea    0x170(%rsp),%rdx
    34800400:	00 
    34800401:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
    34800406:	4c 89 c7             	mov    %r8,%rdi
    34800409:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    3480040e:	e8 bd 05 00 00       	callq  348009d0 <vsprintf>
    34800413:	48 81 c4 88 01 00 00 	add    $0x188,%rsp
    3480041a:	c3                   	retq   
    3480041b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000034800420 <_start>:
    34800420:	e9 db fc ff ff       	jmpq   34800100 <enclave_main>
    34800425:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    3480042c:	00 00 00 
    3480042f:	90                   	nop

0000000034800430 <strlen>:
    34800430:	40 f6 c7 07          	test   $0x7,%dil
    34800434:	48 89 f8             	mov    %rdi,%rax
    34800437:	0f 84 17 00 00 00    	je     34800454 <.LBB0_4>
    3480043d:	48 89 f8             	mov    %rdi,%rax

0000000034800440 <.LBB0_2>:
    34800440:	80 38 00             	cmpb   $0x0,(%rax)
    34800443:	0f 84 65 00 00 00    	je     348004ae <.LBB0_8>
    34800449:	48 ff c0             	inc    %rax
    3480044c:	a8 07                	test   $0x7,%al
    3480044e:	0f 85 ec ff ff ff    	jne    34800440 <.LBB0_2>

0000000034800454 <.LBB0_4>:
    34800454:	48 83 c0 f8          	add    $0xfffffffffffffff8,%rax
    34800458:	49 b8 80 80 80 80 80 	movabs $0x8080808080808080,%r8
    3480045f:	80 80 80 
    34800462:	49 b9 ff fe fe fe fe 	movabs $0xfefefefefefefeff,%r9
    34800469:	fe fe fe 
    3480046c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000034800470 <.LBB0_5>:
    34800470:	48 8b 48 08          	mov    0x8(%rax),%rcx
    34800474:	48 83 c0 08          	add    $0x8,%rax
    34800478:	48 89 ce             	mov    %rcx,%rsi
    3480047b:	48 f7 d6             	not    %rsi
    3480047e:	4a 8d 14 09          	lea    (%rcx,%r9,1),%rdx
    34800482:	4c 21 c6             	and    %r8,%rsi
    34800485:	48 85 d6             	test   %rdx,%rsi
    34800488:	0f 84 e2 ff ff ff    	je     34800470 <.LBB0_5>
    3480048e:	84 c9                	test   %cl,%cl
    34800490:	0f 84 18 00 00 00    	je     348004ae <.LBB0_8>
    34800496:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    3480049d:	00 00 00 

00000000348004a0 <.LBB0_7>:
    348004a0:	80 78 01 00          	cmpb   $0x0,0x1(%rax)
    348004a4:	48 8d 40 01          	lea    0x1(%rax),%rax
    348004a8:	0f 85 f2 ff ff ff    	jne    348004a0 <.LBB0_7>

00000000348004ae <.LBB0_8>:
    348004ae:	48 29 f8             	sub    %rdi,%rax
    348004b1:	c3                   	retq   
    348004b2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    348004b9:	00 00 00 
    348004bc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000348004c0 <do_sgx_ocall>:
    348004c0:	55                   	push   %rbp
    348004c1:	48 89 e5             	mov    %rsp,%rbp
    348004c4:	48 89 24 25 89 05 04 	mov    %rsp,0x40589
    348004cb:	00 
    348004cc:	48 8b 24 25 89 05 04 	mov    0x40589,%rsp
    348004d3:	00 
    348004d4:	4e 8b 34 f5 89 05 04 	mov    0x40589(,%r14,8),%r14
    348004db:	00 
    348004dc:	41 ff d6             	callq  *%r14
    348004df:	48 8b 24 25 89 05 04 	mov    0x40589,%rsp
    348004e6:	00 
    348004e7:	c3                   	retq   
    348004e8:	5d                   	pop    %rbp
    348004e9:	c3                   	retq   
    348004ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000348004f0 <clock>:
    348004f0:	55                   	push   %rbp
    348004f1:	48 89 e5             	mov    %rsp,%rbp
    348004f4:	49 c7 c6 00 00 00 00 	mov    $0x0,%r14
    348004fb:	e8 c0 ff ff ff       	callq  348004c0 <do_sgx_ocall>
    34800500:	5d                   	pop    %rbp
    34800501:	c3                   	retq   
    34800502:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800509:	1f 84 00 00 00 00 00 

0000000034800510 <time>:
    34800510:	55                   	push   %rbp
    34800511:	48 89 e5             	mov    %rsp,%rbp
    34800514:	49 c7 c6 01 00 00 00 	mov    $0x1,%r14
    3480051b:	e8 a0 ff ff ff       	callq  348004c0 <do_sgx_ocall>
    34800520:	5d                   	pop    %rbp
    34800521:	c3                   	retq   
    34800522:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800529:	1f 84 00 00 00 00 00 

0000000034800530 <localtime>:
    34800530:	55                   	push   %rbp
    34800531:	48 89 e5             	mov    %rsp,%rbp
    34800534:	49 c7 c6 02 00 00 00 	mov    $0x2,%r14
    3480053b:	e8 80 ff ff ff       	callq  348004c0 <do_sgx_ocall>
    34800540:	5d                   	pop    %rbp
    34800541:	c3                   	retq   
    34800542:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800549:	1f 84 00 00 00 00 00 

0000000034800550 <gmtime>:
    34800550:	55                   	push   %rbp
    34800551:	48 89 e5             	mov    %rsp,%rbp
    34800554:	49 c7 c6 03 00 00 00 	mov    $0x3,%r14
    3480055b:	e8 60 ff ff ff       	callq  348004c0 <do_sgx_ocall>
    34800560:	5d                   	pop    %rbp
    34800561:	c3                   	retq   
    34800562:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800569:	1f 84 00 00 00 00 00 

0000000034800570 <mktime>:
    34800570:	55                   	push   %rbp
    34800571:	48 89 e5             	mov    %rsp,%rbp
    34800574:	49 c7 c6 04 00 00 00 	mov    $0x4,%r14
    3480057b:	e8 40 ff ff ff       	callq  348004c0 <do_sgx_ocall>
    34800580:	5d                   	pop    %rbp
    34800581:	c3                   	retq   
    34800582:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800589:	1f 84 00 00 00 00 00 

0000000034800590 <gettimeofday>:
    34800590:	55                   	push   %rbp
    34800591:	48 89 e5             	mov    %rsp,%rbp
    34800594:	49 c7 c6 05 00 00 00 	mov    $0x5,%r14
    3480059b:	e8 20 ff ff ff       	callq  348004c0 <do_sgx_ocall>
    348005a0:	5d                   	pop    %rbp
    348005a1:	c3                   	retq   
    348005a2:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    348005a9:	1f 84 00 00 00 00 00 

00000000348005b0 <puts>:
    348005b0:	55                   	push   %rbp
    348005b1:	48 89 e5             	mov    %rsp,%rbp
    348005b4:	49 c7 c6 06 00 00 00 	mov    $0x6,%r14
    348005bb:	e8 00 ff ff ff       	callq  348004c0 <do_sgx_ocall>
    348005c0:	5d                   	pop    %rbp
    348005c1:	c3                   	retq   
    348005c2:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    348005c9:	1f 84 00 00 00 00 00 

00000000348005d0 <open>:
    348005d0:	55                   	push   %rbp
    348005d1:	48 89 e5             	mov    %rsp,%rbp
    348005d4:	49 c7 c6 07 00 00 00 	mov    $0x7,%r14
    348005db:	e8 e0 fe ff ff       	callq  348004c0 <do_sgx_ocall>
    348005e0:	5d                   	pop    %rbp
    348005e1:	c3                   	retq   
    348005e2:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    348005e9:	1f 84 00 00 00 00 00 

00000000348005f0 <close>:
    348005f0:	55                   	push   %rbp
    348005f1:	48 89 e5             	mov    %rsp,%rbp
    348005f4:	49 c7 c6 08 00 00 00 	mov    $0x8,%r14
    348005fb:	e8 c0 fe ff ff       	callq  348004c0 <do_sgx_ocall>
    34800600:	5d                   	pop    %rbp
    34800601:	c3                   	retq   
    34800602:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800609:	1f 84 00 00 00 00 00 

0000000034800610 <read>:
    34800610:	55                   	push   %rbp
    34800611:	48 89 e5             	mov    %rsp,%rbp
    34800614:	49 c7 c6 09 00 00 00 	mov    $0x9,%r14
    3480061b:	e8 a0 fe ff ff       	callq  348004c0 <do_sgx_ocall>
    34800620:	5d                   	pop    %rbp
    34800621:	c3                   	retq   
    34800622:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800629:	1f 84 00 00 00 00 00 

0000000034800630 <write>:
    34800630:	55                   	push   %rbp
    34800631:	48 89 e5             	mov    %rsp,%rbp
    34800634:	49 c7 c6 0a 00 00 00 	mov    $0xa,%r14
    3480063b:	e8 80 fe ff ff       	callq  348004c0 <do_sgx_ocall>
    34800640:	5d                   	pop    %rbp
    34800641:	c3                   	retq   
    34800642:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800649:	1f 84 00 00 00 00 00 

0000000034800650 <lseek>:
    34800650:	55                   	push   %rbp
    34800651:	48 89 e5             	mov    %rsp,%rbp
    34800654:	49 c7 c6 0b 00 00 00 	mov    $0xb,%r14
    3480065b:	e8 60 fe ff ff       	callq  348004c0 <do_sgx_ocall>
    34800660:	5d                   	pop    %rbp
    34800661:	c3                   	retq   
    34800662:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800669:	1f 84 00 00 00 00 00 

0000000034800670 <socket>:
    34800670:	55                   	push   %rbp
    34800671:	48 89 e5             	mov    %rsp,%rbp
    34800674:	49 c7 c6 0c 00 00 00 	mov    $0xc,%r14
    3480067b:	e8 40 fe ff ff       	callq  348004c0 <do_sgx_ocall>
    34800680:	5d                   	pop    %rbp
    34800681:	c3                   	retq   
    34800682:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800689:	1f 84 00 00 00 00 00 

0000000034800690 <bind>:
    34800690:	55                   	push   %rbp
    34800691:	48 89 e5             	mov    %rsp,%rbp
    34800694:	49 c7 c6 0d 00 00 00 	mov    $0xd,%r14
    3480069b:	e8 20 fe ff ff       	callq  348004c0 <do_sgx_ocall>
    348006a0:	5d                   	pop    %rbp
    348006a1:	c3                   	retq   
    348006a2:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    348006a9:	1f 84 00 00 00 00 00 

00000000348006b0 <connect>:
    348006b0:	55                   	push   %rbp
    348006b1:	48 89 e5             	mov    %rsp,%rbp
    348006b4:	49 c7 c6 0e 00 00 00 	mov    $0xe,%r14
    348006bb:	e8 00 fe ff ff       	callq  348004c0 <do_sgx_ocall>
    348006c0:	5d                   	pop    %rbp
    348006c1:	c3                   	retq   
    348006c2:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    348006c9:	1f 84 00 00 00 00 00 

00000000348006d0 <listen>:
    348006d0:	55                   	push   %rbp
    348006d1:	48 89 e5             	mov    %rsp,%rbp
    348006d4:	49 c7 c6 0f 00 00 00 	mov    $0xf,%r14
    348006db:	e8 e0 fd ff ff       	callq  348004c0 <do_sgx_ocall>
    348006e0:	5d                   	pop    %rbp
    348006e1:	c3                   	retq   
    348006e2:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    348006e9:	1f 84 00 00 00 00 00 

00000000348006f0 <accept>:
    348006f0:	55                   	push   %rbp
    348006f1:	48 89 e5             	mov    %rsp,%rbp
    348006f4:	49 c7 c6 10 00 00 00 	mov    $0x10,%r14
    348006fb:	e8 c0 fd ff ff       	callq  348004c0 <do_sgx_ocall>
    34800700:	5d                   	pop    %rbp
    34800701:	c3                   	retq   
    34800702:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800709:	1f 84 00 00 00 00 00 

0000000034800710 <fstat>:
    34800710:	55                   	push   %rbp
    34800711:	48 89 e5             	mov    %rsp,%rbp
    34800714:	49 c7 c6 11 00 00 00 	mov    $0x11,%r14
    3480071b:	e8 a0 fd ff ff       	callq  348004c0 <do_sgx_ocall>
    34800720:	5d                   	pop    %rbp
    34800721:	c3                   	retq   
    34800722:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800729:	1f 84 00 00 00 00 00 

0000000034800730 <send>:
    34800730:	55                   	push   %rbp
    34800731:	48 89 e5             	mov    %rsp,%rbp
    34800734:	49 c7 c6 12 00 00 00 	mov    $0x12,%r14
    3480073b:	e8 80 fd ff ff       	callq  348004c0 <do_sgx_ocall>
    34800740:	5d                   	pop    %rbp
    34800741:	c3                   	retq   
    34800742:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800749:	1f 84 00 00 00 00 00 

0000000034800750 <recv>:
    34800750:	55                   	push   %rbp
    34800751:	48 89 e5             	mov    %rsp,%rbp
    34800754:	49 c7 c6 13 00 00 00 	mov    $0x13,%r14
    3480075b:	e8 60 fd ff ff       	callq  348004c0 <do_sgx_ocall>
    34800760:	5d                   	pop    %rbp
    34800761:	c3                   	retq   
    34800762:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800769:	1f 84 00 00 00 00 00 

0000000034800770 <sendto>:
    34800770:	55                   	push   %rbp
    34800771:	48 89 e5             	mov    %rsp,%rbp
    34800774:	49 c7 c6 14 00 00 00 	mov    $0x14,%r14
    3480077b:	e8 40 fd ff ff       	callq  348004c0 <do_sgx_ocall>
    34800780:	5d                   	pop    %rbp
    34800781:	c3                   	retq   
    34800782:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800789:	1f 84 00 00 00 00 00 

0000000034800790 <recvfrom>:
    34800790:	55                   	push   %rbp
    34800791:	48 89 e5             	mov    %rsp,%rbp
    34800794:	49 c7 c6 15 00 00 00 	mov    $0x15,%r14
    3480079b:	e8 20 fd ff ff       	callq  348004c0 <do_sgx_ocall>
    348007a0:	5d                   	pop    %rbp
    348007a1:	c3                   	retq   
    348007a2:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    348007a9:	1f 84 00 00 00 00 00 

00000000348007b0 <gethostname>:
    348007b0:	55                   	push   %rbp
    348007b1:	48 89 e5             	mov    %rsp,%rbp
    348007b4:	49 c7 c6 16 00 00 00 	mov    $0x16,%r14
    348007bb:	e8 00 fd ff ff       	callq  348004c0 <do_sgx_ocall>
    348007c0:	5d                   	pop    %rbp
    348007c1:	c3                   	retq   
    348007c2:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    348007c9:	1f 84 00 00 00 00 00 

00000000348007d0 <getaddrinfo>:
    348007d0:	55                   	push   %rbp
    348007d1:	48 89 e5             	mov    %rsp,%rbp
    348007d4:	49 c7 c6 17 00 00 00 	mov    $0x17,%r14
    348007db:	e8 e0 fc ff ff       	callq  348004c0 <do_sgx_ocall>
    348007e0:	5d                   	pop    %rbp
    348007e1:	c3                   	retq   
    348007e2:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    348007e9:	1f 84 00 00 00 00 00 

00000000348007f0 <getenv>:
    348007f0:	55                   	push   %rbp
    348007f1:	48 89 e5             	mov    %rsp,%rbp
    348007f4:	49 c7 c6 18 00 00 00 	mov    $0x18,%r14
    348007fb:	e8 c0 fc ff ff       	callq  348004c0 <do_sgx_ocall>
    34800800:	5d                   	pop    %rbp
    34800801:	c3                   	retq   
    34800802:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800809:	1f 84 00 00 00 00 00 

0000000034800810 <getsockname>:
    34800810:	55                   	push   %rbp
    34800811:	48 89 e5             	mov    %rsp,%rbp
    34800814:	49 c7 c6 19 00 00 00 	mov    $0x19,%r14
    3480081b:	e8 a0 fc ff ff       	callq  348004c0 <do_sgx_ocall>
    34800820:	5d                   	pop    %rbp
    34800821:	c3                   	retq   
    34800822:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800829:	1f 84 00 00 00 00 00 

0000000034800830 <getsockopt>:
    34800830:	55                   	push   %rbp
    34800831:	48 89 e5             	mov    %rsp,%rbp
    34800834:	49 c7 c6 1a 00 00 00 	mov    $0x1a,%r14
    3480083b:	e8 80 fc ff ff       	callq  348004c0 <do_sgx_ocall>
    34800840:	5d                   	pop    %rbp
    34800841:	c3                   	retq   
    34800842:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800849:	1f 84 00 00 00 00 00 

0000000034800850 <getservbyname>:
    34800850:	55                   	push   %rbp
    34800851:	48 89 e5             	mov    %rsp,%rbp
    34800854:	49 c7 c6 1b 00 00 00 	mov    $0x1b,%r14
    3480085b:	e8 60 fc ff ff       	callq  348004c0 <do_sgx_ocall>
    34800860:	5d                   	pop    %rbp
    34800861:	c3                   	retq   
    34800862:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800869:	1f 84 00 00 00 00 00 

0000000034800870 <getprotobynumber>:
    34800870:	55                   	push   %rbp
    34800871:	48 89 e5             	mov    %rsp,%rbp
    34800874:	49 c7 c6 1c 00 00 00 	mov    $0x1c,%r14
    3480087b:	e8 40 fc ff ff       	callq  348004c0 <do_sgx_ocall>
    34800880:	5d                   	pop    %rbp
    34800881:	c3                   	retq   
    34800882:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800889:	1f 84 00 00 00 00 00 

0000000034800890 <setsockopt>:
    34800890:	55                   	push   %rbp
    34800891:	48 89 e5             	mov    %rsp,%rbp
    34800894:	49 c7 c6 1d 00 00 00 	mov    $0x1d,%r14
    3480089b:	e8 20 fc ff ff       	callq  348004c0 <do_sgx_ocall>
    348008a0:	5d                   	pop    %rbp
    348008a1:	c3                   	retq   
    348008a2:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    348008a9:	1f 84 00 00 00 00 00 

00000000348008b0 <htons>:
    348008b0:	55                   	push   %rbp
    348008b1:	48 89 e5             	mov    %rsp,%rbp
    348008b4:	49 c7 c6 1e 00 00 00 	mov    $0x1e,%r14
    348008bb:	e8 00 fc ff ff       	callq  348004c0 <do_sgx_ocall>
    348008c0:	5d                   	pop    %rbp
    348008c1:	c3                   	retq   
    348008c2:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    348008c9:	1f 84 00 00 00 00 00 

00000000348008d0 <htonl>:
    348008d0:	55                   	push   %rbp
    348008d1:	48 89 e5             	mov    %rsp,%rbp
    348008d4:	49 c7 c6 1f 00 00 00 	mov    $0x1f,%r14
    348008db:	e8 e0 fb ff ff       	callq  348004c0 <do_sgx_ocall>
    348008e0:	5d                   	pop    %rbp
    348008e1:	c3                   	retq   
    348008e2:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    348008e9:	1f 84 00 00 00 00 00 

00000000348008f0 <ntohs>:
    348008f0:	55                   	push   %rbp
    348008f1:	48 89 e5             	mov    %rsp,%rbp
    348008f4:	49 c7 c6 20 00 00 00 	mov    $0x20,%r14
    348008fb:	e8 c0 fb ff ff       	callq  348004c0 <do_sgx_ocall>
    34800900:	5d                   	pop    %rbp
    34800901:	c3                   	retq   
    34800902:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800909:	1f 84 00 00 00 00 00 

0000000034800910 <ntohl>:
    34800910:	55                   	push   %rbp
    34800911:	48 89 e5             	mov    %rsp,%rbp
    34800914:	49 c7 c6 21 00 00 00 	mov    $0x21,%r14
    3480091b:	e8 a0 fb ff ff       	callq  348004c0 <do_sgx_ocall>
    34800920:	5d                   	pop    %rbp
    34800921:	c3                   	retq   
    34800922:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800929:	1f 84 00 00 00 00 00 

0000000034800930 <signal>:
    34800930:	55                   	push   %rbp
    34800931:	48 89 e5             	mov    %rsp,%rbp
    34800934:	49 c7 c6 22 00 00 00 	mov    $0x22,%r14
    3480093b:	e8 80 fb ff ff       	callq  348004c0 <do_sgx_ocall>
    34800940:	5d                   	pop    %rbp
    34800941:	c3                   	retq   
    34800942:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800949:	1f 84 00 00 00 00 00 

0000000034800950 <shutdown>:
    34800950:	55                   	push   %rbp
    34800951:	48 89 e5             	mov    %rsp,%rbp
    34800954:	49 c7 c6 23 00 00 00 	mov    $0x23,%r14
    3480095b:	e8 60 fb ff ff       	callq  348004c0 <do_sgx_ocall>
    34800960:	5d                   	pop    %rbp
    34800961:	c3                   	retq   
    34800962:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800969:	1f 84 00 00 00 00 00 

0000000034800970 <exit>:
    34800970:	55                   	push   %rbp
    34800971:	48 89 e5             	mov    %rsp,%rbp
    34800974:	48 83 ec 10          	sub    $0x10,%rsp
    34800978:	49 c7 c6 24 00 00 00 	mov    $0x24,%r14
    3480097f:	89 7d fc             	mov    %edi,-0x4(%rbp)
    34800982:	e8 39 fb ff ff       	callq  348004c0 <do_sgx_ocall>
    34800987:	48 83 c4 10          	add    $0x10,%rsp
    3480098b:	5d                   	pop    %rbp
    3480098c:	c3                   	retq   
    3480098d:	0f 1f 00             	nopl   (%rax)

0000000034800990 <sgx_measure_start>:
    34800990:	55                   	push   %rbp
    34800991:	48 89 e5             	mov    %rsp,%rbp
    34800994:	49 c7 c6 2b 00 00 00 	mov    $0x2b,%r14
    3480099b:	e8 20 fb ff ff       	callq  348004c0 <do_sgx_ocall>
    348009a0:	5d                   	pop    %rbp
    348009a1:	c3                   	retq   
    348009a2:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    348009a9:	1f 84 00 00 00 00 00 

00000000348009b0 <sgx_measure_wait>:
    348009b0:	55                   	push   %rbp
    348009b1:	48 89 e5             	mov    %rsp,%rbp
    348009b4:	49 c7 c6 2c 00 00 00 	mov    $0x2c,%r14
    348009bb:	e8 00 fb ff ff       	callq  348004c0 <do_sgx_ocall>
    348009c0:	5d                   	pop    %rbp
    348009c1:	c3                   	retq   
    348009c2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    348009c9:	00 00 00 
    348009cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000348009d0 <vsprintf>:
    348009d0:	48 83 ec 18          	sub    $0x18,%rsp
    348009d4:	b8 ff ff ff 7f       	mov    $0x7fffffff,%eax
    348009d9:	89 c1                	mov    %eax,%ecx
    348009db:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
    348009e0:	48 89 ce             	mov    %rcx,%rsi
    348009e3:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    348009e8:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    348009ed:	48 89 ca             	mov    %rcx,%rdx
    348009f0:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    348009f5:	e8 06 00 00 00       	callq  34800a00 <vsnprintf>
    348009fa:	48 83 c4 18          	add    $0x18,%rsp
    348009fe:	c3                   	retq   
    348009ff:	90                   	nop

0000000034800a00 <vsnprintf>:
    34800a00:	48 81 ec 38 01 00 00 	sub    $0x138,%rsp
    34800a07:	48 b8 70 64 80 34 00 	movabs $0x34806470,%rax
    34800a0e:	00 00 00 
    34800a11:	41 b8 d0 00 00 00    	mov    $0xd0,%r8d
    34800a17:	45 89 c1             	mov    %r8d,%r9d
    34800a1a:	4c 8d 54 24 60       	lea    0x60(%rsp),%r10
    34800a1f:	48 89 7c 24 58       	mov    %rdi,0x58(%rsp)
    34800a24:	4c 89 d7             	mov    %r10,%rdi
    34800a27:	48 89 74 24 50       	mov    %rsi,0x50(%rsp)
    34800a2c:	48 89 c6             	mov    %rax,%rsi
    34800a2f:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
    34800a34:	4c 89 ca             	mov    %r9,%rdx
    34800a37:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
    34800a3c:	e8 ff 01 00 00       	callq  34800c40 <memcpy>
    34800a41:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
    34800a46:	48 83 c0 ff          	add    $0xffffffffffffffff,%rax
    34800a4a:	48 3d fe ff ff 7f    	cmp    $0x7ffffffe,%rax
    34800a50:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
    34800a55:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
    34800a5a:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
    34800a5f:	48 89 4c 24 30       	mov    %rcx,0x30(%rsp)
    34800a64:	0f 86 41 00 00 00    	jbe    34800aab <.LBB0_3>
    34800a6a:	b8 01 00 00 00       	mov    $0x1,%eax
    34800a6f:	89 c1                	mov    %eax,%ecx
    34800a71:	48 8d 94 24 37 01 00 	lea    0x137(%rsp),%rdx
    34800a78:	00 
    34800a79:	48 8b 74 24 50       	mov    0x50(%rsp),%rsi
    34800a7e:	48 83 fe 00          	cmp    $0x0,%rsi
    34800a82:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
    34800a87:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
    34800a8c:	0f 84 19 00 00 00    	je     34800aab <.LBB0_3>
    34800a92:	e8 59 01 00 00       	callq  34800bf0 <__errno_location>
    34800a97:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    34800a9c:	c7 00 4b 00 00 00    	movl   $0x4b,(%rax)
    34800aa2:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
    34800aa6:	e9 cd 00 00 00       	jmpq   34800b78 <.LBB0_5>

0000000034800aab <.LBB0_3>:
    34800aab:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
    34800ab0:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
    34800ab5:	48 8d 54 24 60       	lea    0x60(%rsp),%rdx
    34800aba:	48 c7 c6 fe ff ff ff 	mov    $0xfffffffffffffffe,%rsi
    34800ac1:	48 29 c6             	sub    %rax,%rsi
    34800ac4:	48 39 f1             	cmp    %rsi,%rcx
    34800ac7:	48 0f 47 ce          	cmova  %rsi,%rcx
    34800acb:	48 89 8c 24 c0 00 00 	mov    %rcx,0xc0(%rsp)
    34800ad2:	00 
    34800ad3:	48 89 d6             	mov    %rdx,%rsi
    34800ad6:	48 83 c6 28          	add    $0x28,%rsi
    34800ada:	48 89 84 24 88 00 00 	mov    %rax,0x88(%rsp)
    34800ae1:	00 
    34800ae2:	48 89 84 24 b8 00 00 	mov    %rax,0xb8(%rsp)
    34800ae9:	00 
    34800aea:	48 01 c8             	add    %rcx,%rax
    34800aed:	48 89 d7             	mov    %rdx,%rdi
    34800af0:	48 83 c7 20          	add    $0x20,%rdi
    34800af4:	48 89 84 24 80 00 00 	mov    %rax,0x80(%rsp)
    34800afb:	00 
    34800afc:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
    34800b03:	00 
    34800b04:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
    34800b09:	48 89 d7             	mov    %rdx,%rdi
    34800b0c:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
    34800b11:	48 89 74 24 18       	mov    %rsi,0x18(%rsp)
    34800b16:	48 89 c6             	mov    %rax,%rsi
    34800b19:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
    34800b1e:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    34800b23:	e8 58 01 00 00       	callq  34800c80 <vfprintf>
    34800b28:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    34800b2d:	48 83 f9 00          	cmp    $0x0,%rcx
    34800b31:	41 89 c0             	mov    %eax,%r8d
    34800b34:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    34800b38:	44 89 44 24 2c       	mov    %r8d,0x2c(%rsp)
    34800b3d:	0f 84 35 00 00 00    	je     34800b78 <.LBB0_5>
    34800b43:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    34800b48:	48 8b 08             	mov    (%rax),%rcx
    34800b4b:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    34800b50:	48 8b 32             	mov    (%rdx),%rsi
    34800b53:	31 ff                	xor    %edi,%edi
    34800b55:	49 89 c8             	mov    %rcx,%r8
    34800b58:	49 29 f0             	sub    %rsi,%r8
    34800b5b:	89 fe                	mov    %edi,%esi
    34800b5d:	49 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%r9
    34800b64:	49 0f 44 f1          	cmove  %r9,%rsi
    34800b68:	c6 04 31 00          	movb   $0x0,(%rcx,%rsi,1)
    34800b6c:	8b 7c 24 0c          	mov    0xc(%rsp),%edi
    34800b70:	4c 89 04 24          	mov    %r8,(%rsp)
    34800b74:	89 7c 24 2c          	mov    %edi,0x2c(%rsp)

0000000034800b78 <.LBB0_5>:
    34800b78:	8b 44 24 2c          	mov    0x2c(%rsp),%eax
    34800b7c:	48 81 c4 38 01 00 00 	add    $0x138,%rsp
    34800b83:	c3                   	retq   
    34800b84:	66 66 66 2e 0f 1f 84 	data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800b8b:	00 00 00 00 00 

0000000034800b90 <sn_write>:
    34800b90:	48 83 ec 28          	sub    $0x28,%rsp
    34800b94:	48 8b 47 20          	mov    0x20(%rdi),%rax
    34800b98:	48 8b 4f 28          	mov    0x28(%rdi),%rcx
    34800b9c:	48 29 c8             	sub    %rcx,%rax
    34800b9f:	48 39 d0             	cmp    %rdx,%rax
    34800ba2:	48 0f 47 c2          	cmova  %rdx,%rax
    34800ba6:	48 89 7c 24 20       	mov    %rdi,0x20(%rsp)
    34800bab:	48 89 cf             	mov    %rcx,%rdi
    34800bae:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
    34800bb3:	48 89 c2             	mov    %rax,%rdx
    34800bb6:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    34800bbb:	e8 80 00 00 00       	callq  34800c40 <memcpy>
    34800bc0:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    34800bc5:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    34800bca:	48 03 4a 28          	add    0x28(%rdx),%rcx
    34800bce:	48 89 4a 28          	mov    %rcx,0x28(%rdx)
    34800bd2:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    34800bd7:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    34800bdc:	48 89 c8             	mov    %rcx,%rax
    34800bdf:	48 83 c4 28          	add    $0x28,%rsp
    34800be3:	c3                   	retq   
    34800be4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    34800beb:	00 00 00 
    34800bee:	66 90                	xchg   %ax,%ax

0000000034800bf0 <__errno_location>:
    34800bf0:	50                   	push   %rax
    34800bf1:	48 b8 30 70 a0 34 00 	movabs $0x34a07030,%rax
    34800bf8:	00 00 00 
    34800bfb:	48 83 3c 25 98 70 a0 	cmpq   $0x0,0x34a07098
    34800c02:	34 00 
    34800c04:	48 89 04 24          	mov    %rax,(%rsp)
    34800c08:	0f 84 0d 00 00 00    	je     34800c1b <.LBB0_2>
    34800c0e:	e8 1d 00 00 00       	callq  34800c30 <__pthread_self>
    34800c13:	48 8b 40 40          	mov    0x40(%rax),%rax
    34800c17:	48 89 04 24          	mov    %rax,(%rsp)

0000000034800c1b <.LBB0_2>:
    34800c1b:	48 8b 04 24          	mov    (%rsp),%rax
    34800c1f:	59                   	pop    %rcx
    34800c20:	c3                   	retq   
    34800c21:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34800c28:	0f 1f 84 00 00 00 00 
    34800c2f:	00 

0000000034800c30 <__pthread_self>:
    34800c30:	64 48 8b 04 25 00 00 	mov    %fs:0x0,%rax
    34800c37:	00 00 
    34800c39:	c3                   	retq   
    34800c3a:	66 90                	xchg   %ax,%ax
    34800c3c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000034800c40 <memcpy>:
    34800c40:	48 85 d2             	test   %rdx,%rdx
    34800c43:	74 31                	je     34800c76 <memcpy+0x36>
    34800c45:	48 89 f8             	mov    %rdi,%rax
    34800c48:	48 83 fa 08          	cmp    $0x8,%rdx
    34800c4c:	72 14                	jb     34800c62 <memcpy+0x22>
    34800c4e:	f7 c7 07 00 00 00    	test   $0x7,%edi
    34800c54:	74 0c                	je     34800c62 <memcpy+0x22>
    34800c56:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
    34800c57:	48 ff ca             	dec    %rdx
    34800c5a:	f7 c7 07 00 00 00    	test   $0x7,%edi
    34800c60:	75 f4                	jne    34800c56 <memcpy+0x16>
    34800c62:	48 89 d1             	mov    %rdx,%rcx
    34800c65:	48 c1 e9 03          	shr    $0x3,%rcx
    34800c69:	f3 48 a5             	rep movsq %ds:(%rsi),%es:(%rdi)
    34800c6c:	83 e2 07             	and    $0x7,%edx
    34800c6f:	74 05                	je     34800c76 <memcpy+0x36>
    34800c71:	a4                   	movsb  %ds:(%rsi),%es:(%rdi)
    34800c72:	ff ca                	dec    %edx
    34800c74:	75 fb                	jne    34800c71 <memcpy+0x31>
    34800c76:	c3                   	retq   
    34800c77:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    34800c7e:	00 00 

0000000034800c80 <vfprintf>:
    34800c80:	41 54                	push   %r12
    34800c82:	53                   	push   %rbx
    34800c83:	48 81 ec b8 01 00 00 	sub    $0x1b8,%rsp
    34800c8a:	31 c0                	xor    %eax,%eax
    34800c8c:	89 c1                	mov    %eax,%ecx
    34800c8e:	4c 8d 84 24 a0 01 00 	lea    0x1a0(%rsp),%r8
    34800c95:	00 
    34800c96:	4c 8d 8c 24 70 01 00 	lea    0x170(%rsp),%r9
    34800c9d:	00 
    34800c9e:	4c 8d 94 24 d0 00 00 	lea    0xd0(%rsp),%r10
    34800ca5:	00 
    34800ca6:	31 c0                	xor    %eax,%eax
    34800ca8:	41 bb 28 00 00 00    	mov    $0x28,%r11d
    34800cae:	44 89 db             	mov    %r11d,%ebx
    34800cb1:	4d 89 cc             	mov    %r9,%r12
    34800cb4:	48 89 7c 24 78       	mov    %rdi,0x78(%rsp)
    34800cb9:	4c 89 e7             	mov    %r12,%rdi
    34800cbc:	48 89 74 24 70       	mov    %rsi,0x70(%rsp)
    34800cc1:	89 c6                	mov    %eax,%esi
    34800cc3:	48 89 54 24 68       	mov    %rdx,0x68(%rsp)
    34800cc8:	48 89 da             	mov    %rbx,%rdx
    34800ccb:	4c 89 54 24 60       	mov    %r10,0x60(%rsp)
    34800cd0:	4c 89 4c 24 58       	mov    %r9,0x58(%rsp)
    34800cd5:	4c 89 44 24 50       	mov    %r8,0x50(%rsp)
    34800cda:	48 89 4c 24 48       	mov    %rcx,0x48(%rsp)
    34800cdf:	e8 75 50 00 00       	callq  34805d59 <memset>
    34800ce4:	48 8b 4c 24 50       	mov    0x50(%rsp),%rcx
    34800ce9:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
    34800cee:	48 8b 7a 10          	mov    0x10(%rdx),%rdi
    34800cf2:	48 89 79 10          	mov    %rdi,0x10(%rcx)
    34800cf6:	0f 10 02             	movups (%rdx),%xmm0
    34800cf9:	0f 11 01             	movups %xmm0,(%rcx)
    34800cfc:	48 8b 7c 24 48       	mov    0x48(%rsp),%rdi
    34800d01:	48 8b 74 24 70       	mov    0x70(%rsp),%rsi
    34800d06:	48 8b 54 24 50       	mov    0x50(%rsp),%rdx
    34800d0b:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
    34800d10:	4c 8b 44 24 58       	mov    0x58(%rsp),%r8
    34800d15:	e8 d6 01 00 00       	callq  34800ef0 <printf_core>
    34800d1a:	83 f8 00             	cmp    $0x0,%eax
    34800d1d:	0f 8d 0e 00 00 00    	jge    34800d31 <.LBB0_2>
    34800d23:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    34800d28:	89 44 24 44          	mov    %eax,0x44(%rsp)
    34800d2c:	e9 ad 01 00 00       	jmpq   34800ede <.LBB0_13>

0000000034800d31 <.LBB0_2>:
    34800d31:	31 c0                	xor    %eax,%eax
    34800d33:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
    34800d38:	83 b9 8c 00 00 00 ff 	cmpl   $0xffffffff,0x8c(%rcx)
    34800d3f:	89 44 24 40          	mov    %eax,0x40(%rsp)
    34800d43:	0f 8e 0e 00 00 00    	jle    34800d57 <.LBB0_4>
    34800d49:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
    34800d4e:	e8 9d 4b 00 00       	callq  348058f0 <__lockfile>
    34800d53:	89 44 24 40          	mov    %eax,0x40(%rsp)

0000000034800d57 <.LBB0_4>:
    34800d57:	8b 44 24 40          	mov    0x40(%rsp),%eax
    34800d5b:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
    34800d60:	8b 11                	mov    (%rcx),%edx
    34800d62:	89 d6                	mov    %edx,%esi
    34800d64:	83 e6 20             	and    $0x20,%esi
    34800d67:	80 b9 8a 00 00 00 01 	cmpb   $0x1,0x8a(%rcx)
    34800d6e:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    34800d72:	89 54 24 38          	mov    %edx,0x38(%rsp)
    34800d76:	89 74 24 34          	mov    %esi,0x34(%rsp)
    34800d7a:	0f 8d 0e 00 00 00    	jge    34800d8e <.LBB0_6>
    34800d80:	8b 44 24 38          	mov    0x38(%rsp),%eax
    34800d84:	83 e0 df             	and    $0xffffffdf,%eax
    34800d87:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
    34800d8c:	89 01                	mov    %eax,(%rcx)

0000000034800d8e <.LBB0_6>:
    34800d8e:	31 c0                	xor    %eax,%eax
    34800d90:	89 c1                	mov    %eax,%ecx
    34800d92:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
    34800d97:	48 83 c2 60          	add    $0x60,%rdx
    34800d9b:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
    34800da0:	48 83 7e 60 00       	cmpq   $0x0,0x60(%rsi)
    34800da5:	48 89 54 24 28       	mov    %rdx,0x28(%rsp)
    34800daa:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
    34800daf:	0f 85 36 00 00 00    	jne    34800deb <.LBB0_8>
    34800db5:	48 8d 84 24 80 00 00 	lea    0x80(%rsp),%rax
    34800dbc:	00 
    34800dbd:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
    34800dc2:	48 8b 51 58          	mov    0x58(%rcx),%rdx
    34800dc6:	48 89 41 58          	mov    %rax,0x58(%rcx)
    34800dca:	48 89 41 38          	mov    %rax,0x38(%rcx)
    34800dce:	48 89 41 28          	mov    %rax,0x28(%rcx)
    34800dd2:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
    34800dd7:	48 c7 06 50 00 00 00 	movq   $0x50,(%rsi)
    34800dde:	48 83 c0 50          	add    $0x50,%rax
    34800de2:	48 89 41 20          	mov    %rax,0x20(%rcx)
    34800de6:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)

0000000034800deb <.LBB0_8>:
    34800deb:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
    34800df0:	48 8d 94 24 a0 01 00 	lea    0x1a0(%rsp),%rdx
    34800df7:	00 
    34800df8:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
    34800dfd:	48 8b 74 24 70       	mov    0x70(%rsp),%rsi
    34800e02:	48 8b 4c 24 60       	mov    0x60(%rsp),%rcx
    34800e07:	4c 8b 44 24 58       	mov    0x58(%rsp),%r8
    34800e0c:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
    34800e11:	e8 da 00 00 00       	callq  34800ef0 <printf_core>
    34800e16:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
    34800e1b:	48 83 f9 00          	cmp    $0x0,%rcx
    34800e1f:	41 89 c1             	mov    %eax,%r9d
    34800e22:	89 44 24 14          	mov    %eax,0x14(%rsp)
    34800e26:	44 89 4c 24 10       	mov    %r9d,0x10(%rsp)
    34800e2b:	0f 84 67 00 00 00    	je     34800e98 <.LBB0_10>
    34800e31:	31 c0                	xor    %eax,%eax
    34800e33:	89 c1                	mov    %eax,%ecx
    34800e35:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
    34800e3a:	48 89 ce             	mov    %rcx,%rsi
    34800e3d:	48 89 ca             	mov    %rcx,%rdx
    34800e40:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
    34800e45:	ff 51 48             	callq  *0x48(%rcx)
    34800e48:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
    34800e4e:	48 8b 4c 24 78       	mov    0x78(%rsp),%rcx
    34800e53:	48 83 79 28 00       	cmpq   $0x0,0x28(%rcx)
    34800e58:	44 8b 4c 24 14       	mov    0x14(%rsp),%r9d
    34800e5d:	45 0f 45 c1          	cmovne %r9d,%r8d
    34800e61:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
    34800e66:	48 89 51 58          	mov    %rdx,0x58(%rcx)
    34800e6a:	48 8b 74 24 28       	mov    0x28(%rsp),%rsi
    34800e6f:	48 c7 06 00 00 00 00 	movq   $0x0,(%rsi)
    34800e76:	48 c7 41 20 00 00 00 	movq   $0x0,0x20(%rcx)
    34800e7d:	00 
    34800e7e:	48 c7 41 38 00 00 00 	movq   $0x0,0x38(%rcx)
    34800e85:	00 
    34800e86:	48 c7 41 28 00 00 00 	movq   $0x0,0x28(%rcx)
    34800e8d:	00 
    34800e8e:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    34800e93:	44 89 44 24 10       	mov    %r8d,0x10(%rsp)

0000000034800e98 <.LBB0_10>:
    34800e98:	8b 44 24 10          	mov    0x10(%rsp),%eax
    34800e9c:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    34800ea1:	48 8b 54 24 78       	mov    0x78(%rsp),%rdx
    34800ea6:	8b 32                	mov    (%rdx),%esi
    34800ea8:	89 f7                	mov    %esi,%edi
    34800eaa:	83 e7 20             	and    $0x20,%edi
    34800ead:	83 ff 00             	cmp    $0x0,%edi
    34800eb0:	0f 45 c1             	cmovne %ecx,%eax
    34800eb3:	8b 4c 24 34          	mov    0x34(%rsp),%ecx
    34800eb7:	09 ce                	or     %ecx,%esi
    34800eb9:	89 32                	mov    %esi,(%rdx)
    34800ebb:	8b 74 24 3c          	mov    0x3c(%rsp),%esi
    34800ebf:	83 fe 00             	cmp    $0x0,%esi
    34800ec2:	89 44 24 04          	mov    %eax,0x4(%rsp)
    34800ec6:	0f 84 0a 00 00 00    	je     34800ed6 <.LBB0_12>
    34800ecc:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
    34800ed1:	e8 2a 4a 00 00       	callq  34805900 <__unlockfile>

0000000034800ed6 <.LBB0_12>:
    34800ed6:	8b 44 24 04          	mov    0x4(%rsp),%eax
    34800eda:	89 44 24 44          	mov    %eax,0x44(%rsp)

0000000034800ede <.LBB0_13>:
    34800ede:	8b 44 24 44          	mov    0x44(%rsp),%eax
    34800ee2:	48 81 c4 b8 01 00 00 	add    $0x1b8,%rsp
    34800ee9:	5b                   	pop    %rbx
    34800eea:	41 5c                	pop    %r12
    34800eec:	c3                   	retq   
    34800eed:	0f 1f 00             	nopl   (%rax)

0000000034800ef0 <printf_core>:
    34800ef0:	41 54                	push   %r12
    34800ef2:	53                   	push   %rbx
    34800ef3:	48 81 ec a8 04 00 00 	sub    $0x4a8,%rsp
    34800efa:	31 c0                	xor    %eax,%eax
    34800efc:	4c 8d 8c 24 90 04 00 	lea    0x490(%rsp),%r9
    34800f03:	00 
    34800f04:	4c 8d 94 24 54 04 00 	lea    0x454(%rsp),%r10
    34800f0b:	00 
    34800f0c:	4c 8d 9c 24 58 04 00 	lea    0x458(%rsp),%r11
    34800f13:	00 
    34800f14:	48 8d 9c 24 60 04 00 	lea    0x460(%rsp),%rbx
    34800f1b:	00 
    34800f1c:	48 89 b4 24 a0 04 00 	mov    %rsi,0x4a0(%rsp)
    34800f23:	00 
    34800f24:	48 83 ff 00          	cmp    $0x0,%rdi
    34800f28:	41 0f 95 c4          	setne  %r12b
    34800f2c:	48 89 d6             	mov    %rdx,%rsi
    34800f2f:	48 83 c6 10          	add    $0x10,%rsi
    34800f33:	48 89 8c 24 48 04 00 	mov    %rcx,0x448(%rsp)
    34800f3a:	00 
    34800f3b:	48 89 d1             	mov    %rdx,%rcx
    34800f3e:	48 83 c1 08          	add    $0x8,%rcx
    34800f42:	48 89 8c 24 40 04 00 	mov    %rcx,0x440(%rsp)
    34800f49:	00 
    34800f4a:	48 89 d1             	mov    %rdx,%rcx
    34800f4d:	48 83 c1 10          	add    $0x10,%rcx
    34800f51:	48 89 8c 24 38 04 00 	mov    %rcx,0x438(%rsp)
    34800f58:	00 
    34800f59:	48 89 d1             	mov    %rdx,%rcx
    34800f5c:	48 83 c1 08          	add    $0x8,%rcx
    34800f60:	48 89 8c 24 30 04 00 	mov    %rcx,0x430(%rsp)
    34800f67:	00 
    34800f68:	48 89 d9             	mov    %rbx,%rcx
    34800f6b:	48 83 c1 2b          	add    $0x2b,%rcx
    34800f6f:	48 89 8c 24 28 04 00 	mov    %rcx,0x428(%rsp)
    34800f76:	00 
    34800f77:	4c 89 c9             	mov    %r9,%rcx
    34800f7a:	48 89 8c 24 20 04 00 	mov    %rcx,0x420(%rsp)
    34800f81:	00 
    34800f82:	4c 89 c9             	mov    %r9,%rcx
    34800f85:	48 89 8c 24 18 04 00 	mov    %rcx,0x418(%rsp)
    34800f8c:	00 
    34800f8d:	4c 89 c9             	mov    %r9,%rcx
    34800f90:	48 89 8c 24 10 04 00 	mov    %rcx,0x410(%rsp)
    34800f97:	00 
    34800f98:	4c 89 c9             	mov    %r9,%rcx
    34800f9b:	48 89 8c 24 08 04 00 	mov    %rcx,0x408(%rsp)
    34800fa2:	00 
    34800fa3:	4c 89 c9             	mov    %r9,%rcx
    34800fa6:	48 89 8c 24 00 04 00 	mov    %rcx,0x400(%rsp)
    34800fad:	00 
    34800fae:	4c 89 c9             	mov    %r9,%rcx
    34800fb1:	48 89 8c 24 f8 03 00 	mov    %rcx,0x3f8(%rsp)
    34800fb8:	00 
    34800fb9:	4c 89 c9             	mov    %r9,%rcx
    34800fbc:	48 83 c3 2a          	add    $0x2a,%rbx
    34800fc0:	48 89 8c 24 f0 03 00 	mov    %rcx,0x3f0(%rsp)
    34800fc7:	00 
    34800fc8:	4c 89 c9             	mov    %r9,%rcx
    34800fcb:	48 89 8c 24 e8 03 00 	mov    %rcx,0x3e8(%rsp)
    34800fd2:	00 
    34800fd3:	4c 89 c9             	mov    %r9,%rcx
    34800fd6:	48 89 8c 24 e0 03 00 	mov    %rcx,0x3e0(%rsp)
    34800fdd:	00 
    34800fde:	4c 89 d9             	mov    %r11,%rcx
    34800fe1:	48 83 c1 04          	add    $0x4,%rcx
    34800fe5:	48 89 8c 24 d8 03 00 	mov    %rcx,0x3d8(%rsp)
    34800fec:	00 
    34800fed:	4c 89 c9             	mov    %r9,%rcx
    34800ff0:	89 84 24 d4 03 00 00 	mov    %eax,0x3d4(%rsp)
    34800ff7:	89 84 24 d0 03 00 00 	mov    %eax,0x3d0(%rsp)
    34800ffe:	8b 84 24 d4 03 00 00 	mov    0x3d4(%rsp),%eax
    34801005:	89 84 24 cc 03 00 00 	mov    %eax,0x3cc(%rsp)
    3480100c:	8b 84 24 d4 03 00 00 	mov    0x3d4(%rsp),%eax
    34801013:	48 89 8c 24 c0 03 00 	mov    %rcx,0x3c0(%rsp)
    3480101a:	00 
    3480101b:	48 89 94 24 b8 03 00 	mov    %rdx,0x3b8(%rsp)
    34801022:	00 
    34801023:	48 89 b4 24 b0 03 00 	mov    %rsi,0x3b0(%rsp)
    3480102a:	00 
    3480102b:	48 89 bc 24 a8 03 00 	mov    %rdi,0x3a8(%rsp)
    34801032:	00 
    34801033:	4c 89 84 24 a0 03 00 	mov    %r8,0x3a0(%rsp)
    3480103a:	00 
    3480103b:	89 84 24 9c 03 00 00 	mov    %eax,0x39c(%rsp)
    34801042:	4c 89 8c 24 90 03 00 	mov    %r9,0x390(%rsp)
    34801049:	00 
    3480104a:	4c 89 94 24 88 03 00 	mov    %r10,0x388(%rsp)
    34801051:	00 
    34801052:	4c 89 9c 24 80 03 00 	mov    %r11,0x380(%rsp)
    34801059:	00 
    3480105a:	44 88 a4 24 7f 03 00 	mov    %r12b,0x37f(%rsp)
    34801061:	00 
    34801062:	48 89 9c 24 70 03 00 	mov    %rbx,0x370(%rsp)
    34801069:	00 

000000003480106a <.LBB1_1>:
    3480106a:	8b 84 24 9c 03 00 00 	mov    0x39c(%rsp),%eax
    34801071:	8b 8c 24 cc 03 00 00 	mov    0x3cc(%rsp),%ecx
    34801078:	8b 94 24 d0 03 00 00 	mov    0x3d0(%rsp),%edx
    3480107f:	83 f9 ff             	cmp    $0xffffffff,%ecx
    34801082:	89 ce                	mov    %ecx,%esi
    34801084:	89 84 24 6c 03 00 00 	mov    %eax,0x36c(%rsp)
    3480108b:	89 8c 24 68 03 00 00 	mov    %ecx,0x368(%rsp)
    34801092:	89 94 24 64 03 00 00 	mov    %edx,0x364(%rsp)
    34801099:	89 b4 24 60 03 00 00 	mov    %esi,0x360(%rsp)
    348010a0:	0f 8e 50 00 00 00    	jle    348010f6 <.LBB1_5>
    348010a6:	b8 ff ff ff 7f       	mov    $0x7fffffff,%eax
    348010ab:	8b 8c 24 68 03 00 00 	mov    0x368(%rsp),%ecx
    348010b2:	29 c8                	sub    %ecx,%eax
    348010b4:	8b 94 24 6c 03 00 00 	mov    0x36c(%rsp),%edx
    348010bb:	39 c2                	cmp    %eax,%edx
    348010bd:	0f 8e 1c 00 00 00    	jle    348010df <.LBB1_4>
    348010c3:	e8 28 fb ff ff       	callq  34800bf0 <__errno_location>
    348010c8:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    348010cd:	c7 00 4b 00 00 00    	movl   $0x4b,(%rax)
    348010d3:	89 8c 24 60 03 00 00 	mov    %ecx,0x360(%rsp)
    348010da:	e9 17 00 00 00       	jmpq   348010f6 <.LBB1_5>

00000000348010df <.LBB1_4>:
    348010df:	8b 84 24 6c 03 00 00 	mov    0x36c(%rsp),%eax
    348010e6:	8b 8c 24 68 03 00 00 	mov    0x368(%rsp),%ecx
    348010ed:	01 c8                	add    %ecx,%eax
    348010ef:	89 84 24 60 03 00 00 	mov    %eax,0x360(%rsp)

00000000348010f6 <.LBB1_5>:
    348010f6:	8b 84 24 60 03 00 00 	mov    0x360(%rsp),%eax
    348010fd:	48 8b 8c 24 a0 04 00 	mov    0x4a0(%rsp),%rcx
    34801104:	00 
    34801105:	80 39 00             	cmpb   $0x0,(%rcx)
    34801108:	89 84 24 5c 03 00 00 	mov    %eax,0x35c(%rsp)
    3480110f:	48 89 8c 24 50 03 00 	mov    %rcx,0x350(%rsp)
    34801116:	00 
    34801117:	0f 84 01 1b 00 00    	je     34802c1e <.LBB1_104>

000000003480111d <.LBB1_6>:
    3480111d:	48 8b 84 24 a0 04 00 	mov    0x4a0(%rsp),%rax
    34801124:	00 
    34801125:	0f be 08             	movsbl (%rax),%ecx
    34801128:	85 c9                	test   %ecx,%ecx
    3480112a:	48 89 84 24 48 03 00 	mov    %rax,0x348(%rsp)
    34801131:	00 
    34801132:	89 8c 24 44 03 00 00 	mov    %ecx,0x344(%rsp)
    34801139:	0f 84 3a 00 00 00    	je     34801179 <.LBB1_8>
    3480113f:	e9 00 00 00 00       	jmpq   34801144 <.LBB1_114>

0000000034801144 <.LBB1_114>:
    34801144:	8b 84 24 44 03 00 00 	mov    0x344(%rsp),%eax
    3480114b:	83 e8 25             	sub    $0x25,%eax
    3480114e:	89 84 24 40 03 00 00 	mov    %eax,0x340(%rsp)
    34801155:	0f 84 1e 00 00 00    	je     34801179 <.LBB1_8>
    3480115b:	e9 00 00 00 00       	jmpq   34801160 <.LBB1_7>

0000000034801160 <.LBB1_7>:
    34801160:	48 8b 84 24 48 03 00 	mov    0x348(%rsp),%rax
    34801167:	00 
    34801168:	48 83 c0 01          	add    $0x1,%rax
    3480116c:	48 89 84 24 a0 04 00 	mov    %rax,0x4a0(%rsp)
    34801173:	00 
    34801174:	e9 a4 ff ff ff       	jmpq   3480111d <.LBB1_6>

0000000034801179 <.LBB1_8>:
    34801179:	48 8b 84 24 a0 04 00 	mov    0x4a0(%rsp),%rax
    34801180:	00 
    34801181:	48 89 84 24 38 03 00 	mov    %rax,0x338(%rsp)
    34801188:	00 

0000000034801189 <.LBB1_9>:
    34801189:	48 8b 84 24 38 03 00 	mov    0x338(%rsp),%rax
    34801190:	00 
    34801191:	48 8b 8c 24 a0 04 00 	mov    0x4a0(%rsp),%rcx
    34801198:	00 
    34801199:	80 39 25             	cmpb   $0x25,(%rcx)
    3480119c:	48 89 84 24 30 03 00 	mov    %rax,0x330(%rsp)
    348011a3:	00 
    348011a4:	48 89 8c 24 28 03 00 	mov    %rcx,0x328(%rsp)
    348011ab:	00 
    348011ac:	0f 85 3f 00 00 00    	jne    348011f1 <.LBB1_12>
    348011b2:	48 8b 84 24 28 03 00 	mov    0x328(%rsp),%rax
    348011b9:	00 
    348011ba:	80 78 01 25          	cmpb   $0x25,0x1(%rax)
    348011be:	0f 85 2d 00 00 00    	jne    348011f1 <.LBB1_12>
    348011c4:	48 8b 84 24 30 03 00 	mov    0x330(%rsp),%rax
    348011cb:	00 
    348011cc:	48 83 c0 01          	add    $0x1,%rax
    348011d0:	48 8b 8c 24 28 03 00 	mov    0x328(%rsp),%rcx
    348011d7:	00 
    348011d8:	48 83 c1 02          	add    $0x2,%rcx
    348011dc:	48 89 8c 24 a0 04 00 	mov    %rcx,0x4a0(%rsp)
    348011e3:	00 
    348011e4:	48 89 84 24 38 03 00 	mov    %rax,0x338(%rsp)
    348011eb:	00 
    348011ec:	e9 98 ff ff ff       	jmpq   34801189 <.LBB1_9>

00000000348011f1 <.LBB1_12>:
    348011f1:	48 8b 84 24 30 03 00 	mov    0x330(%rsp),%rax
    348011f8:	00 
    348011f9:	48 8b 8c 24 50 03 00 	mov    0x350(%rsp),%rcx
    34801200:	00 
    34801201:	48 29 c8             	sub    %rcx,%rax
    34801204:	89 c2                	mov    %eax,%edx
    34801206:	40 8a b4 24 7f 03 00 	mov    0x37f(%rsp),%sil
    3480120d:	00 
    3480120e:	40 f6 c6 01          	test   $0x1,%sil
    34801212:	48 89 84 24 20 03 00 	mov    %rax,0x320(%rsp)
    34801219:	00 
    3480121a:	89 94 24 1c 03 00 00 	mov    %edx,0x31c(%rsp)
    34801221:	0f 85 05 00 00 00    	jne    3480122c <.LBB1_13>
    34801227:	e9 28 00 00 00       	jmpq   34801254 <.LBB1_14>

000000003480122c <.LBB1_13>:
    3480122c:	48 8b 84 24 20 03 00 	mov    0x320(%rsp),%rax
    34801233:	00 
    34801234:	48 c1 e0 20          	shl    $0x20,%rax
    34801238:	48 c1 f8 20          	sar    $0x20,%rax
    3480123c:	48 8b bc 24 a8 03 00 	mov    0x3a8(%rsp),%rdi
    34801243:	00 
    34801244:	48 8b b4 24 50 03 00 	mov    0x350(%rsp),%rsi
    3480124b:	00 
    3480124c:	48 89 c2             	mov    %rax,%rdx
    3480124f:	e8 fc 1a 00 00       	callq  34802d50 <out>

0000000034801254 <.LBB1_14>:
    34801254:	8b 84 24 1c 03 00 00 	mov    0x31c(%rsp),%eax
    3480125b:	83 f8 00             	cmp    $0x0,%eax
    3480125e:	8b 8c 24 64 03 00 00 	mov    0x364(%rsp),%ecx
    34801265:	8b 94 24 5c 03 00 00 	mov    0x35c(%rsp),%edx
    3480126c:	89 84 24 9c 03 00 00 	mov    %eax,0x39c(%rsp)
    34801273:	89 8c 24 d0 03 00 00 	mov    %ecx,0x3d0(%rsp)
    3480127a:	89 94 24 cc 03 00 00 	mov    %edx,0x3cc(%rsp)
    34801281:	0f 85 e3 fd ff ff    	jne    3480106a <.LBB1_1>
    34801287:	48 8b 84 24 a0 04 00 	mov    0x4a0(%rsp),%rax
    3480128e:	00 
    3480128f:	0f be 48 01          	movsbl 0x1(%rax),%ecx
    34801293:	83 c1 d0             	add    $0xffffffd0,%ecx
    34801296:	83 f9 0a             	cmp    $0xa,%ecx
    34801299:	48 89 84 24 10 03 00 	mov    %rax,0x310(%rsp)
    348012a0:	00 
    348012a1:	89 8c 24 0c 03 00 00 	mov    %ecx,0x30c(%rsp)
    348012a8:	0f 83 45 00 00 00    	jae    348012f3 <.LBB1_18>
    348012ae:	48 8b 84 24 10 03 00 	mov    0x310(%rsp),%rax
    348012b5:	00 
    348012b6:	80 78 02 24          	cmpb   $0x24,0x2(%rax)
    348012ba:	0f 85 33 00 00 00    	jne    348012f3 <.LBB1_18>
    348012c0:	b8 01 00 00 00       	mov    $0x1,%eax
    348012c5:	48 8b 8c 24 10 03 00 	mov    0x310(%rsp),%rcx
    348012cc:	00 
    348012cd:	48 83 c1 03          	add    $0x3,%rcx
    348012d1:	8b 94 24 0c 03 00 00 	mov    0x30c(%rsp),%edx
    348012d8:	48 89 8c 24 00 03 00 	mov    %rcx,0x300(%rsp)
    348012df:	00 
    348012e0:	89 84 24 fc 02 00 00 	mov    %eax,0x2fc(%rsp)
    348012e7:	89 94 24 f8 02 00 00 	mov    %edx,0x2f8(%rsp)
    348012ee:	e9 2e 00 00 00       	jmpq   34801321 <.LBB1_19>

00000000348012f3 <.LBB1_18>:
    348012f3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    348012f8:	48 8b 8c 24 a0 04 00 	mov    0x4a0(%rsp),%rcx
    348012ff:	00 
    34801300:	48 83 c1 01          	add    $0x1,%rcx
    34801304:	8b 94 24 64 03 00 00 	mov    0x364(%rsp),%edx
    3480130b:	89 94 24 fc 02 00 00 	mov    %edx,0x2fc(%rsp)
    34801312:	48 89 8c 24 00 03 00 	mov    %rcx,0x300(%rsp)
    34801319:	00 
    3480131a:	89 84 24 f8 02 00 00 	mov    %eax,0x2f8(%rsp)

0000000034801321 <.LBB1_19>:
    34801321:	8b 84 24 f8 02 00 00 	mov    0x2f8(%rsp),%eax
    34801328:	8b 8c 24 fc 02 00 00 	mov    0x2fc(%rsp),%ecx
    3480132f:	48 8b 94 24 00 03 00 	mov    0x300(%rsp),%rdx
    34801336:	00 
    34801337:	31 f6                	xor    %esi,%esi
    34801339:	89 84 24 f4 02 00 00 	mov    %eax,0x2f4(%rsp)
    34801340:	89 8c 24 f0 02 00 00 	mov    %ecx,0x2f0(%rsp)
    34801347:	48 89 94 24 e8 02 00 	mov    %rdx,0x2e8(%rsp)
    3480134e:	00 
    3480134f:	89 b4 24 e4 02 00 00 	mov    %esi,0x2e4(%rsp)

0000000034801356 <.LBB1_20>:
    34801356:	8b 84 24 e4 02 00 00 	mov    0x2e4(%rsp),%eax
    3480135d:	48 8b 8c 24 e8 02 00 	mov    0x2e8(%rsp),%rcx
    34801364:	00 
    34801365:	31 d2                	xor    %edx,%edx
    34801367:	40 88 d6             	mov    %dl,%sil
    3480136a:	48 89 8c 24 a0 04 00 	mov    %rcx,0x4a0(%rsp)
    34801371:	00 
    34801372:	0f be 11             	movsbl (%rcx),%edx
    34801375:	83 c2 e0             	add    $0xffffffe0,%edx
    34801378:	83 fa 20             	cmp    $0x20,%edx
    3480137b:	89 84 24 e0 02 00 00 	mov    %eax,0x2e0(%rsp)
    34801382:	89 94 24 dc 02 00 00 	mov    %edx,0x2dc(%rsp)
    34801389:	40 88 b4 24 db 02 00 	mov    %sil,0x2db(%rsp)
    34801390:	00 
    34801391:	0f 83 20 00 00 00    	jae    348013b7 <.LBB1_22>
    34801397:	b8 01 00 00 00       	mov    $0x1,%eax
    3480139c:	8b 8c 24 dc 02 00 00 	mov    0x2dc(%rsp),%ecx
    348013a3:	d3 e0                	shl    %cl,%eax
    348013a5:	25 89 28 01 00       	and    $0x12889,%eax
    348013aa:	83 f8 00             	cmp    $0x0,%eax
    348013ad:	0f 95 c1             	setne  %cl
    348013b0:	88 8c 24 db 02 00 00 	mov    %cl,0x2db(%rsp)

00000000348013b7 <.LBB1_22>:
    348013b7:	8a 84 24 db 02 00 00 	mov    0x2db(%rsp),%al
    348013be:	48 8b 8c 24 a0 04 00 	mov    0x4a0(%rsp),%rcx
    348013c5:	00 
    348013c6:	8a 11                	mov    (%rcx),%dl
    348013c8:	a8 01                	test   $0x1,%al
    348013ca:	88 94 24 da 02 00 00 	mov    %dl,0x2da(%rsp)
    348013d1:	48 89 8c 24 d0 02 00 	mov    %rcx,0x2d0(%rsp)
    348013d8:	00 
    348013d9:	0f 85 05 00 00 00    	jne    348013e4 <.LBB1_23>
    348013df:	e9 3f 00 00 00       	jmpq   34801423 <.LBB1_24>

00000000348013e4 <.LBB1_23>:
    348013e4:	b8 01 00 00 00       	mov    $0x1,%eax
    348013e9:	8a 8c 24 da 02 00 00 	mov    0x2da(%rsp),%cl
    348013f0:	0f be d1             	movsbl %cl,%edx
    348013f3:	83 c2 e0             	add    $0xffffffe0,%edx
    348013f6:	89 d1                	mov    %edx,%ecx
    348013f8:	d3 e0                	shl    %cl,%eax
    348013fa:	8b 94 24 e0 02 00 00 	mov    0x2e0(%rsp),%edx
    34801401:	09 d0                	or     %edx,%eax
    34801403:	48 8b b4 24 d0 02 00 	mov    0x2d0(%rsp),%rsi
    3480140a:	00 
    3480140b:	48 83 c6 01          	add    $0x1,%rsi
    3480140f:	48 89 b4 24 e8 02 00 	mov    %rsi,0x2e8(%rsp)
    34801416:	00 
    34801417:	89 84 24 e4 02 00 00 	mov    %eax,0x2e4(%rsp)
    3480141e:	e9 33 ff ff ff       	jmpq   34801356 <.LBB1_20>

0000000034801423 <.LBB1_24>:
    34801423:	8a 84 24 da 02 00 00 	mov    0x2da(%rsp),%al
    3480142a:	3c 2a                	cmp    $0x2a,%al
    3480142c:	0f 85 09 02 00 00    	jne    3480163b <.LBB1_37>
    34801432:	48 8b 84 24 d0 02 00 	mov    0x2d0(%rsp),%rax
    34801439:	00 
    3480143a:	0f be 48 01          	movsbl 0x1(%rax),%ecx
    3480143e:	83 c1 d0             	add    $0xffffffd0,%ecx
    34801441:	83 f9 0a             	cmp    $0xa,%ecx
    34801444:	89 8c 24 cc 02 00 00 	mov    %ecx,0x2cc(%rsp)
    3480144b:	0f 83 76 00 00 00    	jae    348014c7 <.LBB1_28>
    34801451:	48 8b 84 24 d0 02 00 	mov    0x2d0(%rsp),%rax
    34801458:	00 
    34801459:	80 78 02 24          	cmpb   $0x24,0x2(%rax)
    3480145d:	0f 85 64 00 00 00    	jne    348014c7 <.LBB1_28>
    34801463:	b8 01 00 00 00       	mov    $0x1,%eax
    34801468:	8b 8c 24 cc 02 00 00 	mov    0x2cc(%rsp),%ecx
    3480146f:	48 63 d1             	movslq %ecx,%rdx
    34801472:	48 8b b4 24 a0 03 00 	mov    0x3a0(%rsp),%rsi
    34801479:	00 
    3480147a:	c7 04 96 0a 00 00 00 	movl   $0xa,(%rsi,%rdx,4)
    34801481:	48 8b 94 24 a0 04 00 	mov    0x4a0(%rsp),%rdx
    34801488:	00 
    34801489:	48 0f be 7a 01       	movsbq 0x1(%rdx),%rdi
    3480148e:	48 83 c7 d0          	add    $0xffffffffffffffd0,%rdi
    34801492:	48 c1 e7 04          	shl    $0x4,%rdi
    34801496:	4c 8b 84 24 48 04 00 	mov    0x448(%rsp),%r8
    3480149d:	00 
    3480149e:	49 01 f8             	add    %rdi,%r8
    348014a1:	49 8b 38             	mov    (%r8),%rdi
    348014a4:	41 89 f9             	mov    %edi,%r9d
    348014a7:	48 83 c2 03          	add    $0x3,%rdx
    348014ab:	48 89 94 24 c0 02 00 	mov    %rdx,0x2c0(%rsp)
    348014b2:	00 
    348014b3:	89 84 24 bc 02 00 00 	mov    %eax,0x2bc(%rsp)
    348014ba:	44 89 8c 24 b8 02 00 	mov    %r9d,0x2b8(%rsp)
    348014c1:	00 
    348014c2:	e9 e4 00 00 00       	jmpq   348015ab <.LBB1_35>

00000000348014c7 <.LBB1_28>:
    348014c7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    348014cc:	8b 8c 24 f0 02 00 00 	mov    0x2f0(%rsp),%ecx
    348014d3:	83 f9 00             	cmp    $0x0,%ecx
    348014d6:	89 84 24 b4 02 00 00 	mov    %eax,0x2b4(%rsp)
    348014dd:	0f 85 58 18 00 00    	jne    34802d3b <.LBB1_113>
    348014e3:	31 c0                	xor    %eax,%eax
    348014e5:	8a 8c 24 7f 03 00 00 	mov    0x37f(%rsp),%cl
    348014ec:	f6 c1 01             	test   $0x1,%cl
    348014ef:	89 84 24 b0 02 00 00 	mov    %eax,0x2b0(%rsp)
    348014f6:	0f 85 05 00 00 00    	jne    34801501 <.LBB1_30>
    348014fc:	e9 7a 00 00 00       	jmpq   3480157b <.LBB1_34>

0000000034801501 <.LBB1_30>:
    34801501:	48 8b 84 24 b8 03 00 	mov    0x3b8(%rsp),%rax
    34801508:	00 
    34801509:	8b 08                	mov    (%rax),%ecx
    3480150b:	83 f9 29             	cmp    $0x29,%ecx
    3480150e:	89 8c 24 ac 02 00 00 	mov    %ecx,0x2ac(%rsp)
    34801515:	0f 83 32 00 00 00    	jae    3480154d <.LBB1_32>
    3480151b:	48 8b 84 24 b0 03 00 	mov    0x3b0(%rsp),%rax
    34801522:	00 
    34801523:	48 8b 08             	mov    (%rax),%rcx
    34801526:	8b 94 24 ac 02 00 00 	mov    0x2ac(%rsp),%edx
    3480152d:	48 63 f2             	movslq %edx,%rsi
    34801530:	48 01 f1             	add    %rsi,%rcx
    34801533:	83 c2 08             	add    $0x8,%edx
    34801536:	48 8b b4 24 b8 03 00 	mov    0x3b8(%rsp),%rsi
    3480153d:	00 
    3480153e:	89 16                	mov    %edx,(%rsi)
    34801540:	48 89 8c 24 a0 02 00 	mov    %rcx,0x2a0(%rsp)
    34801547:	00 
    34801548:	e9 1d 00 00 00       	jmpq   3480156a <.LBB1_33>

000000003480154d <.LBB1_32>:
    3480154d:	48 8b 84 24 40 04 00 	mov    0x440(%rsp),%rax
    34801554:	00 
    34801555:	48 8b 08             	mov    (%rax),%rcx
    34801558:	48 89 ca             	mov    %rcx,%rdx
    3480155b:	48 83 c2 08          	add    $0x8,%rdx
    3480155f:	48 89 10             	mov    %rdx,(%rax)
    34801562:	48 89 8c 24 a0 02 00 	mov    %rcx,0x2a0(%rsp)
    34801569:	00 

000000003480156a <.LBB1_33>:
    3480156a:	48 8b 84 24 a0 02 00 	mov    0x2a0(%rsp),%rax
    34801571:	00 
    34801572:	8b 08                	mov    (%rax),%ecx
    34801574:	89 8c 24 b0 02 00 00 	mov    %ecx,0x2b0(%rsp)

000000003480157b <.LBB1_34>:
    3480157b:	8b 84 24 b0 02 00 00 	mov    0x2b0(%rsp),%eax
    34801582:	48 8b 8c 24 a0 04 00 	mov    0x4a0(%rsp),%rcx
    34801589:	00 
    3480158a:	48 83 c1 01          	add    $0x1,%rcx
    3480158e:	8b 94 24 f0 02 00 00 	mov    0x2f0(%rsp),%edx
    34801595:	89 94 24 bc 02 00 00 	mov    %edx,0x2bc(%rsp)
    3480159c:	48 89 8c 24 c0 02 00 	mov    %rcx,0x2c0(%rsp)
    348015a3:	00 
    348015a4:	89 84 24 b8 02 00 00 	mov    %eax,0x2b8(%rsp)

00000000348015ab <.LBB1_35>:
    348015ab:	8b 84 24 b8 02 00 00 	mov    0x2b8(%rsp),%eax
    348015b2:	8b 8c 24 bc 02 00 00 	mov    0x2bc(%rsp),%ecx
    348015b9:	48 8b 94 24 c0 02 00 	mov    0x2c0(%rsp),%rdx
    348015c0:	00 
    348015c1:	48 89 94 24 a0 04 00 	mov    %rdx,0x4a0(%rsp)
    348015c8:	00 
    348015c9:	83 f8 00             	cmp    $0x0,%eax
    348015cc:	89 ce                	mov    %ecx,%esi
    348015ce:	8b bc 24 e0 02 00 00 	mov    0x2e0(%rsp),%edi
    348015d5:	41 89 c0             	mov    %eax,%r8d
    348015d8:	89 84 24 9c 02 00 00 	mov    %eax,0x29c(%rsp)
    348015df:	89 8c 24 98 02 00 00 	mov    %ecx,0x298(%rsp)
    348015e6:	89 b4 24 94 02 00 00 	mov    %esi,0x294(%rsp)
    348015ed:	89 bc 24 90 02 00 00 	mov    %edi,0x290(%rsp)
    348015f4:	44 89 84 24 8c 02 00 	mov    %r8d,0x28c(%rsp)
    348015fb:	00 
    348015fc:	0f 8d 7e 00 00 00    	jge    34801680 <.LBB1_38>
    34801602:	31 c0                	xor    %eax,%eax
    34801604:	8b 8c 24 e0 02 00 00 	mov    0x2e0(%rsp),%ecx
    3480160b:	81 c9 00 20 00 00    	or     $0x2000,%ecx
    34801611:	8b 94 24 9c 02 00 00 	mov    0x29c(%rsp),%edx
    34801618:	29 d0                	sub    %edx,%eax
    3480161a:	8b b4 24 98 02 00 00 	mov    0x298(%rsp),%esi
    34801621:	89 b4 24 94 02 00 00 	mov    %esi,0x294(%rsp)
    34801628:	89 8c 24 90 02 00 00 	mov    %ecx,0x290(%rsp)
    3480162f:	89 84 24 8c 02 00 00 	mov    %eax,0x28c(%rsp)
    34801636:	e9 45 00 00 00       	jmpq   34801680 <.LBB1_38>

000000003480163b <.LBB1_37>:
    3480163b:	48 8d bc 24 a0 04 00 	lea    0x4a0(%rsp),%rdi
    34801642:	00 
    34801643:	e8 48 17 00 00       	callq  34802d90 <getint>
    34801648:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    3480164d:	83 f8 00             	cmp    $0x0,%eax
    34801650:	8b 94 24 f0 02 00 00 	mov    0x2f0(%rsp),%edx
    34801657:	8b b4 24 e0 02 00 00 	mov    0x2e0(%rsp),%esi
    3480165e:	89 b4 24 90 02 00 00 	mov    %esi,0x290(%rsp)
    34801665:	89 84 24 8c 02 00 00 	mov    %eax,0x28c(%rsp)
    3480166c:	89 94 24 94 02 00 00 	mov    %edx,0x294(%rsp)
    34801673:	89 8c 24 b4 02 00 00 	mov    %ecx,0x2b4(%rsp)
    3480167a:	0f 8c bb 16 00 00    	jl     34802d3b <.LBB1_113>

0000000034801680 <.LBB1_38>:
    34801680:	8b 84 24 8c 02 00 00 	mov    0x28c(%rsp),%eax
    34801687:	8b 8c 24 90 02 00 00 	mov    0x290(%rsp),%ecx
    3480168e:	8b 94 24 94 02 00 00 	mov    0x294(%rsp),%edx
    34801695:	48 8b b4 24 a0 04 00 	mov    0x4a0(%rsp),%rsi
    3480169c:	00 
    3480169d:	80 3e 2e             	cmpb   $0x2e,(%rsi)
    348016a0:	89 84 24 88 02 00 00 	mov    %eax,0x288(%rsp)
    348016a7:	89 8c 24 84 02 00 00 	mov    %ecx,0x284(%rsp)
    348016ae:	89 94 24 80 02 00 00 	mov    %edx,0x280(%rsp)
    348016b5:	48 89 b4 24 78 02 00 	mov    %rsi,0x278(%rsp)
    348016bc:	00 
    348016bd:	0f 85 76 01 00 00    	jne    34801839 <.LBB1_50>
    348016c3:	48 8b 84 24 78 02 00 	mov    0x278(%rsp),%rax
    348016ca:	00 
    348016cb:	80 78 01 2a          	cmpb   $0x2a,0x1(%rax)
    348016cf:	0f 85 64 01 00 00    	jne    34801839 <.LBB1_50>
    348016d5:	48 8b 84 24 78 02 00 	mov    0x278(%rsp),%rax
    348016dc:	00 
    348016dd:	0f be 48 02          	movsbl 0x2(%rax),%ecx
    348016e1:	83 c1 d0             	add    $0xffffffd0,%ecx
    348016e4:	83 f9 0a             	cmp    $0xa,%ecx
    348016e7:	89 8c 24 74 02 00 00 	mov    %ecx,0x274(%rsp)
    348016ee:	0f 83 6a 00 00 00    	jae    3480175e <.LBB1_43>
    348016f4:	48 8b 84 24 78 02 00 	mov    0x278(%rsp),%rax
    348016fb:	00 
    348016fc:	80 78 03 24          	cmpb   $0x24,0x3(%rax)
    34801700:	0f 85 58 00 00 00    	jne    3480175e <.LBB1_43>
    34801706:	8b 84 24 74 02 00 00 	mov    0x274(%rsp),%eax
    3480170d:	48 63 c8             	movslq %eax,%rcx
    34801710:	48 8b 94 24 a0 03 00 	mov    0x3a0(%rsp),%rdx
    34801717:	00 
    34801718:	c7 04 8a 0a 00 00 00 	movl   $0xa,(%rdx,%rcx,4)
    3480171f:	48 8b 8c 24 a0 04 00 	mov    0x4a0(%rsp),%rcx
    34801726:	00 
    34801727:	48 0f be 71 02       	movsbq 0x2(%rcx),%rsi
    3480172c:	48 83 c6 d0          	add    $0xffffffffffffffd0,%rsi
    34801730:	48 c1 e6 04          	shl    $0x4,%rsi
    34801734:	48 8b bc 24 48 04 00 	mov    0x448(%rsp),%rdi
    3480173b:	00 
    3480173c:	48 01 f7             	add    %rsi,%rdi
    3480173f:	48 8b 37             	mov    (%rdi),%rsi
    34801742:	41 89 f0             	mov    %esi,%r8d
    34801745:	48 83 c1 04          	add    $0x4,%rcx
    34801749:	48 89 8c 24 a0 04 00 	mov    %rcx,0x4a0(%rsp)
    34801750:	00 
    34801751:	44 89 84 24 70 02 00 	mov    %r8d,0x270(%rsp)
    34801758:	00 
    34801759:	e9 28 01 00 00       	jmpq   34801886 <.LBB1_52>

000000003480175e <.LBB1_43>:
    3480175e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    34801763:	8b 8c 24 80 02 00 00 	mov    0x280(%rsp),%ecx
    3480176a:	83 f9 00             	cmp    $0x0,%ecx
    3480176d:	89 84 24 b4 02 00 00 	mov    %eax,0x2b4(%rsp)
    34801774:	0f 85 c1 15 00 00    	jne    34802d3b <.LBB1_113>
    3480177a:	31 c0                	xor    %eax,%eax
    3480177c:	8a 8c 24 7f 03 00 00 	mov    0x37f(%rsp),%cl
    34801783:	f6 c1 01             	test   $0x1,%cl
    34801786:	89 84 24 6c 02 00 00 	mov    %eax,0x26c(%rsp)
    3480178d:	0f 85 05 00 00 00    	jne    34801798 <.LBB1_45>
    34801793:	e9 7a 00 00 00       	jmpq   34801812 <.LBB1_49>

0000000034801798 <.LBB1_45>:
    34801798:	48 8b 84 24 b8 03 00 	mov    0x3b8(%rsp),%rax
    3480179f:	00 
    348017a0:	8b 08                	mov    (%rax),%ecx
    348017a2:	83 f9 29             	cmp    $0x29,%ecx
    348017a5:	89 8c 24 68 02 00 00 	mov    %ecx,0x268(%rsp)
    348017ac:	0f 83 32 00 00 00    	jae    348017e4 <.LBB1_47>
    348017b2:	48 8b 84 24 38 04 00 	mov    0x438(%rsp),%rax
    348017b9:	00 
    348017ba:	48 8b 08             	mov    (%rax),%rcx
    348017bd:	8b 94 24 68 02 00 00 	mov    0x268(%rsp),%edx
    348017c4:	48 63 f2             	movslq %edx,%rsi
    348017c7:	48 01 f1             	add    %rsi,%rcx
    348017ca:	83 c2 08             	add    $0x8,%edx
    348017cd:	48 8b b4 24 b8 03 00 	mov    0x3b8(%rsp),%rsi
    348017d4:	00 
    348017d5:	89 16                	mov    %edx,(%rsi)
    348017d7:	48 89 8c 24 60 02 00 	mov    %rcx,0x260(%rsp)
    348017de:	00 
    348017df:	e9 1d 00 00 00       	jmpq   34801801 <.LBB1_48>

00000000348017e4 <.LBB1_47>:
    348017e4:	48 8b 84 24 30 04 00 	mov    0x430(%rsp),%rax
    348017eb:	00 
    348017ec:	48 8b 08             	mov    (%rax),%rcx
    348017ef:	48 89 ca             	mov    %rcx,%rdx
    348017f2:	48 83 c2 08          	add    $0x8,%rdx
    348017f6:	48 89 10             	mov    %rdx,(%rax)
    348017f9:	48 89 8c 24 60 02 00 	mov    %rcx,0x260(%rsp)
    34801800:	00 

0000000034801801 <.LBB1_48>:
    34801801:	48 8b 84 24 60 02 00 	mov    0x260(%rsp),%rax
    34801808:	00 
    34801809:	8b 08                	mov    (%rax),%ecx
    3480180b:	89 8c 24 6c 02 00 00 	mov    %ecx,0x26c(%rsp)

0000000034801812 <.LBB1_49>:
    34801812:	8b 84 24 6c 02 00 00 	mov    0x26c(%rsp),%eax
    34801819:	48 8b 8c 24 a0 04 00 	mov    0x4a0(%rsp),%rcx
    34801820:	00 
    34801821:	48 83 c1 02          	add    $0x2,%rcx
    34801825:	48 89 8c 24 a0 04 00 	mov    %rcx,0x4a0(%rsp)
    3480182c:	00 
    3480182d:	89 84 24 70 02 00 00 	mov    %eax,0x270(%rsp)
    34801834:	e9 4d 00 00 00       	jmpq   34801886 <.LBB1_52>

0000000034801839 <.LBB1_50>:
    34801839:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3480183e:	48 8b 8c 24 a0 04 00 	mov    0x4a0(%rsp),%rcx
    34801845:	00 
    34801846:	80 39 2e             	cmpb   $0x2e,(%rcx)
    34801849:	48 89 8c 24 58 02 00 	mov    %rcx,0x258(%rsp)
    34801850:	00 
    34801851:	89 84 24 70 02 00 00 	mov    %eax,0x270(%rsp)
    34801858:	0f 85 28 00 00 00    	jne    34801886 <.LBB1_52>
    3480185e:	48 8d bc 24 a0 04 00 	lea    0x4a0(%rsp),%rdi
    34801865:	00 
    34801866:	48 8b 84 24 58 02 00 	mov    0x258(%rsp),%rax
    3480186d:	00 
    3480186e:	48 83 c0 01          	add    $0x1,%rax
    34801872:	48 89 84 24 a0 04 00 	mov    %rax,0x4a0(%rsp)
    34801879:	00 
    3480187a:	e8 11 15 00 00       	callq  34802d90 <getint>
    3480187f:	89 84 24 70 02 00 00 	mov    %eax,0x270(%rsp)

0000000034801886 <.LBB1_52>:
    34801886:	8b 84 24 70 02 00 00 	mov    0x270(%rsp),%eax
    3480188d:	31 c9                	xor    %ecx,%ecx
    3480188f:	89 84 24 54 02 00 00 	mov    %eax,0x254(%rsp)
    34801896:	89 8c 24 50 02 00 00 	mov    %ecx,0x250(%rsp)

000000003480189d <.LBB1_53>:
    3480189d:	8b 84 24 50 02 00 00 	mov    0x250(%rsp),%eax
    348018a4:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    348018a9:	48 8b 94 24 a0 04 00 	mov    0x4a0(%rsp),%rdx
    348018b0:	00 
    348018b1:	0f be 32             	movsbl (%rdx),%esi
    348018b4:	83 c6 bf             	add    $0xffffffbf,%esi
    348018b7:	83 fe 39             	cmp    $0x39,%esi
    348018ba:	89 84 24 4c 02 00 00 	mov    %eax,0x24c(%rsp)
    348018c1:	48 89 94 24 40 02 00 	mov    %rdx,0x240(%rsp)
    348018c8:	00 
    348018c9:	89 8c 24 b4 02 00 00 	mov    %ecx,0x2b4(%rsp)
    348018d0:	0f 87 65 14 00 00    	ja     34802d3b <.LBB1_113>
    348018d6:	48 b8 80 65 80 34 00 	movabs $0x34806580,%rax
    348018dd:	00 00 00 
    348018e0:	8b 8c 24 4c 02 00 00 	mov    0x24c(%rsp),%ecx
    348018e7:	89 ca                	mov    %ecx,%edx
    348018e9:	89 d6                	mov    %edx,%esi
    348018eb:	48 8b bc 24 40 02 00 	mov    0x240(%rsp),%rdi
    348018f2:	00 
    348018f3:	48 83 c7 01          	add    $0x1,%rdi
    348018f7:	48 89 bc 24 a0 04 00 	mov    %rdi,0x4a0(%rsp)
    348018fe:	00 
    348018ff:	48 8b bc 24 40 02 00 	mov    0x240(%rsp),%rdi
    34801906:	00 
    34801907:	4c 0f be 07          	movsbq (%rdi),%r8
    3480190b:	49 83 c0 bf          	add    $0xffffffffffffffbf,%r8
    3480190f:	48 6b f6 3a          	imul   $0x3a,%rsi,%rsi
    34801913:	48 01 f0             	add    %rsi,%rax
    34801916:	4c 01 c0             	add    %r8,%rax
    34801919:	44 8a 08             	mov    (%rax),%r9b
    3480191c:	41 0f b6 d1          	movzbl %r9b,%edx
    34801920:	41 89 d2             	mov    %edx,%r10d
    34801923:	41 83 c2 ff          	add    $0xffffffff,%r10d
    34801927:	41 83 fa 08          	cmp    $0x8,%r10d
    3480192b:	41 89 d2             	mov    %edx,%r10d
    3480192e:	44 88 8c 24 3f 02 00 	mov    %r9b,0x23f(%rsp)
    34801935:	00 
    34801936:	89 94 24 38 02 00 00 	mov    %edx,0x238(%rsp)
    3480193d:	44 89 94 24 50 02 00 	mov    %r10d,0x250(%rsp)
    34801944:	00 
    34801945:	0f 82 52 ff ff ff    	jb     3480189d <.LBB1_53>
    3480194b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    34801950:	8a 8c 24 3f 02 00 00 	mov    0x23f(%rsp),%cl
    34801957:	80 f9 00             	cmp    $0x0,%cl
    3480195a:	89 84 24 b4 02 00 00 	mov    %eax,0x2b4(%rsp)
    34801961:	0f 84 d4 13 00 00    	je     34802d3b <.LBB1_113>
    34801967:	8b 84 24 f4 02 00 00 	mov    0x2f4(%rsp),%eax
    3480196e:	83 f8 ff             	cmp    $0xffffffff,%eax
    34801971:	0f 9f c1             	setg   %cl
    34801974:	8a 94 24 3f 02 00 00 	mov    0x23f(%rsp),%dl
    3480197b:	80 fa 15             	cmp    $0x15,%dl
    3480197e:	88 8c 24 37 02 00 00 	mov    %cl,0x237(%rsp)
    34801985:	0f 85 21 00 00 00    	jne    348019ac <.LBB1_58>
    3480198b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    34801990:	8a 8c 24 37 02 00 00 	mov    0x237(%rsp),%cl
    34801997:	f6 c1 01             	test   $0x1,%cl
    3480199a:	89 84 24 b4 02 00 00 	mov    %eax,0x2b4(%rsp)
    348019a1:	0f 85 94 13 00 00    	jne    34802d3b <.LBB1_113>
    348019a7:	e9 94 00 00 00       	jmpq   34801a40 <.LBB1_62>

00000000348019ac <.LBB1_58>:
    348019ac:	8a 84 24 37 02 00 00 	mov    0x237(%rsp),%al
    348019b3:	a8 01                	test   $0x1,%al
    348019b5:	0f 85 05 00 00 00    	jne    348019c0 <.LBB1_59>
    348019bb:	e9 46 00 00 00       	jmpq   34801a06 <.LBB1_60>

00000000348019c0 <.LBB1_59>:
    348019c0:	8b 84 24 f4 02 00 00 	mov    0x2f4(%rsp),%eax
    348019c7:	48 63 c8             	movslq %eax,%rcx
    348019ca:	48 8b 94 24 a0 03 00 	mov    0x3a0(%rsp),%rdx
    348019d1:	00 
    348019d2:	8b b4 24 38 02 00 00 	mov    0x238(%rsp),%esi
    348019d9:	89 34 8a             	mov    %esi,(%rdx,%rcx,4)
    348019dc:	48 c1 e1 04          	shl    $0x4,%rcx
    348019e0:	48 8b bc 24 48 04 00 	mov    0x448(%rsp),%rdi
    348019e7:	00 
    348019e8:	48 01 cf             	add    %rcx,%rdi
    348019eb:	48 8b 0f             	mov    (%rdi),%rcx
    348019ee:	4c 8b 84 24 c0 03 00 	mov    0x3c0(%rsp),%r8
    348019f5:	00 
    348019f6:	49 89 08             	mov    %rcx,(%r8)
    348019f9:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
    348019fd:	49 89 48 08          	mov    %rcx,0x8(%r8)
    34801a01:	e9 3a 00 00 00       	jmpq   34801a40 <.LBB1_62>

0000000034801a06 <.LBB1_60>:
    34801a06:	31 c0                	xor    %eax,%eax
    34801a08:	8a 8c 24 7f 03 00 00 	mov    0x37f(%rsp),%cl
    34801a0f:	f6 c1 01             	test   $0x1,%cl
    34801a12:	89 84 24 b4 02 00 00 	mov    %eax,0x2b4(%rsp)
    34801a19:	0f 85 05 00 00 00    	jne    34801a24 <.LBB1_61>
    34801a1f:	e9 17 13 00 00       	jmpq   34802d3b <.LBB1_113>

0000000034801a24 <.LBB1_61>:
    34801a24:	48 8d bc 24 90 04 00 	lea    0x490(%rsp),%rdi
    34801a2b:	00 
    34801a2c:	8b b4 24 38 02 00 00 	mov    0x238(%rsp),%esi
    34801a33:	48 8b 94 24 b8 03 00 	mov    0x3b8(%rsp),%rdx
    34801a3a:	00 
    34801a3b:	e8 c0 13 00 00       	callq  34802e00 <pop_arg>

0000000034801a40 <.LBB1_62>:
    34801a40:	8a 84 24 7f 03 00 00 	mov    0x37f(%rsp),%al
    34801a47:	a8 01                	test   $0x1,%al
    34801a49:	8b 8c 24 80 02 00 00 	mov    0x280(%rsp),%ecx
    34801a50:	8b 94 24 5c 03 00 00 	mov    0x35c(%rsp),%edx
    34801a57:	8b b4 24 1c 03 00 00 	mov    0x31c(%rsp),%esi
    34801a5e:	89 8c 24 d0 03 00 00 	mov    %ecx,0x3d0(%rsp)
    34801a65:	89 94 24 cc 03 00 00 	mov    %edx,0x3cc(%rsp)
    34801a6c:	89 b4 24 9c 03 00 00 	mov    %esi,0x39c(%rsp)
    34801a73:	0f 85 05 00 00 00    	jne    34801a7e <.LBB1_63>
    34801a79:	e9 ec f5 ff ff       	jmpq   3480106a <.LBB1_1>

0000000034801a7e <.LBB1_63>:
    34801a7e:	48 8b 84 24 a0 04 00 	mov    0x4a0(%rsp),%rax
    34801a85:	00 
    34801a86:	0f be 48 ff          	movsbl -0x1(%rax),%ecx
    34801a8a:	89 ca                	mov    %ecx,%edx
    34801a8c:	83 e2 0f             	and    $0xf,%edx
    34801a8f:	89 ce                	mov    %ecx,%esi
    34801a91:	83 e6 df             	and    $0xffffffdf,%esi
    34801a94:	83 ea 03             	sub    $0x3,%edx
    34801a97:	89 cf                	mov    %ecx,%edi
    34801a99:	0f 44 fe             	cmove  %esi,%edi
    34801a9c:	8b b4 24 4c 02 00 00 	mov    0x24c(%rsp),%esi
    34801aa3:	85 f6                	test   %esi,%esi
    34801aa5:	0f 45 cf             	cmovne %edi,%ecx
    34801aa8:	8b bc 24 84 02 00 00 	mov    0x284(%rsp),%edi
    34801aaf:	81 e7 ff ff fe ff    	and    $0xfffeffff,%edi
    34801ab5:	44 8b 84 24 84 02 00 	mov    0x284(%rsp),%r8d
    34801abc:	00 
    34801abd:	44 89 c3             	mov    %r8d,%ebx
    34801ac0:	88 f8                	mov    %bh,%al
    34801ac2:	a8 20                	test   $0x20,%al
    34801ac4:	44 0f 45 c7          	cmovne %edi,%r8d
    34801ac8:	bb 60 67 80 34       	mov    $0x34806760,%ebx
    34801acd:	41 89 d9             	mov    %ebx,%r9d
    34801ad0:	31 db                	xor    %ebx,%ebx
    34801ad2:	41 89 ca             	mov    %ecx,%r10d
    34801ad5:	41 83 ea 41          	sub    $0x41,%r10d
    34801ad9:	89 8c 24 30 02 00 00 	mov    %ecx,0x230(%rsp)
    34801ae0:	89 94 24 2c 02 00 00 	mov    %edx,0x22c(%rsp)
    34801ae7:	89 bc 24 28 02 00 00 	mov    %edi,0x228(%rsp)
    34801aee:	44 89 84 24 24 02 00 	mov    %r8d,0x224(%rsp)
    34801af5:	00 
    34801af6:	4c 89 8c 24 18 02 00 	mov    %r9,0x218(%rsp)
    34801afd:	00 
    34801afe:	89 9c 24 14 02 00 00 	mov    %ebx,0x214(%rsp)
    34801b05:	44 89 94 24 10 02 00 	mov    %r10d,0x210(%rsp)
    34801b0c:	00 
    34801b0d:	0f 84 45 0f 00 00    	je     34802a58 <.LBB1_102>
    34801b13:	e9 00 00 00 00       	jmpq   34801b18 <.LBB1_115>

0000000034801b18 <.LBB1_115>:
    34801b18:	8b 84 24 30 02 00 00 	mov    0x230(%rsp),%eax
    34801b1f:	83 e8 43             	sub    $0x43,%eax
    34801b22:	89 84 24 0c 02 00 00 	mov    %eax,0x20c(%rsp)
    34801b29:	0f 84 73 0b 00 00    	je     348026a2 <.LBB1_88>
    34801b2f:	e9 00 00 00 00       	jmpq   34801b34 <.LBB1_116>

0000000034801b34 <.LBB1_116>:
    34801b34:	8b 84 24 30 02 00 00 	mov    0x230(%rsp),%eax
    34801b3b:	83 c0 bb             	add    $0xffffffbb,%eax
    34801b3e:	83 e8 03             	sub    $0x3,%eax
    34801b41:	89 84 24 08 02 00 00 	mov    %eax,0x208(%rsp)
    34801b48:	0f 82 0a 0f 00 00    	jb     34802a58 <.LBB1_102>
    34801b4e:	e9 00 00 00 00       	jmpq   34801b53 <.LBB1_117>

0000000034801b53 <.LBB1_117>:
    34801b53:	8b 84 24 30 02 00 00 	mov    0x230(%rsp),%eax
    34801b5a:	83 e8 53             	sub    $0x53,%eax
    34801b5d:	8b 8c 24 54 02 00 00 	mov    0x254(%rsp),%ecx
    34801b64:	89 84 24 04 02 00 00 	mov    %eax,0x204(%rsp)
    34801b6b:	89 8c 24 00 02 00 00 	mov    %ecx,0x200(%rsp)
    34801b72:	0f 84 6c 0b 00 00    	je     348026e4 <.LBB1_89>
    34801b78:	e9 00 00 00 00       	jmpq   34801b7d <.LBB1_118>

0000000034801b7d <.LBB1_118>:
    34801b7d:	8b 84 24 30 02 00 00 	mov    0x230(%rsp),%eax
    34801b84:	83 e8 58             	sub    $0x58,%eax
    34801b87:	8b 8c 24 24 02 00 00 	mov    0x224(%rsp),%ecx
    34801b8e:	8b 94 24 54 02 00 00 	mov    0x254(%rsp),%edx
    34801b95:	8b b4 24 30 02 00 00 	mov    0x230(%rsp),%esi
    34801b9c:	89 84 24 fc 01 00 00 	mov    %eax,0x1fc(%rsp)
    34801ba3:	89 8c 24 f8 01 00 00 	mov    %ecx,0x1f8(%rsp)
    34801baa:	89 94 24 f4 01 00 00 	mov    %edx,0x1f4(%rsp)
    34801bb1:	89 b4 24 f0 01 00 00 	mov    %esi,0x1f0(%rsp)
    34801bb8:	0f 84 d3 04 00 00    	je     34802091 <.LBB1_73>
    34801bbe:	e9 00 00 00 00       	jmpq   34801bc3 <.LBB1_119>

0000000034801bc3 <.LBB1_119>:
    34801bc3:	8b 84 24 30 02 00 00 	mov    0x230(%rsp),%eax
    34801bca:	83 e8 61             	sub    $0x61,%eax
    34801bcd:	89 84 24 ec 01 00 00 	mov    %eax,0x1ec(%rsp)
    34801bd4:	0f 84 7e 0e 00 00    	je     34802a58 <.LBB1_102>
    34801bda:	e9 00 00 00 00       	jmpq   34801bdf <.LBB1_120>

0000000034801bdf <.LBB1_120>:
    34801bdf:	8b 84 24 30 02 00 00 	mov    0x230(%rsp),%eax
    34801be6:	83 e8 63             	sub    $0x63,%eax
    34801be9:	89 84 24 e8 01 00 00 	mov    %eax,0x1e8(%rsp)
    34801bf0:	0f 84 54 09 00 00    	je     3480254a <.LBB1_84>
    34801bf6:	e9 00 00 00 00       	jmpq   34801bfb <.LBB1_121>

0000000034801bfb <.LBB1_121>:
    34801bfb:	8b 84 24 30 02 00 00 	mov    0x230(%rsp),%eax
    34801c02:	83 e8 64             	sub    $0x64,%eax
    34801c05:	89 84 24 e4 01 00 00 	mov    %eax,0x1e4(%rsp)
    34801c0c:	0f 84 8d 06 00 00    	je     3480229f <.LBB1_77>
    34801c12:	e9 00 00 00 00       	jmpq   34801c17 <.LBB1_122>

0000000034801c17 <.LBB1_122>:
    34801c17:	8b 84 24 30 02 00 00 	mov    0x230(%rsp),%eax
    34801c1e:	83 c0 9b             	add    $0xffffff9b,%eax
    34801c21:	83 e8 03             	sub    $0x3,%eax
    34801c24:	89 84 24 e0 01 00 00 	mov    %eax,0x1e0(%rsp)
    34801c2b:	0f 82 27 0e 00 00    	jb     34802a58 <.LBB1_102>
    34801c31:	e9 00 00 00 00       	jmpq   34801c36 <.LBB1_123>

0000000034801c36 <.LBB1_123>:
    34801c36:	8b 84 24 30 02 00 00 	mov    0x230(%rsp),%eax
    34801c3d:	83 e8 69             	sub    $0x69,%eax
    34801c40:	89 84 24 dc 01 00 00 	mov    %eax,0x1dc(%rsp)
    34801c47:	0f 84 52 06 00 00    	je     3480229f <.LBB1_77>
    34801c4d:	e9 00 00 00 00       	jmpq   34801c52 <.LBB1_124>

0000000034801c52 <.LBB1_124>:
    34801c52:	8b 84 24 30 02 00 00 	mov    0x230(%rsp),%eax
    34801c59:	83 e8 6d             	sub    $0x6d,%eax
    34801c5c:	89 84 24 d8 01 00 00 	mov    %eax,0x1d8(%rsp)
    34801c63:	0f 84 4e 09 00 00    	je     348025b7 <.LBB1_85>
    34801c69:	e9 00 00 00 00       	jmpq   34801c6e <.LBB1_125>

0000000034801c6e <.LBB1_125>:
    34801c6e:	8b 84 24 30 02 00 00 	mov    0x230(%rsp),%eax
    34801c75:	83 e8 6e             	sub    $0x6e,%eax
    34801c78:	89 84 24 d4 01 00 00 	mov    %eax,0x1d4(%rsp)
    34801c7f:	0f 84 37 01 00 00    	je     34801dbc <.LBB1_64>
    34801c85:	e9 00 00 00 00       	jmpq   34801c8a <.LBB1_126>

0000000034801c8a <.LBB1_126>:
    34801c8a:	8b 84 24 30 02 00 00 	mov    0x230(%rsp),%eax
    34801c91:	83 e8 6f             	sub    $0x6f,%eax
    34801c94:	89 84 24 d0 01 00 00 	mov    %eax,0x1d0(%rsp)
    34801c9b:	0f 84 1a 05 00 00    	je     348021bb <.LBB1_75>
    34801ca1:	e9 00 00 00 00       	jmpq   34801ca6 <.LBB1_127>

0000000034801ca6 <.LBB1_127>:
    34801ca6:	8b 84 24 30 02 00 00 	mov    0x230(%rsp),%eax
    34801cad:	83 e8 70             	sub    $0x70,%eax
    34801cb0:	89 84 24 cc 01 00 00 	mov    %eax,0x1cc(%rsp)
    34801cb7:	0f 84 92 03 00 00    	je     3480204f <.LBB1_72>
    34801cbd:	e9 00 00 00 00       	jmpq   34801cc2 <.LBB1_128>

0000000034801cc2 <.LBB1_128>:
    34801cc2:	8b 84 24 30 02 00 00 	mov    0x230(%rsp),%eax
    34801cc9:	83 e8 73             	sub    $0x73,%eax
    34801ccc:	89 84 24 c8 01 00 00 	mov    %eax,0x1c8(%rsp)
    34801cd3:	0f 84 f7 08 00 00    	je     348025d0 <.LBB1_86>
    34801cd9:	e9 00 00 00 00       	jmpq   34801cde <.LBB1_129>

0000000034801cde <.LBB1_129>:
    34801cde:	8b 84 24 30 02 00 00 	mov    0x230(%rsp),%eax
    34801ce5:	83 e8 75             	sub    $0x75,%eax
    34801ce8:	48 8b 8c 24 18 02 00 	mov    0x218(%rsp),%rcx
    34801cef:	00 
    34801cf0:	8b 94 24 14 02 00 00 	mov    0x214(%rsp),%edx
    34801cf7:	89 84 24 c4 01 00 00 	mov    %eax,0x1c4(%rsp)
    34801cfe:	48 89 8c 24 b8 01 00 	mov    %rcx,0x1b8(%rsp)
    34801d05:	00 
    34801d06:	89 94 24 b4 01 00 00 	mov    %edx,0x1b4(%rsp)
    34801d0d:	0f 84 4f 06 00 00    	je     34802362 <.LBB1_81>
    34801d13:	e9 00 00 00 00       	jmpq   34801d18 <.LBB1_130>

0000000034801d18 <.LBB1_130>:
    34801d18:	8b 84 24 30 02 00 00 	mov    0x230(%rsp),%eax
    34801d1f:	83 e8 78             	sub    $0x78,%eax
    34801d22:	8b 8c 24 24 02 00 00 	mov    0x224(%rsp),%ecx
    34801d29:	8b 94 24 54 02 00 00 	mov    0x254(%rsp),%edx
    34801d30:	8b b4 24 30 02 00 00 	mov    0x230(%rsp),%esi
    34801d37:	48 8b bc 24 50 03 00 	mov    0x350(%rsp),%rdi
    34801d3e:	00 
    34801d3f:	4c 8b 84 24 28 04 00 	mov    0x428(%rsp),%r8
    34801d46:	00 
    34801d47:	44 8b 8c 24 24 02 00 	mov    0x224(%rsp),%r9d
    34801d4e:	00 
    34801d4f:	44 8b 94 24 54 02 00 	mov    0x254(%rsp),%r10d
    34801d56:	00 
    34801d57:	4c 8b 9c 24 18 02 00 	mov    0x218(%rsp),%r11
    34801d5e:	00 
    34801d5f:	8b 9c 24 14 02 00 00 	mov    0x214(%rsp),%ebx
    34801d66:	89 84 24 b0 01 00 00 	mov    %eax,0x1b0(%rsp)
    34801d6d:	89 8c 24 f8 01 00 00 	mov    %ecx,0x1f8(%rsp)
    34801d74:	89 94 24 f4 01 00 00 	mov    %edx,0x1f4(%rsp)
    34801d7b:	89 b4 24 f0 01 00 00 	mov    %esi,0x1f0(%rsp)
    34801d82:	48 89 bc 24 a8 01 00 	mov    %rdi,0x1a8(%rsp)
    34801d89:	00 
    34801d8a:	4c 89 84 24 a0 01 00 	mov    %r8,0x1a0(%rsp)
    34801d91:	00 
    34801d92:	44 89 8c 24 9c 01 00 	mov    %r9d,0x19c(%rsp)
    34801d99:	00 
    34801d9a:	44 89 94 24 98 01 00 	mov    %r10d,0x198(%rsp)
    34801da1:	00 
    34801da2:	4c 89 9c 24 90 01 00 	mov    %r11,0x190(%rsp)
    34801da9:	00 
    34801daa:	89 9c 24 8c 01 00 00 	mov    %ebx,0x18c(%rsp)
    34801db1:	0f 84 da 02 00 00    	je     34802091 <.LBB1_73>
    34801db7:	e9 fd 0c 00 00       	jmpq   34802ab9 <.LBB1_103>

0000000034801dbc <.LBB1_64>:
    34801dbc:	8b 84 24 4c 02 00 00 	mov    0x24c(%rsp),%eax
    34801dc3:	88 c1                	mov    %al,%cl
    34801dc5:	84 c9                	test   %cl,%cl
    34801dc7:	88 8c 24 8b 01 00 00 	mov    %cl,0x18b(%rsp)
    34801dce:	0f 84 d1 00 00 00    	je     34801ea5 <.LBB1_65>
    34801dd4:	e9 00 00 00 00       	jmpq   34801dd9 <.LBB1_131>

0000000034801dd9 <.LBB1_131>:
    34801dd9:	8a 84 24 8b 01 00 00 	mov    0x18b(%rsp),%al
    34801de0:	2c 01                	sub    $0x1,%al
    34801de2:	88 84 24 8a 01 00 00 	mov    %al,0x18a(%rsp)
    34801de9:	0f 84 ef 00 00 00    	je     34801ede <.LBB1_66>
    34801def:	e9 00 00 00 00       	jmpq   34801df4 <.LBB1_132>

0000000034801df4 <.LBB1_132>:
    34801df4:	8a 84 24 8b 01 00 00 	mov    0x18b(%rsp),%al
    34801dfb:	2c 02                	sub    $0x2,%al
    34801dfd:	88 84 24 89 01 00 00 	mov    %al,0x189(%rsp)
    34801e04:	0f 84 11 01 00 00    	je     34801f1b <.LBB1_67>
    34801e0a:	e9 00 00 00 00       	jmpq   34801e0f <.LBB1_133>

0000000034801e0f <.LBB1_133>:
    34801e0f:	8a 84 24 8b 01 00 00 	mov    0x18b(%rsp),%al
    34801e16:	2c 03                	sub    $0x3,%al
    34801e18:	88 84 24 88 01 00 00 	mov    %al,0x188(%rsp)
    34801e1f:	0f 84 33 01 00 00    	je     34801f58 <.LBB1_68>
    34801e25:	e9 00 00 00 00       	jmpq   34801e2a <.LBB1_134>

0000000034801e2a <.LBB1_134>:
    34801e2a:	8a 84 24 8b 01 00 00 	mov    0x18b(%rsp),%al
    34801e31:	2c 04                	sub    $0x4,%al
    34801e33:	88 84 24 87 01 00 00 	mov    %al,0x187(%rsp)
    34801e3a:	0f 84 55 01 00 00    	je     34801f95 <.LBB1_69>
    34801e40:	e9 00 00 00 00       	jmpq   34801e45 <.LBB1_135>

0000000034801e45 <.LBB1_135>:
    34801e45:	8a 84 24 8b 01 00 00 	mov    0x18b(%rsp),%al
    34801e4c:	2c 06                	sub    $0x6,%al
    34801e4e:	88 84 24 86 01 00 00 	mov    %al,0x186(%rsp)
    34801e55:	0f 84 7a 01 00 00    	je     34801fd5 <.LBB1_70>
    34801e5b:	e9 00 00 00 00       	jmpq   34801e60 <.LBB1_136>

0000000034801e60 <.LBB1_136>:
    34801e60:	8a 84 24 8b 01 00 00 	mov    0x18b(%rsp),%al
    34801e67:	2c 07                	sub    $0x7,%al
    34801e69:	8b 8c 24 80 02 00 00 	mov    0x280(%rsp),%ecx
    34801e70:	8b 94 24 5c 03 00 00 	mov    0x35c(%rsp),%edx
    34801e77:	8b b4 24 1c 03 00 00 	mov    0x31c(%rsp),%esi
    34801e7e:	88 84 24 85 01 00 00 	mov    %al,0x185(%rsp)
    34801e85:	89 8c 24 d0 03 00 00 	mov    %ecx,0x3d0(%rsp)
    34801e8c:	89 94 24 cc 03 00 00 	mov    %edx,0x3cc(%rsp)
    34801e93:	89 b4 24 9c 03 00 00 	mov    %esi,0x39c(%rsp)
    34801e9a:	0f 84 72 01 00 00    	je     34802012 <.LBB1_71>
    34801ea0:	e9 c5 f1 ff ff       	jmpq   3480106a <.LBB1_1>

0000000034801ea5 <.LBB1_65>:
    34801ea5:	48 8b 84 24 90 04 00 	mov    0x490(%rsp),%rax
    34801eac:	00 
    34801ead:	8b 8c 24 5c 03 00 00 	mov    0x35c(%rsp),%ecx
    34801eb4:	89 08                	mov    %ecx,(%rax)
    34801eb6:	8b 94 24 80 02 00 00 	mov    0x280(%rsp),%edx
    34801ebd:	8b b4 24 1c 03 00 00 	mov    0x31c(%rsp),%esi
    34801ec4:	89 8c 24 cc 03 00 00 	mov    %ecx,0x3cc(%rsp)
    34801ecb:	89 94 24 d0 03 00 00 	mov    %edx,0x3d0(%rsp)
    34801ed2:	89 b4 24 9c 03 00 00 	mov    %esi,0x39c(%rsp)
    34801ed9:	e9 8c f1 ff ff       	jmpq   3480106a <.LBB1_1>

0000000034801ede <.LBB1_66>:
    34801ede:	8b 84 24 5c 03 00 00 	mov    0x35c(%rsp),%eax
    34801ee5:	48 63 c8             	movslq %eax,%rcx
    34801ee8:	48 8b 94 24 90 04 00 	mov    0x490(%rsp),%rdx
    34801eef:	00 
    34801ef0:	48 89 0a             	mov    %rcx,(%rdx)
    34801ef3:	8b b4 24 80 02 00 00 	mov    0x280(%rsp),%esi
    34801efa:	8b bc 24 1c 03 00 00 	mov    0x31c(%rsp),%edi
    34801f01:	89 84 24 cc 03 00 00 	mov    %eax,0x3cc(%rsp)
    34801f08:	89 b4 24 d0 03 00 00 	mov    %esi,0x3d0(%rsp)
    34801f0f:	89 bc 24 9c 03 00 00 	mov    %edi,0x39c(%rsp)
    34801f16:	e9 4f f1 ff ff       	jmpq   3480106a <.LBB1_1>

0000000034801f1b <.LBB1_67>:
    34801f1b:	8b 84 24 5c 03 00 00 	mov    0x35c(%rsp),%eax
    34801f22:	48 63 c8             	movslq %eax,%rcx
    34801f25:	48 8b 94 24 90 04 00 	mov    0x490(%rsp),%rdx
    34801f2c:	00 
    34801f2d:	48 89 0a             	mov    %rcx,(%rdx)
    34801f30:	8b b4 24 80 02 00 00 	mov    0x280(%rsp),%esi
    34801f37:	8b bc 24 1c 03 00 00 	mov    0x31c(%rsp),%edi
    34801f3e:	89 84 24 cc 03 00 00 	mov    %eax,0x3cc(%rsp)
    34801f45:	89 b4 24 d0 03 00 00 	mov    %esi,0x3d0(%rsp)
    34801f4c:	89 bc 24 9c 03 00 00 	mov    %edi,0x39c(%rsp)
    34801f53:	e9 12 f1 ff ff       	jmpq   3480106a <.LBB1_1>

0000000034801f58 <.LBB1_68>:
    34801f58:	8b 84 24 5c 03 00 00 	mov    0x35c(%rsp),%eax
    34801f5f:	66 89 c1             	mov    %ax,%cx
    34801f62:	48 8b 94 24 90 04 00 	mov    0x490(%rsp),%rdx
    34801f69:	00 
    34801f6a:	66 89 0a             	mov    %cx,(%rdx)
    34801f6d:	8b b4 24 80 02 00 00 	mov    0x280(%rsp),%esi
    34801f74:	8b bc 24 1c 03 00 00 	mov    0x31c(%rsp),%edi
    34801f7b:	89 84 24 cc 03 00 00 	mov    %eax,0x3cc(%rsp)
    34801f82:	89 b4 24 d0 03 00 00 	mov    %esi,0x3d0(%rsp)
    34801f89:	89 bc 24 9c 03 00 00 	mov    %edi,0x39c(%rsp)
    34801f90:	e9 d5 f0 ff ff       	jmpq   3480106a <.LBB1_1>

0000000034801f95 <.LBB1_69>:
    34801f95:	8b 84 24 5c 03 00 00 	mov    0x35c(%rsp),%eax
    34801f9c:	88 c1                	mov    %al,%cl
    34801f9e:	48 8b 94 24 20 04 00 	mov    0x420(%rsp),%rdx
    34801fa5:	00 
    34801fa6:	48 8b 32             	mov    (%rdx),%rsi
    34801fa9:	88 0e                	mov    %cl,(%rsi)
    34801fab:	8b bc 24 80 02 00 00 	mov    0x280(%rsp),%edi
    34801fb2:	44 8b 84 24 1c 03 00 	mov    0x31c(%rsp),%r8d
    34801fb9:	00 
    34801fba:	89 84 24 cc 03 00 00 	mov    %eax,0x3cc(%rsp)
    34801fc1:	89 bc 24 d0 03 00 00 	mov    %edi,0x3d0(%rsp)
    34801fc8:	44 89 84 24 9c 03 00 	mov    %r8d,0x39c(%rsp)
    34801fcf:	00 
    34801fd0:	e9 95 f0 ff ff       	jmpq   3480106a <.LBB1_1>

0000000034801fd5 <.LBB1_70>:
    34801fd5:	8b 84 24 5c 03 00 00 	mov    0x35c(%rsp),%eax
    34801fdc:	48 63 c8             	movslq %eax,%rcx
    34801fdf:	48 8b 94 24 90 04 00 	mov    0x490(%rsp),%rdx
    34801fe6:	00 
    34801fe7:	48 89 0a             	mov    %rcx,(%rdx)
    34801fea:	8b b4 24 80 02 00 00 	mov    0x280(%rsp),%esi
    34801ff1:	8b bc 24 1c 03 00 00 	mov    0x31c(%rsp),%edi
    34801ff8:	89 84 24 cc 03 00 00 	mov    %eax,0x3cc(%rsp)
    34801fff:	89 b4 24 d0 03 00 00 	mov    %esi,0x3d0(%rsp)
    34802006:	89 bc 24 9c 03 00 00 	mov    %edi,0x39c(%rsp)
    3480200d:	e9 58 f0 ff ff       	jmpq   3480106a <.LBB1_1>

0000000034802012 <.LBB1_71>:
    34802012:	8b 84 24 5c 03 00 00 	mov    0x35c(%rsp),%eax
    34802019:	48 63 c8             	movslq %eax,%rcx
    3480201c:	48 8b 94 24 90 04 00 	mov    0x490(%rsp),%rdx
    34802023:	00 
    34802024:	48 89 0a             	mov    %rcx,(%rdx)
    34802027:	8b b4 24 80 02 00 00 	mov    0x280(%rsp),%esi
    3480202e:	8b bc 24 1c 03 00 00 	mov    0x31c(%rsp),%edi
    34802035:	89 84 24 cc 03 00 00 	mov    %eax,0x3cc(%rsp)
    3480203c:	89 b4 24 d0 03 00 00 	mov    %esi,0x3d0(%rsp)
    34802043:	89 bc 24 9c 03 00 00 	mov    %edi,0x39c(%rsp)
    3480204a:	e9 1b f0 ff ff       	jmpq   3480106a <.LBB1_1>

000000003480204f <.LBB1_72>:
    3480204f:	b8 78 00 00 00       	mov    $0x78,%eax
    34802054:	b9 10 00 00 00       	mov    $0x10,%ecx
    34802059:	89 ca                	mov    %ecx,%edx
    3480205b:	8b 8c 24 54 02 00 00 	mov    0x254(%rsp),%ecx
    34802062:	48 63 f1             	movslq %ecx,%rsi
    34802065:	48 83 fe 10          	cmp    $0x10,%rsi
    34802069:	48 0f 47 d6          	cmova  %rsi,%rdx
    3480206d:	89 d7                	mov    %edx,%edi
    3480206f:	44 8b 84 24 24 02 00 	mov    0x224(%rsp),%r8d
    34802076:	00 
    34802077:	41 83 c8 08          	or     $0x8,%r8d
    3480207b:	89 bc 24 f4 01 00 00 	mov    %edi,0x1f4(%rsp)
    34802082:	44 89 84 24 f8 01 00 	mov    %r8d,0x1f8(%rsp)
    34802089:	00 
    3480208a:	89 84 24 f0 01 00 00 	mov    %eax,0x1f0(%rsp)

0000000034802091 <.LBB1_73>:
    34802091:	8b 84 24 f0 01 00 00 	mov    0x1f0(%rsp),%eax
    34802098:	8b 8c 24 f4 01 00 00 	mov    0x1f4(%rsp),%ecx
    3480209f:	8b 94 24 f8 01 00 00 	mov    0x1f8(%rsp),%edx
    348020a6:	48 8b b4 24 18 04 00 	mov    0x418(%rsp),%rsi
    348020ad:	00 
    348020ae:	48 8b 3e             	mov    (%rsi),%rdi
    348020b1:	41 89 c0             	mov    %eax,%r8d
    348020b4:	41 83 e0 20          	and    $0x20,%r8d
    348020b8:	48 8b b4 24 28 04 00 	mov    0x428(%rsp),%rsi
    348020bf:	00 
    348020c0:	89 94 24 80 01 00 00 	mov    %edx,0x180(%rsp)
    348020c7:	44 89 c2             	mov    %r8d,%edx
    348020ca:	89 84 24 7c 01 00 00 	mov    %eax,0x17c(%rsp)
    348020d1:	89 8c 24 78 01 00 00 	mov    %ecx,0x178(%rsp)
    348020d8:	e8 03 13 00 00       	callq  348033e0 <fmt_x>
    348020dd:	48 be 60 67 80 34 00 	movabs $0x34806760,%rsi
    348020e4:	00 00 00 
    348020e7:	31 c9                	xor    %ecx,%ecx
    348020e9:	48 8b bc 24 18 04 00 	mov    0x418(%rsp),%rdi
    348020f0:	00 
    348020f1:	48 83 3f 00          	cmpq   $0x0,(%rdi)
    348020f5:	41 0f 95 c1          	setne  %r9b
    348020f9:	8b 94 24 80 01 00 00 	mov    0x180(%rsp),%edx
    34802100:	83 e2 08             	and    $0x8,%edx
    34802103:	83 fa 00             	cmp    $0x0,%edx
    34802106:	41 0f 95 c2          	setne  %r10b
    3480210a:	45 20 d1             	and    %r10b,%r9b
    3480210d:	41 f6 c1 01          	test   $0x1,%r9b
    34802111:	49 89 c3             	mov    %rax,%r11
    34802114:	8b 94 24 80 01 00 00 	mov    0x180(%rsp),%edx
    3480211b:	44 8b 84 24 78 01 00 	mov    0x178(%rsp),%r8d
    34802122:	00 
    34802123:	48 89 84 24 70 01 00 	mov    %rax,0x170(%rsp)
    3480212a:	00 
    3480212b:	44 89 84 24 6c 01 00 	mov    %r8d,0x16c(%rsp)
    34802132:	00 
    34802133:	48 89 b4 24 60 01 00 	mov    %rsi,0x160(%rsp)
    3480213a:	00 
    3480213b:	4c 89 9c 24 58 01 00 	mov    %r11,0x158(%rsp)
    34802142:	00 
    34802143:	89 94 24 54 01 00 00 	mov    %edx,0x154(%rsp)
    3480214a:	89 8c 24 50 01 00 00 	mov    %ecx,0x150(%rsp)
    34802151:	0f 85 05 00 00 00    	jne    3480215c <.LBB1_74>
    34802157:	e9 84 02 00 00       	jmpq   348023e0 <.LBB1_82>

000000003480215c <.LBB1_74>:
    3480215c:	b8 02 00 00 00       	mov    $0x2,%eax
    34802161:	48 b9 60 67 80 34 00 	movabs $0x34806760,%rcx
    34802168:	00 00 00 
    3480216b:	8b 94 24 7c 01 00 00 	mov    0x17c(%rsp),%edx
    34802172:	c1 fa 04             	sar    $0x4,%edx
    34802175:	48 63 f2             	movslq %edx,%rsi
    34802178:	48 01 f1             	add    %rsi,%rcx
    3480217b:	48 8b b4 24 70 01 00 	mov    0x170(%rsp),%rsi
    34802182:	00 
    34802183:	8b 94 24 80 01 00 00 	mov    0x180(%rsp),%edx
    3480218a:	8b bc 24 78 01 00 00 	mov    0x178(%rsp),%edi
    34802191:	48 89 8c 24 60 01 00 	mov    %rcx,0x160(%rsp)
    34802198:	00 
    34802199:	89 bc 24 6c 01 00 00 	mov    %edi,0x16c(%rsp)
    348021a0:	48 89 b4 24 58 01 00 	mov    %rsi,0x158(%rsp)
    348021a7:	00 
    348021a8:	89 94 24 54 01 00 00 	mov    %edx,0x154(%rsp)
    348021af:	89 84 24 50 01 00 00 	mov    %eax,0x150(%rsp)
    348021b6:	e9 25 02 00 00       	jmpq   348023e0 <.LBB1_82>

00000000348021bb <.LBB1_75>:
    348021bb:	48 8b 84 24 08 04 00 	mov    0x408(%rsp),%rax
    348021c2:	00 
    348021c3:	48 8b 38             	mov    (%rax),%rdi
    348021c6:	48 8b b4 24 28 04 00 	mov    0x428(%rsp),%rsi
    348021cd:	00 
    348021ce:	e8 8d 12 00 00       	callq  34803460 <fmt_o>
    348021d3:	48 be 60 67 80 34 00 	movabs $0x34806760,%rsi
    348021da:	00 00 00 
    348021dd:	31 c9                	xor    %ecx,%ecx
    348021df:	8b 94 24 24 02 00 00 	mov    0x224(%rsp),%edx
    348021e6:	83 e2 08             	and    $0x8,%edx
    348021e9:	83 fa 00             	cmp    $0x0,%edx
    348021ec:	48 89 c7             	mov    %rax,%rdi
    348021ef:	8b 94 24 24 02 00 00 	mov    0x224(%rsp),%edx
    348021f6:	44 8b 84 24 54 02 00 	mov    0x254(%rsp),%r8d
    348021fd:	00 
    348021fe:	48 89 84 24 48 01 00 	mov    %rax,0x148(%rsp)
    34802205:	00 
    34802206:	44 89 84 24 6c 01 00 	mov    %r8d,0x16c(%rsp)
    3480220d:	00 
    3480220e:	48 89 b4 24 60 01 00 	mov    %rsi,0x160(%rsp)
    34802215:	00 
    34802216:	48 89 bc 24 58 01 00 	mov    %rdi,0x158(%rsp)
    3480221d:	00 
    3480221e:	89 94 24 54 01 00 00 	mov    %edx,0x154(%rsp)
    34802225:	89 8c 24 50 01 00 00 	mov    %ecx,0x150(%rsp)
    3480222c:	0f 84 ae 01 00 00    	je     348023e0 <.LBB1_82>
    34802232:	48 b8 60 67 80 34 00 	movabs $0x34806760,%rax
    34802239:	00 00 00 
    3480223c:	31 c9                	xor    %ecx,%ecx
    3480223e:	8b 94 24 54 02 00 00 	mov    0x254(%rsp),%edx
    34802245:	48 63 f2             	movslq %edx,%rsi
    34802248:	48 8b bc 24 28 04 00 	mov    0x428(%rsp),%rdi
    3480224f:	00 
    34802250:	4c 8b 84 24 48 01 00 	mov    0x148(%rsp),%r8
    34802257:	00 
    34802258:	4c 29 c7             	sub    %r8,%rdi
    3480225b:	49 89 f9             	mov    %rdi,%r9
    3480225e:	49 83 c1 01          	add    $0x1,%r9
    34802262:	45 89 ca             	mov    %r9d,%r10d
    34802265:	48 39 f7             	cmp    %rsi,%rdi
    34802268:	41 0f 4d d2          	cmovge %r10d,%edx
    3480226c:	44 8b 94 24 24 02 00 	mov    0x224(%rsp),%r10d
    34802273:	00 
    34802274:	89 94 24 6c 01 00 00 	mov    %edx,0x16c(%rsp)
    3480227b:	48 89 84 24 60 01 00 	mov    %rax,0x160(%rsp)
    34802282:	00 
    34802283:	44 89 94 24 54 01 00 	mov    %r10d,0x154(%rsp)
    3480228a:	00 
    3480228b:	4c 89 84 24 58 01 00 	mov    %r8,0x158(%rsp)
    34802292:	00 
    34802293:	89 8c 24 50 01 00 00 	mov    %ecx,0x150(%rsp)
    3480229a:	e9 41 01 00 00       	jmpq   348023e0 <.LBB1_82>

000000003480229f <.LBB1_77>:
    3480229f:	48 8b 84 24 00 04 00 	mov    0x400(%rsp),%rax
    348022a6:	00 
    348022a7:	48 8b 08             	mov    (%rax),%rcx
    348022aa:	48 83 f9 00          	cmp    $0x0,%rcx
    348022ae:	48 89 8c 24 40 01 00 	mov    %rcx,0x140(%rsp)
    348022b5:	00 
    348022b6:	0f 8d 3d 00 00 00    	jge    348022f9 <.LBB1_79>
    348022bc:	48 b8 60 67 80 34 00 	movabs $0x34806760,%rax
    348022c3:	00 00 00 
    348022c6:	b9 01 00 00 00       	mov    $0x1,%ecx
    348022cb:	31 d2                	xor    %edx,%edx
    348022cd:	89 d6                	mov    %edx,%esi
    348022cf:	48 8b bc 24 40 01 00 	mov    0x140(%rsp),%rdi
    348022d6:	00 
    348022d7:	48 29 fe             	sub    %rdi,%rsi
    348022da:	4c 8b 84 24 00 04 00 	mov    0x400(%rsp),%r8
    348022e1:	00 
    348022e2:	49 89 30             	mov    %rsi,(%r8)
    348022e5:	48 89 84 24 b8 01 00 	mov    %rax,0x1b8(%rsp)
    348022ec:	00 
    348022ed:	89 8c 24 b4 01 00 00 	mov    %ecx,0x1b4(%rsp)
    348022f4:	e9 69 00 00 00       	jmpq   34802362 <.LBB1_81>

00000000348022f9 <.LBB1_79>:
    348022f9:	48 b8 60 67 80 34 00 	movabs $0x34806760,%rax
    34802300:	00 00 00 
    34802303:	48 83 c0 01          	add    $0x1,%rax
    34802307:	b9 01 00 00 00       	mov    $0x1,%ecx
    3480230c:	8b 94 24 24 02 00 00 	mov    0x224(%rsp),%edx
    34802313:	81 e2 00 08 00 00    	and    $0x800,%edx
    34802319:	83 fa 00             	cmp    $0x0,%edx
    3480231c:	48 89 84 24 b8 01 00 	mov    %rax,0x1b8(%rsp)
    34802323:	00 
    34802324:	89 8c 24 b4 01 00 00 	mov    %ecx,0x1b4(%rsp)
    3480232b:	0f 85 31 00 00 00    	jne    34802362 <.LBB1_81>
    34802331:	48 b8 60 67 80 34 00 	movabs $0x34806760,%rax
    34802338:	00 00 00 
    3480233b:	48 89 c1             	mov    %rax,%rcx
    3480233e:	48 83 c1 02          	add    $0x2,%rcx
    34802342:	8b 94 24 24 02 00 00 	mov    0x224(%rsp),%edx
    34802349:	83 e2 01             	and    $0x1,%edx
    3480234c:	83 fa 00             	cmp    $0x0,%edx
    3480234f:	48 0f 45 c1          	cmovne %rcx,%rax
    34802353:	48 89 84 24 b8 01 00 	mov    %rax,0x1b8(%rsp)
    3480235a:	00 
    3480235b:	89 94 24 b4 01 00 00 	mov    %edx,0x1b4(%rsp)

0000000034802362 <.LBB1_81>:
    34802362:	8b 84 24 b4 01 00 00 	mov    0x1b4(%rsp),%eax
    34802369:	48 8b 8c 24 b8 01 00 	mov    0x1b8(%rsp),%rcx
    34802370:	00 
    34802371:	48 8b 94 24 f8 03 00 	mov    0x3f8(%rsp),%rdx
    34802378:	00 
    34802379:	48 8b 3a             	mov    (%rdx),%rdi
    3480237c:	48 8b b4 24 28 04 00 	mov    0x428(%rsp),%rsi
    34802383:	00 
    34802384:	89 84 24 3c 01 00 00 	mov    %eax,0x13c(%rsp)
    3480238b:	48 89 8c 24 30 01 00 	mov    %rcx,0x130(%rsp)
    34802392:	00 
    34802393:	e8 38 11 00 00       	callq  348034d0 <fmt_u>
    34802398:	44 8b 84 24 24 02 00 	mov    0x224(%rsp),%r8d
    3480239f:	00 
    348023a0:	44 8b 8c 24 54 02 00 	mov    0x254(%rsp),%r9d
    348023a7:	00 
    348023a8:	48 8b 8c 24 30 01 00 	mov    0x130(%rsp),%rcx
    348023af:	00 
    348023b0:	44 8b 94 24 3c 01 00 	mov    0x13c(%rsp),%r10d
    348023b7:	00 
    348023b8:	48 89 84 24 58 01 00 	mov    %rax,0x158(%rsp)
    348023bf:	00 
    348023c0:	44 89 84 24 54 01 00 	mov    %r8d,0x154(%rsp)
    348023c7:	00 
    348023c8:	44 89 8c 24 6c 01 00 	mov    %r9d,0x16c(%rsp)
    348023cf:	00 
    348023d0:	48 89 8c 24 60 01 00 	mov    %rcx,0x160(%rsp)
    348023d7:	00 
    348023d8:	44 89 94 24 50 01 00 	mov    %r10d,0x150(%rsp)
    348023df:	00 

00000000348023e0 <.LBB1_82>:
    348023e0:	8b 84 24 50 01 00 00 	mov    0x150(%rsp),%eax
    348023e7:	48 8b 8c 24 60 01 00 	mov    0x160(%rsp),%rcx
    348023ee:	00 
    348023ef:	8b 94 24 6c 01 00 00 	mov    0x16c(%rsp),%edx
    348023f6:	8b b4 24 54 01 00 00 	mov    0x154(%rsp),%esi
    348023fd:	48 8b bc 24 58 01 00 	mov    0x158(%rsp),%rdi
    34802404:	00 
    34802405:	41 89 f0             	mov    %esi,%r8d
    34802408:	41 81 e0 ff ff fe ff 	and    $0xfffeffff,%r8d
    3480240f:	83 fa ff             	cmp    $0xffffffff,%edx
    34802412:	41 0f 4f f0          	cmovg  %r8d,%esi
    34802416:	4c 8b 8c 24 10 04 00 	mov    0x410(%rsp),%r9
    3480241d:	00 
    3480241e:	49 83 39 00          	cmpq   $0x0,(%r9)
    34802422:	41 0f 95 c2          	setne  %r10b
    34802426:	83 fa 00             	cmp    $0x0,%edx
    34802429:	41 0f 95 c3          	setne  %r11b
    3480242d:	45 08 d3             	or     %r10b,%r11b
    34802430:	41 f6 c3 01          	test   $0x1,%r11b
    34802434:	48 8b 9c 24 28 04 00 	mov    0x428(%rsp),%rbx
    3480243b:	00 
    3480243c:	4c 8b a4 24 28 04 00 	mov    0x428(%rsp),%r12
    34802443:	00 
    34802444:	41 89 f0             	mov    %esi,%r8d
    34802447:	41 89 d1             	mov    %edx,%r9d
    3480244a:	49 89 cb             	mov    %rcx,%r11
    3480244d:	89 84 24 2c 01 00 00 	mov    %eax,0x12c(%rsp)
    34802454:	89 84 24 8c 01 00 00 	mov    %eax,0x18c(%rsp)
    3480245b:	48 89 8c 24 20 01 00 	mov    %rcx,0x120(%rsp)
    34802462:	00 
    34802463:	89 94 24 1c 01 00 00 	mov    %edx,0x11c(%rsp)
    3480246a:	89 b4 24 18 01 00 00 	mov    %esi,0x118(%rsp)
    34802471:	48 89 bc 24 10 01 00 	mov    %rdi,0x110(%rsp)
    34802478:	00 
    34802479:	44 89 8c 24 98 01 00 	mov    %r9d,0x198(%rsp)
    34802480:	00 
    34802481:	44 88 94 24 0f 01 00 	mov    %r10b,0x10f(%rsp)
    34802488:	00 
    34802489:	48 89 9c 24 a8 01 00 	mov    %rbx,0x1a8(%rsp)
    34802490:	00 
    34802491:	4c 89 a4 24 a0 01 00 	mov    %r12,0x1a0(%rsp)
    34802498:	00 
    34802499:	44 89 84 24 9c 01 00 	mov    %r8d,0x19c(%rsp)
    348024a0:	00 
    348024a1:	4c 89 9c 24 90 01 00 	mov    %r11,0x190(%rsp)
    348024a8:	00 
    348024a9:	0f 85 05 00 00 00    	jne    348024b4 <.LBB1_83>
    348024af:	e9 05 06 00 00       	jmpq   34802ab9 <.LBB1_103>

00000000348024b4 <.LBB1_83>:
    348024b4:	8b 84 24 1c 01 00 00 	mov    0x11c(%rsp),%eax
    348024bb:	48 63 c8             	movslq %eax,%rcx
    348024be:	48 8b 94 24 28 04 00 	mov    0x428(%rsp),%rdx
    348024c5:	00 
    348024c6:	48 8b b4 24 10 01 00 	mov    0x110(%rsp),%rsi
    348024cd:	00 
    348024ce:	48 29 f2             	sub    %rsi,%rdx
    348024d1:	40 8a bc 24 0f 01 00 	mov    0x10f(%rsp),%dil
    348024d8:	00 
    348024d9:	40 80 f7 ff          	xor    $0xff,%dil
    348024dd:	40 80 e7 01          	and    $0x1,%dil
    348024e1:	44 0f b6 c7          	movzbl %dil,%r8d
    348024e5:	45 89 c1             	mov    %r8d,%r9d
    348024e8:	4c 01 ca             	add    %r9,%rdx
    348024eb:	48 39 ca             	cmp    %rcx,%rdx
    348024ee:	48 0f 4c d1          	cmovl  %rcx,%rdx
    348024f2:	41 89 d0             	mov    %edx,%r8d
    348024f5:	48 8b 8c 24 28 04 00 	mov    0x428(%rsp),%rcx
    348024fc:	00 
    348024fd:	44 8b 94 24 18 01 00 	mov    0x118(%rsp),%r10d
    34802504:	00 
    34802505:	48 8b 94 24 20 01 00 	mov    0x120(%rsp),%rdx
    3480250c:	00 
    3480250d:	44 8b 9c 24 2c 01 00 	mov    0x12c(%rsp),%r11d
    34802514:	00 
    34802515:	48 89 b4 24 a8 01 00 	mov    %rsi,0x1a8(%rsp)
    3480251c:	00 
    3480251d:	44 89 94 24 9c 01 00 	mov    %r10d,0x19c(%rsp)
    34802524:	00 
    34802525:	48 89 8c 24 a0 01 00 	mov    %rcx,0x1a0(%rsp)
    3480252c:	00 
    3480252d:	44 89 84 24 98 01 00 	mov    %r8d,0x198(%rsp)
    34802534:	00 
    34802535:	48 89 94 24 90 01 00 	mov    %rdx,0x190(%rsp)
    3480253c:	00 
    3480253d:	44 89 9c 24 8c 01 00 	mov    %r11d,0x18c(%rsp)
    34802544:	00 
    34802545:	e9 6f 05 00 00       	jmpq   34802ab9 <.LBB1_103>

000000003480254a <.LBB1_84>:
    3480254a:	b8 01 00 00 00       	mov    $0x1,%eax
    3480254f:	48 b9 60 67 80 34 00 	movabs $0x34806760,%rcx
    34802556:	00 00 00 
    34802559:	31 d2                	xor    %edx,%edx
    3480255b:	48 8b b4 24 f0 03 00 	mov    0x3f0(%rsp),%rsi
    34802562:	00 
    34802563:	48 8b 3e             	mov    (%rsi),%rdi
    34802566:	41 88 f8             	mov    %dil,%r8b
    34802569:	48 8b bc 24 70 03 00 	mov    0x370(%rsp),%rdi
    34802570:	00 
    34802571:	44 88 07             	mov    %r8b,(%rdi)
    34802574:	4c 8b 8c 24 28 04 00 	mov    0x428(%rsp),%r9
    3480257b:	00 
    3480257c:	44 8b 94 24 28 02 00 	mov    0x228(%rsp),%r10d
    34802583:	00 
    34802584:	44 89 94 24 9c 01 00 	mov    %r10d,0x19c(%rsp)
    3480258b:	00 
    3480258c:	89 84 24 98 01 00 00 	mov    %eax,0x198(%rsp)
    34802593:	48 89 8c 24 90 01 00 	mov    %rcx,0x190(%rsp)
    3480259a:	00 
    3480259b:	48 89 bc 24 a8 01 00 	mov    %rdi,0x1a8(%rsp)
    348025a2:	00 
    348025a3:	4c 89 8c 24 a0 01 00 	mov    %r9,0x1a0(%rsp)
    348025aa:	00 
    348025ab:	89 94 24 8c 01 00 00 	mov    %edx,0x18c(%rsp)
    348025b2:	e9 02 05 00 00       	jmpq   34802ab9 <.LBB1_103>

00000000348025b7 <.LBB1_85>:
    348025b7:	e8 34 e6 ff ff       	callq  34800bf0 <__errno_location>
    348025bc:	8b 38                	mov    (%rax),%edi
    348025be:	e8 fd 37 00 00       	callq  34805dc0 <strerror>
    348025c3:	48 89 84 24 00 01 00 	mov    %rax,0x100(%rsp)
    348025ca:	00 
    348025cb:	e9 25 00 00 00       	jmpq   348025f5 <.LBB1_87>

00000000348025d0 <.LBB1_86>:
    348025d0:	48 b8 6a 67 80 34 00 	movabs $0x3480676a,%rax
    348025d7:	00 00 00 
    348025da:	48 8b 8c 24 e8 03 00 	mov    0x3e8(%rsp),%rcx
    348025e1:	00 
    348025e2:	48 8b 11             	mov    (%rcx),%rdx
    348025e5:	48 83 fa 00          	cmp    $0x0,%rdx
    348025e9:	48 0f 45 c2          	cmovne %rdx,%rax
    348025ed:	48 89 84 24 00 01 00 	mov    %rax,0x100(%rsp)
    348025f4:	00 

00000000348025f5 <.LBB1_87>:
    348025f5:	48 8b 84 24 00 01 00 	mov    0x100(%rsp),%rax
    348025fc:	00 
    348025fd:	31 f6                	xor    %esi,%esi
    348025ff:	8b 8c 24 54 02 00 00 	mov    0x254(%rsp),%ecx
    34802606:	48 63 d1             	movslq %ecx,%rdx
    34802609:	48 89 c7             	mov    %rax,%rdi
    3480260c:	48 89 94 24 f8 00 00 	mov    %rdx,0xf8(%rsp)
    34802613:	00 
    34802614:	48 89 84 24 f0 00 00 	mov    %rax,0xf0(%rsp)
    3480261b:	00 
    3480261c:	e8 7f db ff ff       	callq  348001a0 <memchr>
    34802621:	48 ba 60 67 80 34 00 	movabs $0x34806760,%rdx
    34802628:	00 00 00 
    3480262b:	31 c9                	xor    %ecx,%ecx
    3480262d:	48 89 c7             	mov    %rax,%rdi
    34802630:	4c 8b 84 24 f0 00 00 	mov    0xf0(%rsp),%r8
    34802637:	00 
    34802638:	4c 29 c7             	sub    %r8,%rdi
    3480263b:	89 fe                	mov    %edi,%esi
    3480263d:	48 8b bc 24 f8 00 00 	mov    0xf8(%rsp),%rdi
    34802644:	00 
    34802645:	49 01 f8             	add    %rdi,%r8
    34802648:	48 83 f8 00          	cmp    $0x0,%rax
    3480264c:	4c 0f 45 c0          	cmovne %rax,%r8
    34802650:	48 83 f8 00          	cmp    $0x0,%rax
    34802654:	44 8b 8c 24 54 02 00 	mov    0x254(%rsp),%r9d
    3480265b:	00 
    3480265c:	44 0f 45 ce          	cmovne %esi,%r9d
    34802660:	48 8b 84 24 f0 00 00 	mov    0xf0(%rsp),%rax
    34802667:	00 
    34802668:	8b b4 24 28 02 00 00 	mov    0x228(%rsp),%esi
    3480266f:	48 89 84 24 a8 01 00 	mov    %rax,0x1a8(%rsp)
    34802676:	00 
    34802677:	44 89 8c 24 98 01 00 	mov    %r9d,0x198(%rsp)
    3480267e:	00 
    3480267f:	48 89 94 24 90 01 00 	mov    %rdx,0x190(%rsp)
    34802686:	00 
    34802687:	89 b4 24 9c 01 00 00 	mov    %esi,0x19c(%rsp)
    3480268e:	4c 89 84 24 a0 01 00 	mov    %r8,0x1a0(%rsp)
    34802695:	00 
    34802696:	89 8c 24 8c 01 00 00 	mov    %ecx,0x18c(%rsp)
    3480269d:	e9 17 04 00 00       	jmpq   34802ab9 <.LBB1_103>

00000000348026a2 <.LBB1_88>:
    348026a2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    348026a7:	48 8d 8c 24 58 04 00 	lea    0x458(%rsp),%rcx
    348026ae:	00 
    348026af:	48 8b 94 24 e0 03 00 	mov    0x3e0(%rsp),%rdx
    348026b6:	00 
    348026b7:	48 8b 32             	mov    (%rdx),%rsi
    348026ba:	89 f7                	mov    %esi,%edi
    348026bc:	48 8b b4 24 80 03 00 	mov    0x380(%rsp),%rsi
    348026c3:	00 
    348026c4:	89 3e                	mov    %edi,(%rsi)
    348026c6:	4c 8b 84 24 d8 03 00 	mov    0x3d8(%rsp),%r8
    348026cd:	00 
    348026ce:	41 c7 00 00 00 00 00 	movl   $0x0,(%r8)
    348026d5:	48 89 8c 24 90 04 00 	mov    %rcx,0x490(%rsp)
    348026dc:	00 
    348026dd:	89 84 24 00 02 00 00 	mov    %eax,0x200(%rsp)

00000000348026e4 <.LBB1_89>:
    348026e4:	8b 84 24 00 02 00 00 	mov    0x200(%rsp),%eax
    348026eb:	31 c9                	xor    %ecx,%ecx
    348026ed:	48 8b 94 24 90 04 00 	mov    0x490(%rsp),%rdx
    348026f4:	00 
    348026f5:	89 ce                	mov    %ecx,%esi
    348026f7:	89 84 24 ec 00 00 00 	mov    %eax,0xec(%rsp)
    348026fe:	89 b4 24 e8 00 00 00 	mov    %esi,0xe8(%rsp)
    34802705:	89 8c 24 e4 00 00 00 	mov    %ecx,0xe4(%rsp)
    3480270c:	48 89 94 24 d8 00 00 	mov    %rdx,0xd8(%rsp)
    34802713:	00 

0000000034802714 <.LBB1_90>:
    34802714:	48 8b 84 24 d8 00 00 	mov    0xd8(%rsp),%rax
    3480271b:	00 
    3480271c:	8b 8c 24 e4 00 00 00 	mov    0xe4(%rsp),%ecx
    34802723:	8b 94 24 e8 00 00 00 	mov    0xe8(%rsp),%edx
    3480272a:	8b b4 24 ec 00 00 00 	mov    0xec(%rsp),%esi
    34802731:	39 ce                	cmp    %ecx,%esi
    34802733:	89 d7                	mov    %edx,%edi
    34802735:	48 89 84 24 d0 00 00 	mov    %rax,0xd0(%rsp)
    3480273c:	00 
    3480273d:	89 8c 24 cc 00 00 00 	mov    %ecx,0xcc(%rsp)
    34802744:	89 94 24 c8 00 00 00 	mov    %edx,0xc8(%rsp)
    3480274b:	89 bc 24 c4 00 00 00 	mov    %edi,0xc4(%rsp)
    34802752:	0f 86 b7 00 00 00    	jbe    3480280f <.LBB1_94>
    34802758:	48 8b 84 24 d0 00 00 	mov    0xd0(%rsp),%rax
    3480275f:	00 
    34802760:	8b 08                	mov    (%rax),%ecx
    34802762:	83 f9 00             	cmp    $0x0,%ecx
    34802765:	8b 94 24 c8 00 00 00 	mov    0xc8(%rsp),%edx
    3480276c:	89 8c 24 c0 00 00 00 	mov    %ecx,0xc0(%rsp)
    34802773:	89 94 24 c4 00 00 00 	mov    %edx,0xc4(%rsp)
    3480277a:	0f 84 8f 00 00 00    	je     3480280f <.LBB1_94>
    34802780:	48 8b bc 24 88 03 00 	mov    0x388(%rsp),%rdi
    34802787:	00 
    34802788:	8b b4 24 c0 00 00 00 	mov    0xc0(%rsp),%esi
    3480278f:	e8 5c 30 00 00       	callq  348057f0 <wctomb>
    34802794:	83 f8 ff             	cmp    $0xffffffff,%eax
    34802797:	0f 9f c1             	setg   %cl
    3480279a:	8b b4 24 ec 00 00 00 	mov    0xec(%rsp),%esi
    348027a1:	8b 94 24 cc 00 00 00 	mov    0xcc(%rsp),%edx
    348027a8:	29 d6                	sub    %edx,%esi
    348027aa:	39 f0                	cmp    %esi,%eax
    348027ac:	41 0f 96 c0          	setbe  %r8b
    348027b0:	44 20 c1             	and    %r8b,%cl
    348027b3:	f6 c1 01             	test   $0x1,%cl
    348027b6:	89 c6                	mov    %eax,%esi
    348027b8:	89 84 24 bc 00 00 00 	mov    %eax,0xbc(%rsp)
    348027bf:	89 b4 24 c4 00 00 00 	mov    %esi,0xc4(%rsp)
    348027c6:	0f 85 05 00 00 00    	jne    348027d1 <.LBB1_93>
    348027cc:	e9 3e 00 00 00       	jmpq   3480280f <.LBB1_94>

00000000348027d1 <.LBB1_93>:
    348027d1:	48 8b 84 24 d0 00 00 	mov    0xd0(%rsp),%rax
    348027d8:	00 
    348027d9:	48 83 c0 04          	add    $0x4,%rax
    348027dd:	8b 8c 24 bc 00 00 00 	mov    0xbc(%rsp),%ecx
    348027e4:	8b 94 24 cc 00 00 00 	mov    0xcc(%rsp),%edx
    348027eb:	01 d1                	add    %edx,%ecx
    348027ed:	8b b4 24 bc 00 00 00 	mov    0xbc(%rsp),%esi
    348027f4:	89 8c 24 e4 00 00 00 	mov    %ecx,0xe4(%rsp)
    348027fb:	89 b4 24 e8 00 00 00 	mov    %esi,0xe8(%rsp)
    34802802:	48 89 84 24 d8 00 00 	mov    %rax,0xd8(%rsp)
    34802809:	00 
    3480280a:	e9 05 ff ff ff       	jmpq   34802714 <.LBB1_90>

000000003480280f <.LBB1_94>:
    3480280f:	8b 84 24 c4 00 00 00 	mov    0xc4(%rsp),%eax
    34802816:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    3480281b:	83 f8 00             	cmp    $0x0,%eax
    3480281e:	89 84 24 b8 00 00 00 	mov    %eax,0xb8(%rsp)
    34802825:	89 8c 24 b4 02 00 00 	mov    %ecx,0x2b4(%rsp)
    3480282c:	0f 8c 09 05 00 00    	jl     34802d3b <.LBB1_113>
    34802832:	be 20 00 00 00       	mov    $0x20,%esi
    34802837:	48 8b bc 24 a8 03 00 	mov    0x3a8(%rsp),%rdi
    3480283e:	00 
    3480283f:	8b 94 24 88 02 00 00 	mov    0x288(%rsp),%edx
    34802846:	8b 8c 24 cc 00 00 00 	mov    0xcc(%rsp),%ecx
    3480284d:	44 8b 84 24 24 02 00 	mov    0x224(%rsp),%r8d
    34802854:	00 
    34802855:	e8 06 0d 00 00       	callq  34803560 <pad>
    3480285a:	31 c9                	xor    %ecx,%ecx
    3480285c:	48 8b bc 24 90 04 00 	mov    0x490(%rsp),%rdi
    34802863:	00 
    34802864:	8b 94 24 b8 00 00 00 	mov    0xb8(%rsp),%edx
    3480286b:	89 94 24 b4 00 00 00 	mov    %edx,0xb4(%rsp)
    34802872:	89 8c 24 b0 00 00 00 	mov    %ecx,0xb0(%rsp)
    34802879:	48 89 bc 24 a8 00 00 	mov    %rdi,0xa8(%rsp)
    34802880:	00 

0000000034802881 <.LBB1_96>:
    34802881:	48 8b 84 24 a8 00 00 	mov    0xa8(%rsp),%rax
    34802888:	00 
    34802889:	8b 8c 24 b0 00 00 00 	mov    0xb0(%rsp),%ecx
    34802890:	8b 94 24 b4 00 00 00 	mov    0xb4(%rsp),%edx
    34802897:	31 f6                	xor    %esi,%esi
    34802899:	40 88 f7             	mov    %sil,%dil
    3480289c:	8b b4 24 cc 00 00 00 	mov    0xcc(%rsp),%esi
    348028a3:	39 f1                	cmp    %esi,%ecx
    348028a5:	41 89 d0             	mov    %edx,%r8d
    348028a8:	49 89 c1             	mov    %rax,%r9
    348028ab:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
    348028b2:	00 
    348028b3:	89 8c 24 9c 00 00 00 	mov    %ecx,0x9c(%rsp)
    348028ba:	89 94 24 98 00 00 00 	mov    %edx,0x98(%rsp)
    348028c1:	4c 89 8c 24 90 00 00 	mov    %r9,0x90(%rsp)
    348028c8:	00 
    348028c9:	44 89 84 24 8c 00 00 	mov    %r8d,0x8c(%rsp)
    348028d0:	00 
    348028d1:	40 88 bc 24 8b 00 00 	mov    %dil,0x8b(%rsp)
    348028d8:	00 
    348028d9:	0f 83 94 00 00 00    	jae    34802973 <.LBB1_99>
    348028df:	31 c0                	xor    %eax,%eax
    348028e1:	88 c1                	mov    %al,%cl
    348028e3:	48 8b 94 24 a0 00 00 	mov    0xa0(%rsp),%rdx
    348028ea:	00 
    348028eb:	8b 02                	mov    (%rdx),%eax
    348028ed:	83 f8 00             	cmp    $0x0,%eax
    348028f0:	8b b4 24 98 00 00 00 	mov    0x98(%rsp),%esi
    348028f7:	89 b4 24 8c 00 00 00 	mov    %esi,0x8c(%rsp)
    348028fe:	48 89 94 24 90 00 00 	mov    %rdx,0x90(%rsp)
    34802905:	00 
    34802906:	89 84 24 84 00 00 00 	mov    %eax,0x84(%rsp)
    3480290d:	88 8c 24 8b 00 00 00 	mov    %cl,0x8b(%rsp)
    34802914:	0f 84 59 00 00 00    	je     34802973 <.LBB1_99>
    3480291a:	48 8b 84 24 a0 00 00 	mov    0xa0(%rsp),%rax
    34802921:	00 
    34802922:	48 83 c0 04          	add    $0x4,%rax
    34802926:	48 8b bc 24 88 03 00 	mov    0x388(%rsp),%rdi
    3480292d:	00 
    3480292e:	8b b4 24 84 00 00 00 	mov    0x84(%rsp),%esi
    34802935:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
    3480293a:	e8 b1 2e 00 00       	callq  348057f0 <wctomb>
    3480293f:	89 c6                	mov    %eax,%esi
    34802941:	8b 8c 24 9c 00 00 00 	mov    0x9c(%rsp),%ecx
    34802948:	01 ce                	add    %ecx,%esi
    3480294a:	8b 94 24 cc 00 00 00 	mov    0xcc(%rsp),%edx
    34802951:	39 d6                	cmp    %edx,%esi
    34802953:	41 0f 9e c0          	setle  %r8b
    34802957:	48 8b 7c 24 78       	mov    0x78(%rsp),%rdi
    3480295c:	48 89 bc 24 90 00 00 	mov    %rdi,0x90(%rsp)
    34802963:	00 
    34802964:	89 84 24 8c 00 00 00 	mov    %eax,0x8c(%rsp)
    3480296b:	44 88 84 24 8b 00 00 	mov    %r8b,0x8b(%rsp)
    34802972:	00 

0000000034802973 <.LBB1_99>:
    34802973:	8a 84 24 8b 00 00 00 	mov    0x8b(%rsp),%al
    3480297a:	48 8b 8c 24 90 00 00 	mov    0x90(%rsp),%rcx
    34802981:	00 
    34802982:	8b 94 24 8c 00 00 00 	mov    0x8c(%rsp),%edx
    34802989:	a8 01                	test   $0x1,%al
    3480298b:	89 54 24 74          	mov    %edx,0x74(%rsp)
    3480298f:	48 89 4c 24 68       	mov    %rcx,0x68(%rsp)
    34802994:	0f 85 05 00 00 00    	jne    3480299f <.LBB1_100>
    3480299a:	e9 4f 00 00 00       	jmpq   348029ee <.LBB1_101>

000000003480299f <.LBB1_100>:
    3480299f:	8b 44 24 74          	mov    0x74(%rsp),%eax
    348029a3:	48 63 d0             	movslq %eax,%rdx
    348029a6:	48 8b bc 24 a8 03 00 	mov    0x3a8(%rsp),%rdi
    348029ad:	00 
    348029ae:	48 8b b4 24 88 03 00 	mov    0x388(%rsp),%rsi
    348029b5:	00 
    348029b6:	e8 95 03 00 00       	callq  34802d50 <out>
    348029bb:	8b 44 24 74          	mov    0x74(%rsp),%eax
    348029bf:	8b 8c 24 9c 00 00 00 	mov    0x9c(%rsp),%ecx
    348029c6:	01 c8                	add    %ecx,%eax
    348029c8:	44 8b 44 24 74       	mov    0x74(%rsp),%r8d
    348029cd:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
    348029d2:	44 89 84 24 b4 00 00 	mov    %r8d,0xb4(%rsp)
    348029d9:	00 
    348029da:	89 84 24 b0 00 00 00 	mov    %eax,0xb0(%rsp)
    348029e1:	48 89 94 24 a8 00 00 	mov    %rdx,0xa8(%rsp)
    348029e8:	00 
    348029e9:	e9 93 fe ff ff       	jmpq   34802881 <.LBB1_96>

00000000348029ee <.LBB1_101>:
    348029ee:	be 20 00 00 00       	mov    $0x20,%esi
    348029f3:	8b 84 24 24 02 00 00 	mov    0x224(%rsp),%eax
    348029fa:	35 00 20 00 00       	xor    $0x2000,%eax
    348029ff:	48 8b bc 24 a8 03 00 	mov    0x3a8(%rsp),%rdi
    34802a06:	00 
    34802a07:	8b 94 24 88 02 00 00 	mov    0x288(%rsp),%edx
    34802a0e:	8b 8c 24 cc 00 00 00 	mov    0xcc(%rsp),%ecx
    34802a15:	41 89 c0             	mov    %eax,%r8d
    34802a18:	e8 43 0b 00 00       	callq  34803560 <pad>
    34802a1d:	8b 84 24 88 02 00 00 	mov    0x288(%rsp),%eax
    34802a24:	8b 8c 24 cc 00 00 00 	mov    0xcc(%rsp),%ecx
    34802a2b:	39 c8                	cmp    %ecx,%eax
    34802a2d:	0f 4f c8             	cmovg  %eax,%ecx
    34802a30:	8b 94 24 80 02 00 00 	mov    0x280(%rsp),%edx
    34802a37:	8b b4 24 5c 03 00 00 	mov    0x35c(%rsp),%esi
    34802a3e:	89 b4 24 cc 03 00 00 	mov    %esi,0x3cc(%rsp)
    34802a45:	89 94 24 d0 03 00 00 	mov    %edx,0x3d0(%rsp)
    34802a4c:	89 8c 24 9c 03 00 00 	mov    %ecx,0x39c(%rsp)
    34802a53:	e9 12 e6 ff ff       	jmpq   3480106a <.LBB1_1>

0000000034802a58 <.LBB1_102>:
    34802a58:	48 8b 84 24 90 03 00 	mov    0x390(%rsp),%rax
    34802a5f:	00 
    34802a60:	db 28                	fldt   (%rax)
    34802a62:	48 89 e1             	mov    %rsp,%rcx
    34802a65:	db 39                	fstpt  (%rcx)
    34802a67:	48 8b bc 24 a8 03 00 	mov    0x3a8(%rsp),%rdi
    34802a6e:	00 
    34802a6f:	8b b4 24 88 02 00 00 	mov    0x288(%rsp),%esi
    34802a76:	8b 94 24 54 02 00 00 	mov    0x254(%rsp),%edx
    34802a7d:	8b 8c 24 24 02 00 00 	mov    0x224(%rsp),%ecx
    34802a84:	44 8b 84 24 30 02 00 	mov    0x230(%rsp),%r8d
    34802a8b:	00 
    34802a8c:	e8 bf 0b 00 00       	callq  34803650 <fmt_fp>
    34802a91:	8b 8c 24 80 02 00 00 	mov    0x280(%rsp),%ecx
    34802a98:	8b 94 24 5c 03 00 00 	mov    0x35c(%rsp),%edx
    34802a9f:	89 94 24 cc 03 00 00 	mov    %edx,0x3cc(%rsp)
    34802aa6:	89 8c 24 d0 03 00 00 	mov    %ecx,0x3d0(%rsp)
    34802aad:	89 84 24 9c 03 00 00 	mov    %eax,0x39c(%rsp)
    34802ab4:	e9 b1 e5 ff ff       	jmpq   3480106a <.LBB1_1>

0000000034802ab9 <.LBB1_103>:
    34802ab9:	8b 84 24 8c 01 00 00 	mov    0x18c(%rsp),%eax
    34802ac0:	48 8b 8c 24 90 01 00 	mov    0x190(%rsp),%rcx
    34802ac7:	00 
    34802ac8:	8b 94 24 98 01 00 00 	mov    0x198(%rsp),%edx
    34802acf:	8b b4 24 9c 01 00 00 	mov    0x19c(%rsp),%esi
    34802ad6:	48 8b bc 24 a0 01 00 	mov    0x1a0(%rsp),%rdi
    34802add:	00 
    34802ade:	4c 8b 84 24 a8 01 00 	mov    0x1a8(%rsp),%r8
    34802ae5:	00 
    34802ae6:	41 b9 20 00 00 00    	mov    $0x20,%r9d
    34802aec:	4c 63 d2             	movslq %edx,%r10
    34802aef:	4c 29 c7             	sub    %r8,%rdi
    34802af2:	41 89 fb             	mov    %edi,%r11d
    34802af5:	4c 39 d7             	cmp    %r10,%rdi
    34802af8:	41 0f 4f d3          	cmovg  %r11d,%edx
    34802afc:	41 89 d3             	mov    %edx,%r11d
    34802aff:	41 01 c3             	add    %eax,%r11d
    34802b02:	8b 9c 24 88 02 00 00 	mov    0x288(%rsp),%ebx
    34802b09:	44 39 db             	cmp    %r11d,%ebx
    34802b0c:	41 0f 4c db          	cmovl  %r11d,%ebx
    34802b10:	4c 8b 94 24 a8 03 00 	mov    0x3a8(%rsp),%r10
    34802b17:	00 
    34802b18:	48 89 7c 24 60       	mov    %rdi,0x60(%rsp)
    34802b1d:	4c 89 d7             	mov    %r10,%rdi
    34802b20:	89 74 24 5c          	mov    %esi,0x5c(%rsp)
    34802b24:	44 89 ce             	mov    %r9d,%esi
    34802b27:	89 54 24 58          	mov    %edx,0x58(%rsp)
    34802b2b:	89 da                	mov    %ebx,%edx
    34802b2d:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
    34802b32:	44 89 d9             	mov    %r11d,%ecx
    34802b35:	44 8b 4c 24 5c       	mov    0x5c(%rsp),%r9d
    34802b3a:	4c 89 44 24 48       	mov    %r8,0x48(%rsp)
    34802b3f:	45 89 c8             	mov    %r9d,%r8d
    34802b42:	89 44 24 44          	mov    %eax,0x44(%rsp)
    34802b46:	44 89 5c 24 40       	mov    %r11d,0x40(%rsp)
    34802b4b:	89 5c 24 3c          	mov    %ebx,0x3c(%rsp)
    34802b4f:	e8 0c 0a 00 00       	callq  34803560 <pad>
    34802b54:	8b 44 24 44          	mov    0x44(%rsp),%eax
    34802b58:	48 63 d0             	movslq %eax,%rdx
    34802b5b:	48 8b bc 24 a8 03 00 	mov    0x3a8(%rsp),%rdi
    34802b62:	00 
    34802b63:	48 8b 74 24 50       	mov    0x50(%rsp),%rsi
    34802b68:	e8 e3 01 00 00       	callq  34802d50 <out>
    34802b6d:	be 30 00 00 00       	mov    $0x30,%esi
    34802b72:	8b 44 24 5c          	mov    0x5c(%rsp),%eax
    34802b76:	35 00 00 01 00       	xor    $0x10000,%eax
    34802b7b:	48 8b bc 24 a8 03 00 	mov    0x3a8(%rsp),%rdi
    34802b82:	00 
    34802b83:	8b 54 24 3c          	mov    0x3c(%rsp),%edx
    34802b87:	8b 4c 24 40          	mov    0x40(%rsp),%ecx
    34802b8b:	41 89 c0             	mov    %eax,%r8d
    34802b8e:	e8 cd 09 00 00       	callq  34803560 <pad>
    34802b93:	be 30 00 00 00       	mov    $0x30,%esi
    34802b98:	45 31 c0             	xor    %r8d,%r8d
    34802b9b:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
    34802ba0:	89 f8                	mov    %edi,%eax
    34802ba2:	48 8b bc 24 a8 03 00 	mov    0x3a8(%rsp),%rdi
    34802ba9:	00 
    34802baa:	8b 54 24 58          	mov    0x58(%rsp),%edx
    34802bae:	89 c1                	mov    %eax,%ecx
    34802bb0:	e8 ab 09 00 00       	callq  34803560 <pad>
    34802bb5:	48 8b bc 24 a8 03 00 	mov    0x3a8(%rsp),%rdi
    34802bbc:	00 
    34802bbd:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
    34802bc2:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
    34802bc7:	e8 84 01 00 00       	callq  34802d50 <out>
    34802bcc:	be 20 00 00 00       	mov    $0x20,%esi
    34802bd1:	8b 44 24 5c          	mov    0x5c(%rsp),%eax
    34802bd5:	35 00 20 00 00       	xor    $0x2000,%eax
    34802bda:	48 8b bc 24 a8 03 00 	mov    0x3a8(%rsp),%rdi
    34802be1:	00 
    34802be2:	8b 54 24 3c          	mov    0x3c(%rsp),%edx
    34802be6:	8b 4c 24 40          	mov    0x40(%rsp),%ecx
    34802bea:	41 89 c0             	mov    %eax,%r8d
    34802bed:	e8 6e 09 00 00       	callq  34803560 <pad>
    34802bf2:	8b 84 24 80 02 00 00 	mov    0x280(%rsp),%eax
    34802bf9:	8b 8c 24 5c 03 00 00 	mov    0x35c(%rsp),%ecx
    34802c00:	8b 54 24 3c          	mov    0x3c(%rsp),%edx
    34802c04:	89 84 24 d0 03 00 00 	mov    %eax,0x3d0(%rsp)
    34802c0b:	89 8c 24 cc 03 00 00 	mov    %ecx,0x3cc(%rsp)
    34802c12:	89 94 24 9c 03 00 00 	mov    %edx,0x39c(%rsp)
    34802c19:	e9 4c e4 ff ff       	jmpq   3480106a <.LBB1_1>

0000000034802c1e <.LBB1_104>:
    34802c1e:	48 8b 84 24 a8 03 00 	mov    0x3a8(%rsp),%rax
    34802c25:	00 
    34802c26:	48 83 f8 00          	cmp    $0x0,%rax
    34802c2a:	8b 8c 24 5c 03 00 00 	mov    0x35c(%rsp),%ecx
    34802c31:	89 8c 24 b4 02 00 00 	mov    %ecx,0x2b4(%rsp)
    34802c38:	0f 85 fd 00 00 00    	jne    34802d3b <.LBB1_113>
    34802c3e:	31 c0                	xor    %eax,%eax
    34802c40:	b9 01 00 00 00       	mov    $0x1,%ecx
    34802c45:	8b 94 24 64 03 00 00 	mov    0x364(%rsp),%edx
    34802c4c:	83 fa 00             	cmp    $0x0,%edx
    34802c4f:	89 4c 24 38          	mov    %ecx,0x38(%rsp)
    34802c53:	89 84 24 b4 02 00 00 	mov    %eax,0x2b4(%rsp)
    34802c5a:	0f 84 db 00 00 00    	je     34802d3b <.LBB1_113>

0000000034802c60 <.LBB1_106>:
    34802c60:	8b 44 24 38          	mov    0x38(%rsp),%eax
    34802c64:	83 f8 0a             	cmp    $0xa,%eax
    34802c67:	89 c1                	mov    %eax,%ecx
    34802c69:	89 44 24 34          	mov    %eax,0x34(%rsp)
    34802c6d:	89 4c 24 30          	mov    %ecx,0x30(%rsp)
    34802c71:	0f 8d 60 00 00 00    	jge    34802cd7 <.LBB1_109>
    34802c77:	8b 44 24 34          	mov    0x34(%rsp),%eax
    34802c7b:	48 63 c8             	movslq %eax,%rcx
    34802c7e:	48 8b 94 24 a0 03 00 	mov    0x3a0(%rsp),%rdx
    34802c85:	00 
    34802c86:	8b 34 8a             	mov    (%rdx,%rcx,4),%esi
    34802c89:	83 fe 00             	cmp    $0x0,%esi
    34802c8c:	89 44 24 30          	mov    %eax,0x30(%rsp)
    34802c90:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
    34802c95:	89 74 24 24          	mov    %esi,0x24(%rsp)
    34802c99:	0f 84 38 00 00 00    	je     34802cd7 <.LBB1_109>
    34802c9f:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
    34802ca4:	48 c1 e0 04          	shl    $0x4,%rax
    34802ca8:	48 8b 8c 24 48 04 00 	mov    0x448(%rsp),%rcx
    34802caf:	00 
    34802cb0:	48 01 c1             	add    %rax,%rcx
    34802cb3:	48 89 cf             	mov    %rcx,%rdi
    34802cb6:	8b 74 24 24          	mov    0x24(%rsp),%esi
    34802cba:	48 8b 94 24 b8 03 00 	mov    0x3b8(%rsp),%rdx
    34802cc1:	00 
    34802cc2:	e8 39 01 00 00       	callq  34802e00 <pop_arg>
    34802cc7:	8b 74 24 34          	mov    0x34(%rsp),%esi
    34802ccb:	83 c6 01             	add    $0x1,%esi
    34802cce:	89 74 24 38          	mov    %esi,0x38(%rsp)
    34802cd2:	e9 89 ff ff ff       	jmpq   34802c60 <.LBB1_106>

0000000034802cd7 <.LBB1_109>:
    34802cd7:	8b 44 24 30          	mov    0x30(%rsp),%eax
    34802cdb:	83 f8 0a             	cmp    $0xa,%eax
    34802cde:	0f 9c c1             	setl   %cl
    34802ce1:	f6 c1 01             	test   $0x1,%cl
    34802ce4:	89 44 24 20          	mov    %eax,0x20(%rsp)
    34802ce8:	88 4c 24 1f          	mov    %cl,0x1f(%rsp)
    34802cec:	0f 85 05 00 00 00    	jne    34802cf7 <.LBB1_110>
    34802cf2:	e9 29 00 00 00       	jmpq   34802d20 <.LBB1_112>

0000000034802cf7 <.LBB1_110>:
    34802cf7:	8b 44 24 20          	mov    0x20(%rsp),%eax
    34802cfb:	48 63 c8             	movslq %eax,%rcx
    34802cfe:	48 8b 94 24 a0 03 00 	mov    0x3a0(%rsp),%rdx
    34802d05:	00 
    34802d06:	83 3c 8a 00          	cmpl   $0x0,(%rdx,%rcx,4)
    34802d0a:	0f 85 10 00 00 00    	jne    34802d20 <.LBB1_112>
    34802d10:	8b 44 24 20          	mov    0x20(%rsp),%eax
    34802d14:	83 c0 01             	add    $0x1,%eax
    34802d17:	89 44 24 30          	mov    %eax,0x30(%rsp)
    34802d1b:	e9 b7 ff ff ff       	jmpq   34802cd7 <.LBB1_109>

0000000034802d20 <.LBB1_112>:
    34802d20:	b8 01 00 00 00       	mov    $0x1,%eax
    34802d25:	b9 ff ff ff ff       	mov    $0xffffffff,%ecx
    34802d2a:	8a 54 24 1f          	mov    0x1f(%rsp),%dl
    34802d2e:	f6 c2 01             	test   $0x1,%dl
    34802d31:	0f 45 c1             	cmovne %ecx,%eax
    34802d34:	89 84 24 b4 02 00 00 	mov    %eax,0x2b4(%rsp)

0000000034802d3b <.LBB1_113>:
    34802d3b:	8b 84 24 b4 02 00 00 	mov    0x2b4(%rsp),%eax
    34802d42:	48 81 c4 a8 04 00 00 	add    $0x4a8,%rsp
    34802d49:	5b                   	pop    %rbx
    34802d4a:	41 5c                	pop    %r12
    34802d4c:	c3                   	retq   
    34802d4d:	0f 1f 00             	nopl   (%rax)

0000000034802d50 <out>:
    34802d50:	48 83 ec 28          	sub    $0x28,%rsp
    34802d54:	8b 07                	mov    (%rdi),%eax
    34802d56:	83 e0 20             	and    $0x20,%eax
    34802d59:	83 f8 00             	cmp    $0x0,%eax
    34802d5c:	48 89 74 24 20       	mov    %rsi,0x20(%rsp)
    34802d61:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
    34802d66:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
    34802d6b:	0f 85 19 00 00 00    	jne    34802d8a <.LBB2_2>
    34802d71:	48 8b 7c 24 20       	mov    0x20(%rsp),%rdi
    34802d76:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
    34802d7b:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
    34802d80:	e8 0b 2d 00 00       	callq  34805a90 <__fwritex>
    34802d85:	48 89 44 24 08       	mov    %rax,0x8(%rsp)

0000000034802d8a <.LBB2_2>:
    34802d8a:	48 83 c4 28          	add    $0x28,%rsp
    34802d8e:	c3                   	retq   
    34802d8f:	90                   	nop

0000000034802d90 <getint>:
    34802d90:	31 c0                	xor    %eax,%eax
    34802d92:	48 89 7c 24 f8       	mov    %rdi,-0x8(%rsp)
    34802d97:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
    34802d9b:	e9 00 00 00 00       	jmpq   34802da0 <.LBB3_1>

0000000034802da0 <.LBB3_1>:
    34802da0:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
    34802da4:	48 8b 4c 24 f8       	mov    -0x8(%rsp),%rcx
    34802da9:	48 8b 11             	mov    (%rcx),%rdx
    34802dac:	0f be 32             	movsbl (%rdx),%esi
    34802daf:	83 c6 d0             	add    $0xffffffd0,%esi
    34802db2:	83 fe 0a             	cmp    $0xa,%esi
    34802db5:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
    34802db9:	48 89 54 24 e8       	mov    %rdx,-0x18(%rsp)
    34802dbe:	89 74 24 e4          	mov    %esi,-0x1c(%rsp)
    34802dc2:	0f 83 27 00 00 00    	jae    34802def <.LBB3_3>
    34802dc8:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
    34802dcc:	6b c8 0a             	imul   $0xa,%eax,%ecx
    34802dcf:	8b 54 24 e4          	mov    -0x1c(%rsp),%edx
    34802dd3:	01 ca                	add    %ecx,%edx
    34802dd5:	48 8b 74 24 e8       	mov    -0x18(%rsp),%rsi
    34802dda:	48 83 c6 01          	add    $0x1,%rsi
    34802dde:	48 8b 7c 24 f8       	mov    -0x8(%rsp),%rdi
    34802de3:	48 89 37             	mov    %rsi,(%rdi)
    34802de6:	89 54 24 f4          	mov    %edx,-0xc(%rsp)
    34802dea:	e9 b1 ff ff ff       	jmpq   34802da0 <.LBB3_1>

0000000034802def <.LBB3_3>:
    34802def:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
    34802df3:	c3                   	retq   
    34802df4:	66 66 66 2e 0f 1f 84 	data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34802dfb:	00 00 00 00 00 

0000000034802e00 <pop_arg>:
    34802e00:	48 81 ec 80 00 00 00 	sub    $0x80,%rsp
    34802e07:	83 fe 16             	cmp    $0x16,%esi
    34802e0a:	89 74 24 7c          	mov    %esi,0x7c(%rsp)
    34802e0e:	48 89 7c 24 70       	mov    %rdi,0x70(%rsp)
    34802e13:	48 89 54 24 68       	mov    %rdx,0x68(%rsp)
    34802e18:	0f 87 b3 05 00 00    	ja     348033d1 <.LBB4_47>
    34802e1e:	8b 44 24 7c          	mov    0x7c(%rsp),%eax
    34802e22:	83 e8 09             	sub    $0x9,%eax
    34802e25:	89 44 24 64          	mov    %eax,0x64(%rsp)
    34802e29:	0f 84 f7 00 00 00    	je     34802f26 <.LBB4_2>
    34802e2f:	e9 00 00 00 00       	jmpq   34802e34 <.LBB4_48>

0000000034802e34 <.LBB4_48>:
    34802e34:	8b 44 24 7c          	mov    0x7c(%rsp),%eax
    34802e38:	83 e8 0a             	sub    $0xa,%eax
    34802e3b:	89 44 24 60          	mov    %eax,0x60(%rsp)
    34802e3f:	0f 84 45 01 00 00    	je     34802f8a <.LBB4_6>
    34802e45:	e9 00 00 00 00       	jmpq   34802e4a <.LBB4_49>

0000000034802e4a <.LBB4_49>:
    34802e4a:	8b 44 24 7c          	mov    0x7c(%rsp),%eax
    34802e4e:	83 e8 0b             	sub    $0xb,%eax
    34802e51:	89 44 24 5c          	mov    %eax,0x5c(%rsp)
    34802e55:	0f 84 93 01 00 00    	je     34802fee <.LBB4_10>
    34802e5b:	e9 00 00 00 00       	jmpq   34802e60 <.LBB4_50>

0000000034802e60 <.LBB4_50>:
    34802e60:	8b 44 24 7c          	mov    0x7c(%rsp),%eax
    34802e64:	83 e8 0c             	sub    $0xc,%eax
    34802e67:	89 44 24 58          	mov    %eax,0x58(%rsp)
    34802e6b:	0f 84 aa 02 00 00    	je     3480311b <.LBB4_22>
    34802e71:	e9 00 00 00 00       	jmpq   34802e76 <.LBB4_51>

0000000034802e76 <.LBB4_51>:
    34802e76:	8b 44 24 7c          	mov    0x7c(%rsp),%eax
    34802e7a:	83 e8 0d             	sub    $0xd,%eax
    34802e7d:	89 44 24 54          	mov    %eax,0x54(%rsp)
    34802e81:	0f 84 cc 01 00 00    	je     34803053 <.LBB4_14>
    34802e87:	e9 00 00 00 00       	jmpq   34802e8c <.LBB4_52>

0000000034802e8c <.LBB4_52>:
    34802e8c:	8b 44 24 7c          	mov    0x7c(%rsp),%eax
    34802e90:	83 e8 0e             	sub    $0xe,%eax
    34802e93:	89 44 24 50          	mov    %eax,0x50(%rsp)
    34802e97:	0f 84 1a 02 00 00    	je     348030b7 <.LBB4_18>
    34802e9d:	e9 00 00 00 00       	jmpq   34802ea2 <.LBB4_53>

0000000034802ea2 <.LBB4_53>:
    34802ea2:	8b 44 24 7c          	mov    0x7c(%rsp),%eax
    34802ea6:	83 e8 0f             	sub    $0xf,%eax
    34802ea9:	89 44 24 4c          	mov    %eax,0x4c(%rsp)
    34802ead:	0f 84 cc 02 00 00    	je     3480317f <.LBB4_26>
    34802eb3:	e9 00 00 00 00       	jmpq   34802eb8 <.LBB4_54>

0000000034802eb8 <.LBB4_54>:
    34802eb8:	8b 44 24 7c          	mov    0x7c(%rsp),%eax
    34802ebc:	83 e8 10             	sub    $0x10,%eax
    34802ebf:	89 44 24 48          	mov    %eax,0x48(%rsp)
    34802ec3:	0f 84 23 03 00 00    	je     348031ec <.LBB4_30>
    34802ec9:	e9 00 00 00 00       	jmpq   34802ece <.LBB4_55>

0000000034802ece <.LBB4_55>:
    34802ece:	8b 44 24 7c          	mov    0x7c(%rsp),%eax
    34802ed2:	83 e8 11             	sub    $0x11,%eax
    34802ed5:	89 44 24 44          	mov    %eax,0x44(%rsp)
    34802ed9:	0f 84 7a 03 00 00    	je     34803259 <.LBB4_34>
    34802edf:	e9 00 00 00 00       	jmpq   34802ee4 <.LBB4_56>

0000000034802ee4 <.LBB4_56>:
    34802ee4:	8b 44 24 7c          	mov    0x7c(%rsp),%eax
    34802ee8:	83 e8 12             	sub    $0x12,%eax
    34802eeb:	89 44 24 40          	mov    %eax,0x40(%rsp)
    34802eef:	0f 84 d1 03 00 00    	je     348032c6 <.LBB4_38>
    34802ef5:	e9 00 00 00 00       	jmpq   34802efa <.LBB4_57>

0000000034802efa <.LBB4_57>:
    34802efa:	8b 44 24 7c          	mov    0x7c(%rsp),%eax
    34802efe:	83 e8 13             	sub    $0x13,%eax
    34802f01:	89 44 24 3c          	mov    %eax,0x3c(%rsp)
    34802f05:	0f 84 28 04 00 00    	je     34803333 <.LBB4_42>
    34802f0b:	e9 00 00 00 00       	jmpq   34802f10 <.LBB4_58>

0000000034802f10 <.LBB4_58>:
    34802f10:	8b 44 24 7c          	mov    0x7c(%rsp),%eax
    34802f14:	83 e8 14             	sub    $0x14,%eax
    34802f17:	89 44 24 38          	mov    %eax,0x38(%rsp)
    34802f1b:	0f 84 8b 04 00 00    	je     348033ac <.LBB4_46>
    34802f21:	e9 ab 04 00 00       	jmpq   348033d1 <.LBB4_47>

0000000034802f26 <.LBB4_2>:
    34802f26:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34802f2b:	8b 08                	mov    (%rax),%ecx
    34802f2d:	83 f9 29             	cmp    $0x29,%ecx
    34802f30:	89 4c 24 34          	mov    %ecx,0x34(%rsp)
    34802f34:	0f 83 22 00 00 00    	jae    34802f5c <.LBB4_4>
    34802f3a:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34802f3f:	48 8b 48 10          	mov    0x10(%rax),%rcx
    34802f43:	8b 54 24 34          	mov    0x34(%rsp),%edx
    34802f47:	48 63 f2             	movslq %edx,%rsi
    34802f4a:	48 01 f1             	add    %rsi,%rcx
    34802f4d:	83 c2 08             	add    $0x8,%edx
    34802f50:	89 10                	mov    %edx,(%rax)
    34802f52:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
    34802f57:	e9 19 00 00 00       	jmpq   34802f75 <.LBB4_5>

0000000034802f5c <.LBB4_4>:
    34802f5c:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34802f61:	48 8b 48 08          	mov    0x8(%rax),%rcx
    34802f65:	48 89 ca             	mov    %rcx,%rdx
    34802f68:	48 83 c2 08          	add    $0x8,%rdx
    34802f6c:	48 89 50 08          	mov    %rdx,0x8(%rax)
    34802f70:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)

0000000034802f75 <.LBB4_5>:
    34802f75:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
    34802f7a:	48 8b 00             	mov    (%rax),%rax
    34802f7d:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
    34802f82:	48 89 01             	mov    %rax,(%rcx)
    34802f85:	e9 47 04 00 00       	jmpq   348033d1 <.LBB4_47>

0000000034802f8a <.LBB4_6>:
    34802f8a:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34802f8f:	8b 08                	mov    (%rax),%ecx
    34802f91:	83 f9 29             	cmp    $0x29,%ecx
    34802f94:	89 4c 24 24          	mov    %ecx,0x24(%rsp)
    34802f98:	0f 83 22 00 00 00    	jae    34802fc0 <.LBB4_8>
    34802f9e:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34802fa3:	48 8b 48 10          	mov    0x10(%rax),%rcx
    34802fa7:	8b 54 24 24          	mov    0x24(%rsp),%edx
    34802fab:	48 63 f2             	movslq %edx,%rsi
    34802fae:	48 01 f1             	add    %rsi,%rcx
    34802fb1:	83 c2 08             	add    $0x8,%edx
    34802fb4:	89 10                	mov    %edx,(%rax)
    34802fb6:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
    34802fbb:	e9 19 00 00 00       	jmpq   34802fd9 <.LBB4_9>

0000000034802fc0 <.LBB4_8>:
    34802fc0:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34802fc5:	48 8b 48 08          	mov    0x8(%rax),%rcx
    34802fc9:	48 89 ca             	mov    %rcx,%rdx
    34802fcc:	48 83 c2 08          	add    $0x8,%rdx
    34802fd0:	48 89 50 08          	mov    %rdx,0x8(%rax)
    34802fd4:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)

0000000034802fd9 <.LBB4_9>:
    34802fd9:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
    34802fde:	48 63 00             	movslq (%rax),%rax
    34802fe1:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
    34802fe6:	48 89 01             	mov    %rax,(%rcx)
    34802fe9:	e9 e3 03 00 00       	jmpq   348033d1 <.LBB4_47>

0000000034802fee <.LBB4_10>:
    34802fee:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34802ff3:	8b 08                	mov    (%rax),%ecx
    34802ff5:	83 f9 29             	cmp    $0x29,%ecx
    34802ff8:	89 4c 24 14          	mov    %ecx,0x14(%rsp)
    34802ffc:	0f 83 22 00 00 00    	jae    34803024 <.LBB4_12>
    34803002:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34803007:	48 8b 48 10          	mov    0x10(%rax),%rcx
    3480300b:	8b 54 24 14          	mov    0x14(%rsp),%edx
    3480300f:	48 63 f2             	movslq %edx,%rsi
    34803012:	48 01 f1             	add    %rsi,%rcx
    34803015:	83 c2 08             	add    $0x8,%edx
    34803018:	89 10                	mov    %edx,(%rax)
    3480301a:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    3480301f:	e9 19 00 00 00       	jmpq   3480303d <.LBB4_13>

0000000034803024 <.LBB4_12>:
    34803024:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34803029:	48 8b 48 08          	mov    0x8(%rax),%rcx
    3480302d:	48 89 ca             	mov    %rcx,%rdx
    34803030:	48 83 c2 08          	add    $0x8,%rdx
    34803034:	48 89 50 08          	mov    %rdx,0x8(%rax)
    34803038:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)

000000003480303d <.LBB4_13>:
    3480303d:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    34803042:	8b 08                	mov    (%rax),%ecx
    34803044:	89 c8                	mov    %ecx,%eax
    34803046:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
    3480304b:	48 89 02             	mov    %rax,(%rdx)
    3480304e:	e9 7e 03 00 00       	jmpq   348033d1 <.LBB4_47>

0000000034803053 <.LBB4_14>:
    34803053:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34803058:	8b 08                	mov    (%rax),%ecx
    3480305a:	83 f9 29             	cmp    $0x29,%ecx
    3480305d:	89 4c 24 04          	mov    %ecx,0x4(%rsp)
    34803061:	0f 83 22 00 00 00    	jae    34803089 <.LBB4_16>
    34803067:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    3480306c:	48 8b 48 10          	mov    0x10(%rax),%rcx
    34803070:	8b 54 24 04          	mov    0x4(%rsp),%edx
    34803074:	48 63 f2             	movslq %edx,%rsi
    34803077:	48 01 f1             	add    %rsi,%rcx
    3480307a:	83 c2 08             	add    $0x8,%edx
    3480307d:	89 10                	mov    %edx,(%rax)
    3480307f:	48 89 4c 24 f8       	mov    %rcx,-0x8(%rsp)
    34803084:	e9 19 00 00 00       	jmpq   348030a2 <.LBB4_17>

0000000034803089 <.LBB4_16>:
    34803089:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    3480308e:	48 8b 48 08          	mov    0x8(%rax),%rcx
    34803092:	48 89 ca             	mov    %rcx,%rdx
    34803095:	48 83 c2 08          	add    $0x8,%rdx
    34803099:	48 89 50 08          	mov    %rdx,0x8(%rax)
    3480309d:	48 89 4c 24 f8       	mov    %rcx,-0x8(%rsp)

00000000348030a2 <.LBB4_17>:
    348030a2:	48 8b 44 24 f8       	mov    -0x8(%rsp),%rax
    348030a7:	48 8b 00             	mov    (%rax),%rax
    348030aa:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
    348030af:	48 89 01             	mov    %rax,(%rcx)
    348030b2:	e9 1a 03 00 00       	jmpq   348033d1 <.LBB4_47>

00000000348030b7 <.LBB4_18>:
    348030b7:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    348030bc:	8b 08                	mov    (%rax),%ecx
    348030be:	83 f9 29             	cmp    $0x29,%ecx
    348030c1:	89 4c 24 f4          	mov    %ecx,-0xc(%rsp)
    348030c5:	0f 83 22 00 00 00    	jae    348030ed <.LBB4_20>
    348030cb:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    348030d0:	48 8b 48 10          	mov    0x10(%rax),%rcx
    348030d4:	8b 54 24 f4          	mov    -0xc(%rsp),%edx
    348030d8:	48 63 f2             	movslq %edx,%rsi
    348030db:	48 01 f1             	add    %rsi,%rcx
    348030de:	83 c2 08             	add    $0x8,%edx
    348030e1:	89 10                	mov    %edx,(%rax)
    348030e3:	48 89 4c 24 e8       	mov    %rcx,-0x18(%rsp)
    348030e8:	e9 19 00 00 00       	jmpq   34803106 <.LBB4_21>

00000000348030ed <.LBB4_20>:
    348030ed:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    348030f2:	48 8b 48 08          	mov    0x8(%rax),%rcx
    348030f6:	48 89 ca             	mov    %rcx,%rdx
    348030f9:	48 83 c2 08          	add    $0x8,%rdx
    348030fd:	48 89 50 08          	mov    %rdx,0x8(%rax)
    34803101:	48 89 4c 24 e8       	mov    %rcx,-0x18(%rsp)

0000000034803106 <.LBB4_21>:
    34803106:	48 8b 44 24 e8       	mov    -0x18(%rsp),%rax
    3480310b:	48 8b 00             	mov    (%rax),%rax
    3480310e:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
    34803113:	48 89 01             	mov    %rax,(%rcx)
    34803116:	e9 b6 02 00 00       	jmpq   348033d1 <.LBB4_47>

000000003480311b <.LBB4_22>:
    3480311b:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34803120:	8b 08                	mov    (%rax),%ecx
    34803122:	83 f9 29             	cmp    $0x29,%ecx
    34803125:	89 4c 24 e4          	mov    %ecx,-0x1c(%rsp)
    34803129:	0f 83 22 00 00 00    	jae    34803151 <.LBB4_24>
    3480312f:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34803134:	48 8b 48 10          	mov    0x10(%rax),%rcx
    34803138:	8b 54 24 e4          	mov    -0x1c(%rsp),%edx
    3480313c:	48 63 f2             	movslq %edx,%rsi
    3480313f:	48 01 f1             	add    %rsi,%rcx
    34803142:	83 c2 08             	add    $0x8,%edx
    34803145:	89 10                	mov    %edx,(%rax)
    34803147:	48 89 4c 24 d8       	mov    %rcx,-0x28(%rsp)
    3480314c:	e9 19 00 00 00       	jmpq   3480316a <.LBB4_25>

0000000034803151 <.LBB4_24>:
    34803151:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34803156:	48 8b 48 08          	mov    0x8(%rax),%rcx
    3480315a:	48 89 ca             	mov    %rcx,%rdx
    3480315d:	48 83 c2 08          	add    $0x8,%rdx
    34803161:	48 89 50 08          	mov    %rdx,0x8(%rax)
    34803165:	48 89 4c 24 d8       	mov    %rcx,-0x28(%rsp)

000000003480316a <.LBB4_25>:
    3480316a:	48 8b 44 24 d8       	mov    -0x28(%rsp),%rax
    3480316f:	48 8b 00             	mov    (%rax),%rax
    34803172:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
    34803177:	48 89 01             	mov    %rax,(%rcx)
    3480317a:	e9 52 02 00 00       	jmpq   348033d1 <.LBB4_47>

000000003480317f <.LBB4_26>:
    3480317f:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34803184:	8b 08                	mov    (%rax),%ecx
    34803186:	83 f9 29             	cmp    $0x29,%ecx
    34803189:	89 4c 24 d4          	mov    %ecx,-0x2c(%rsp)
    3480318d:	0f 83 22 00 00 00    	jae    348031b5 <.LBB4_28>
    34803193:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34803198:	48 8b 48 10          	mov    0x10(%rax),%rcx
    3480319c:	8b 54 24 d4          	mov    -0x2c(%rsp),%edx
    348031a0:	48 63 f2             	movslq %edx,%rsi
    348031a3:	48 01 f1             	add    %rsi,%rcx
    348031a6:	83 c2 08             	add    $0x8,%edx
    348031a9:	89 10                	mov    %edx,(%rax)
    348031ab:	48 89 4c 24 c8       	mov    %rcx,-0x38(%rsp)
    348031b0:	e9 19 00 00 00       	jmpq   348031ce <.LBB4_29>

00000000348031b5 <.LBB4_28>:
    348031b5:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    348031ba:	48 8b 48 08          	mov    0x8(%rax),%rcx
    348031be:	48 89 ca             	mov    %rcx,%rdx
    348031c1:	48 83 c2 08          	add    $0x8,%rdx
    348031c5:	48 89 50 08          	mov    %rdx,0x8(%rax)
    348031c9:	48 89 4c 24 c8       	mov    %rcx,-0x38(%rsp)

00000000348031ce <.LBB4_29>:
    348031ce:	48 8b 44 24 c8       	mov    -0x38(%rsp),%rax
    348031d3:	8b 08                	mov    (%rax),%ecx
    348031d5:	89 c8                	mov    %ecx,%eax
    348031d7:	48 c1 e0 30          	shl    $0x30,%rax
    348031db:	48 c1 f8 30          	sar    $0x30,%rax
    348031df:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
    348031e4:	48 89 02             	mov    %rax,(%rdx)
    348031e7:	e9 e5 01 00 00       	jmpq   348033d1 <.LBB4_47>

00000000348031ec <.LBB4_30>:
    348031ec:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    348031f1:	8b 08                	mov    (%rax),%ecx
    348031f3:	83 f9 29             	cmp    $0x29,%ecx
    348031f6:	89 4c 24 c4          	mov    %ecx,-0x3c(%rsp)
    348031fa:	0f 83 22 00 00 00    	jae    34803222 <.LBB4_32>
    34803200:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34803205:	48 8b 48 10          	mov    0x10(%rax),%rcx
    34803209:	8b 54 24 c4          	mov    -0x3c(%rsp),%edx
    3480320d:	48 63 f2             	movslq %edx,%rsi
    34803210:	48 01 f1             	add    %rsi,%rcx
    34803213:	83 c2 08             	add    $0x8,%edx
    34803216:	89 10                	mov    %edx,(%rax)
    34803218:	48 89 4c 24 b8       	mov    %rcx,-0x48(%rsp)
    3480321d:	e9 19 00 00 00       	jmpq   3480323b <.LBB4_33>

0000000034803222 <.LBB4_32>:
    34803222:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34803227:	48 8b 48 08          	mov    0x8(%rax),%rcx
    3480322b:	48 89 ca             	mov    %rcx,%rdx
    3480322e:	48 83 c2 08          	add    $0x8,%rdx
    34803232:	48 89 50 08          	mov    %rdx,0x8(%rax)
    34803236:	48 89 4c 24 b8       	mov    %rcx,-0x48(%rsp)

000000003480323b <.LBB4_33>:
    3480323b:	48 8b 44 24 b8       	mov    -0x48(%rsp),%rax
    34803240:	8b 08                	mov    (%rax),%ecx
    34803242:	81 e1 ff ff 00 00    	and    $0xffff,%ecx
    34803248:	89 c9                	mov    %ecx,%ecx
    3480324a:	89 c8                	mov    %ecx,%eax
    3480324c:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
    34803251:	48 89 02             	mov    %rax,(%rdx)
    34803254:	e9 78 01 00 00       	jmpq   348033d1 <.LBB4_47>

0000000034803259 <.LBB4_34>:
    34803259:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    3480325e:	8b 08                	mov    (%rax),%ecx
    34803260:	83 f9 29             	cmp    $0x29,%ecx
    34803263:	89 4c 24 b4          	mov    %ecx,-0x4c(%rsp)
    34803267:	0f 83 22 00 00 00    	jae    3480328f <.LBB4_36>
    3480326d:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34803272:	48 8b 48 10          	mov    0x10(%rax),%rcx
    34803276:	8b 54 24 b4          	mov    -0x4c(%rsp),%edx
    3480327a:	48 63 f2             	movslq %edx,%rsi
    3480327d:	48 01 f1             	add    %rsi,%rcx
    34803280:	83 c2 08             	add    $0x8,%edx
    34803283:	89 10                	mov    %edx,(%rax)
    34803285:	48 89 4c 24 a8       	mov    %rcx,-0x58(%rsp)
    3480328a:	e9 19 00 00 00       	jmpq   348032a8 <.LBB4_37>

000000003480328f <.LBB4_36>:
    3480328f:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34803294:	48 8b 48 08          	mov    0x8(%rax),%rcx
    34803298:	48 89 ca             	mov    %rcx,%rdx
    3480329b:	48 83 c2 08          	add    $0x8,%rdx
    3480329f:	48 89 50 08          	mov    %rdx,0x8(%rax)
    348032a3:	48 89 4c 24 a8       	mov    %rcx,-0x58(%rsp)

00000000348032a8 <.LBB4_37>:
    348032a8:	48 8b 44 24 a8       	mov    -0x58(%rsp),%rax
    348032ad:	8b 08                	mov    (%rax),%ecx
    348032af:	89 c8                	mov    %ecx,%eax
    348032b1:	48 c1 e0 38          	shl    $0x38,%rax
    348032b5:	48 c1 f8 38          	sar    $0x38,%rax
    348032b9:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
    348032be:	48 89 02             	mov    %rax,(%rdx)
    348032c1:	e9 0b 01 00 00       	jmpq   348033d1 <.LBB4_47>

00000000348032c6 <.LBB4_38>:
    348032c6:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    348032cb:	8b 08                	mov    (%rax),%ecx
    348032cd:	83 f9 29             	cmp    $0x29,%ecx
    348032d0:	89 4c 24 a4          	mov    %ecx,-0x5c(%rsp)
    348032d4:	0f 83 22 00 00 00    	jae    348032fc <.LBB4_40>
    348032da:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    348032df:	48 8b 48 10          	mov    0x10(%rax),%rcx
    348032e3:	8b 54 24 a4          	mov    -0x5c(%rsp),%edx
    348032e7:	48 63 f2             	movslq %edx,%rsi
    348032ea:	48 01 f1             	add    %rsi,%rcx
    348032ed:	83 c2 08             	add    $0x8,%edx
    348032f0:	89 10                	mov    %edx,(%rax)
    348032f2:	48 89 4c 24 98       	mov    %rcx,-0x68(%rsp)
    348032f7:	e9 19 00 00 00       	jmpq   34803315 <.LBB4_41>

00000000348032fc <.LBB4_40>:
    348032fc:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34803301:	48 8b 48 08          	mov    0x8(%rax),%rcx
    34803305:	48 89 ca             	mov    %rcx,%rdx
    34803308:	48 83 c2 08          	add    $0x8,%rdx
    3480330c:	48 89 50 08          	mov    %rdx,0x8(%rax)
    34803310:	48 89 4c 24 98       	mov    %rcx,-0x68(%rsp)

0000000034803315 <.LBB4_41>:
    34803315:	48 8b 44 24 98       	mov    -0x68(%rsp),%rax
    3480331a:	8b 08                	mov    (%rax),%ecx
    3480331c:	81 e1 ff 00 00 00    	and    $0xff,%ecx
    34803322:	89 c9                	mov    %ecx,%ecx
    34803324:	89 c8                	mov    %ecx,%eax
    34803326:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
    3480332b:	48 89 02             	mov    %rax,(%rdx)
    3480332e:	e9 9e 00 00 00       	jmpq   348033d1 <.LBB4_47>

0000000034803333 <.LBB4_42>:
    34803333:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34803338:	48 83 c0 04          	add    $0x4,%rax
    3480333c:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
    34803341:	8b 51 04             	mov    0x4(%rcx),%edx
    34803344:	81 fa a1 00 00 00    	cmp    $0xa1,%edx
    3480334a:	48 89 44 24 90       	mov    %rax,-0x70(%rsp)
    3480334f:	89 54 24 8c          	mov    %edx,-0x74(%rsp)
    34803353:	0f 83 27 00 00 00    	jae    34803380 <.LBB4_44>
    34803359:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    3480335e:	48 8b 48 10          	mov    0x10(%rax),%rcx
    34803362:	8b 54 24 8c          	mov    -0x74(%rsp),%edx
    34803366:	48 63 f2             	movslq %edx,%rsi
    34803369:	48 01 f1             	add    %rsi,%rcx
    3480336c:	83 c2 10             	add    $0x10,%edx
    3480336f:	48 8b 74 24 90       	mov    -0x70(%rsp),%rsi
    34803374:	89 16                	mov    %edx,(%rsi)
    34803376:	48 89 4c 24 80       	mov    %rcx,-0x80(%rsp)
    3480337b:	e9 19 00 00 00       	jmpq   34803399 <.LBB4_45>

0000000034803380 <.LBB4_44>:
    34803380:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34803385:	48 8b 48 08          	mov    0x8(%rax),%rcx
    34803389:	48 89 ca             	mov    %rcx,%rdx
    3480338c:	48 83 c2 08          	add    $0x8,%rdx
    34803390:	48 89 50 08          	mov    %rdx,0x8(%rax)
    34803394:	48 89 4c 24 80       	mov    %rcx,-0x80(%rsp)

0000000034803399 <.LBB4_45>:
    34803399:	48 8b 44 24 80       	mov    -0x80(%rsp),%rax
    3480339e:	dd 00                	fldl   (%rax)
    348033a0:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
    348033a5:	db 38                	fstpt  (%rax)
    348033a7:	e9 25 00 00 00       	jmpq   348033d1 <.LBB4_47>

00000000348033ac <.LBB4_46>:
    348033ac:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    348033b1:	48 8b 48 08          	mov    0x8(%rax),%rcx
    348033b5:	48 83 c1 0f          	add    $0xf,%rcx
    348033b9:	48 83 e1 f0          	and    $0xfffffffffffffff0,%rcx
    348033bd:	48 89 ca             	mov    %rcx,%rdx
    348033c0:	48 83 c2 10          	add    $0x10,%rdx
    348033c4:	48 89 50 08          	mov    %rdx,0x8(%rax)
    348033c8:	db 29                	fldt   (%rcx)
    348033ca:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
    348033cf:	db 39                	fstpt  (%rcx)

00000000348033d1 <.LBB4_47>:
    348033d1:	48 81 c4 80 00 00 00 	add    $0x80,%rsp
    348033d8:	c3                   	retq   
    348033d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000348033e0 <fmt_x>:
    348033e0:	89 54 24 fc          	mov    %edx,-0x4(%rsp)
    348033e4:	48 89 74 24 f0       	mov    %rsi,-0x10(%rsp)
    348033e9:	48 89 7c 24 e8       	mov    %rdi,-0x18(%rsp)
    348033ee:	e9 00 00 00 00       	jmpq   348033f3 <.LBB5_1>

00000000348033f3 <.LBB5_1>:
    348033f3:	48 8b 44 24 e8       	mov    -0x18(%rsp),%rax
    348033f8:	48 8b 4c 24 f0       	mov    -0x10(%rsp),%rcx
    348033fd:	48 83 f8 00          	cmp    $0x0,%rax
    34803401:	48 89 44 24 e0       	mov    %rax,-0x20(%rsp)
    34803406:	48 89 4c 24 d8       	mov    %rcx,-0x28(%rsp)
    3480340b:	0f 84 44 00 00 00    	je     34803455 <.LBB5_3>
    34803411:	48 8b 44 24 e0       	mov    -0x20(%rsp),%rax
    34803416:	48 83 e0 0f          	and    $0xf,%rax
    3480341a:	0f b6 0c 05 50 67 80 	movzbl 0x34806750(,%rax,1),%ecx
    34803421:	34 
    34803422:	8b 54 24 fc          	mov    -0x4(%rsp),%edx
    34803426:	09 d1                	or     %edx,%ecx
    34803428:	40 88 ce             	mov    %cl,%sil
    3480342b:	48 8b 44 24 d8       	mov    -0x28(%rsp),%rax
    34803430:	48 83 c0 ff          	add    $0xffffffffffffffff,%rax
    34803434:	48 8b 7c 24 d8       	mov    -0x28(%rsp),%rdi
    34803439:	40 88 77 ff          	mov    %sil,-0x1(%rdi)
    3480343d:	4c 8b 44 24 e0       	mov    -0x20(%rsp),%r8
    34803442:	49 c1 e8 04          	shr    $0x4,%r8
    34803446:	48 89 44 24 f0       	mov    %rax,-0x10(%rsp)
    3480344b:	4c 89 44 24 e8       	mov    %r8,-0x18(%rsp)
    34803450:	e9 9e ff ff ff       	jmpq   348033f3 <.LBB5_1>

0000000034803455 <.LBB5_3>:
    34803455:	48 8b 44 24 d8       	mov    -0x28(%rsp),%rax
    3480345a:	c3                   	retq   
    3480345b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000034803460 <fmt_o>:
    34803460:	48 89 7c 24 f8       	mov    %rdi,-0x8(%rsp)
    34803465:	48 89 74 24 f0       	mov    %rsi,-0x10(%rsp)
    3480346a:	e9 00 00 00 00       	jmpq   3480346f <.LBB6_1>

000000003480346f <.LBB6_1>:
    3480346f:	48 8b 44 24 f0       	mov    -0x10(%rsp),%rax
    34803474:	48 8b 4c 24 f8       	mov    -0x8(%rsp),%rcx
    34803479:	48 83 f9 00          	cmp    $0x0,%rcx
    3480347d:	48 89 44 24 e8       	mov    %rax,-0x18(%rsp)
    34803482:	48 89 4c 24 e0       	mov    %rcx,-0x20(%rsp)
    34803487:	0f 84 31 00 00 00    	je     348034be <.LBB6_3>
    3480348d:	48 8b 44 24 e0       	mov    -0x20(%rsp),%rax
    34803492:	88 c1                	mov    %al,%cl
    34803494:	80 e1 07             	and    $0x7,%cl
    34803497:	80 c9 30             	or     $0x30,%cl
    3480349a:	48 8b 54 24 e8       	mov    -0x18(%rsp),%rdx
    3480349f:	48 83 c2 ff          	add    $0xffffffffffffffff,%rdx
    348034a3:	48 8b 74 24 e8       	mov    -0x18(%rsp),%rsi
    348034a8:	88 4e ff             	mov    %cl,-0x1(%rsi)
    348034ab:	48 c1 e8 03          	shr    $0x3,%rax
    348034af:	48 89 44 24 f8       	mov    %rax,-0x8(%rsp)
    348034b4:	48 89 54 24 f0       	mov    %rdx,-0x10(%rsp)
    348034b9:	e9 b1 ff ff ff       	jmpq   3480346f <.LBB6_1>

00000000348034be <.LBB6_3>:
    348034be:	48 8b 44 24 e8       	mov    -0x18(%rsp),%rax
    348034c3:	c3                   	retq   
    348034c4:	66 66 66 2e 0f 1f 84 	data32 data32 nopw %cs:0x0(%rax,%rax,1)
    348034cb:	00 00 00 00 00 

00000000348034d0 <fmt_u>:
    348034d0:	48 89 74 24 f8       	mov    %rsi,-0x8(%rsp)
    348034d5:	48 89 7c 24 f0       	mov    %rdi,-0x10(%rsp)
    348034da:	e9 00 00 00 00       	jmpq   348034df <.LBB7_1>

00000000348034df <.LBB7_1>:
    348034df:	48 8b 44 24 f0       	mov    -0x10(%rsp),%rax
    348034e4:	48 8b 4c 24 f8       	mov    -0x8(%rsp),%rcx
    348034e9:	48 83 f8 00          	cmp    $0x0,%rax
    348034ed:	48 89 44 24 e8       	mov    %rax,-0x18(%rsp)
    348034f2:	48 89 4c 24 e0       	mov    %rcx,-0x20(%rsp)
    348034f7:	0f 84 54 00 00 00    	je     34803551 <.LBB7_3>
    348034fd:	b8 0a 00 00 00       	mov    $0xa,%eax
    34803502:	89 c1                	mov    %eax,%ecx
    34803504:	48 8b 44 24 e8       	mov    -0x18(%rsp),%rax
    34803509:	31 d2                	xor    %edx,%edx
    3480350b:	48 f7 f1             	div    %rcx
    3480350e:	40 88 d6             	mov    %dl,%sil
    34803511:	40 80 ce 30          	or     $0x30,%sil
    34803515:	48 8b 54 24 e0       	mov    -0x20(%rsp),%rdx
    3480351a:	48 83 c2 ff          	add    $0xffffffffffffffff,%rdx
    3480351e:	48 8b 7c 24 e0       	mov    -0x20(%rsp),%rdi
    34803523:	40 88 77 ff          	mov    %sil,-0x1(%rdi)
    34803527:	4c 8b 44 24 e8       	mov    -0x18(%rsp),%r8
    3480352c:	4c 89 c0             	mov    %r8,%rax
    3480352f:	45 31 c9             	xor    %r9d,%r9d
    34803532:	48 89 54 24 d8       	mov    %rdx,-0x28(%rsp)
    34803537:	44 89 ca             	mov    %r9d,%edx
    3480353a:	48 f7 f1             	div    %rcx
    3480353d:	48 8b 4c 24 d8       	mov    -0x28(%rsp),%rcx
    34803542:	48 89 4c 24 f8       	mov    %rcx,-0x8(%rsp)
    34803547:	48 89 44 24 f0       	mov    %rax,-0x10(%rsp)
    3480354c:	e9 8e ff ff ff       	jmpq   348034df <.LBB7_1>

0000000034803551 <.LBB7_3>:
    34803551:	48 8b 44 24 e0       	mov    -0x20(%rsp),%rax
    34803556:	c3                   	retq   
    34803557:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
    3480355e:	00 00 

0000000034803560 <pad>:
    34803560:	48 81 ec 48 01 00 00 	sub    $0x148,%rsp
    34803567:	40 88 f0             	mov    %sil,%al
    3480356a:	41 81 e0 00 20 01 00 	and    $0x12000,%r8d
    34803571:	41 83 f8 00          	cmp    $0x0,%r8d
    34803575:	41 0f 95 c1          	setne  %r9b
    34803579:	39 ca                	cmp    %ecx,%edx
    3480357b:	41 0f 9e c2          	setle  %r10b
    3480357f:	45 08 d1             	or     %r10b,%r9b
    34803582:	41 f6 c1 01          	test   $0x1,%r9b
    34803586:	88 44 24 3f          	mov    %al,0x3f(%rsp)
    3480358a:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
    3480358f:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
    34803593:	89 54 24 28          	mov    %edx,0x28(%rsp)
    34803597:	0f 85 9f 00 00 00    	jne    3480363c <.LBB8_5>
    3480359d:	b8 00 01 00 00       	mov    $0x100,%eax
    348035a2:	89 c1                	mov    %eax,%ecx
    348035a4:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
    348035a9:	8b 44 24 28          	mov    0x28(%rsp),%eax
    348035ad:	8b 74 24 2c          	mov    0x2c(%rsp),%esi
    348035b1:	29 f0                	sub    %esi,%eax
    348035b3:	40 8a 7c 24 3f       	mov    0x3f(%rsp),%dil
    348035b8:	40 0f be f7          	movsbl %dil,%esi
    348035bc:	4c 63 c0             	movslq %eax,%r8
    348035bf:	49 81 f8 00 01 00 00 	cmp    $0x100,%r8
    348035c6:	49 0f 42 c8          	cmovb  %r8,%rcx
    348035ca:	48 89 d7             	mov    %rdx,%rdi
    348035cd:	48 89 54 24 20       	mov    %rdx,0x20(%rsp)
    348035d2:	48 89 ca             	mov    %rcx,%rdx
    348035d5:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
    348035d9:	e8 7b 27 00 00       	callq  34805d59 <memset>
    348035de:	8b 74 24 1c          	mov    0x1c(%rsp),%esi
    348035e2:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    348035e7:	89 74 24 0c          	mov    %esi,0xc(%rsp)

00000000348035eb <.LBB8_2>:
    348035eb:	8b 44 24 0c          	mov    0xc(%rsp),%eax
    348035ef:	3d ff 00 00 00       	cmp    $0xff,%eax
    348035f4:	89 44 24 08          	mov    %eax,0x8(%rsp)
    348035f8:	0f 86 28 00 00 00    	jbe    34803626 <.LBB8_4>
    348035fe:	b8 00 01 00 00       	mov    $0x100,%eax
    34803603:	89 c2                	mov    %eax,%edx
    34803605:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
    3480360a:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    3480360f:	e8 3c f7 ff ff       	callq  34802d50 <out>
    34803614:	8b 44 24 08          	mov    0x8(%rsp),%eax
    34803618:	05 00 ff ff ff       	add    $0xffffff00,%eax
    3480361d:	89 44 24 0c          	mov    %eax,0xc(%rsp)
    34803621:	e9 c5 ff ff ff       	jmpq   348035eb <.LBB8_2>

0000000034803626 <.LBB8_4>:
    34803626:	8b 44 24 08          	mov    0x8(%rsp),%eax
    3480362a:	48 63 d0             	movslq %eax,%rdx
    3480362d:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
    34803632:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    34803637:	e8 14 f7 ff ff       	callq  34802d50 <out>

000000003480363c <.LBB8_5>:
    3480363c:	48 81 c4 48 01 00 00 	add    $0x148,%rsp
    34803643:	c3                   	retq   
    34803644:	66 66 66 2e 0f 1f 84 	data32 data32 nopw %cs:0x0(%rax,%rax,1)
    3480364b:	00 00 00 00 00 

0000000034803650 <fmt_fp>:
    34803650:	41 54                	push   %r12
    34803652:	53                   	push   %rbx
    34803653:	48 81 ec 38 06 00 00 	sub    $0x638,%rsp
    3480365a:	db ac 24 50 06 00 00 	fldt   0x650(%rsp)
    34803661:	48 8d 84 24 04 06 00 	lea    0x604(%rsp),%rax
    34803668:	00 
    34803669:	c7 84 24 34 06 00 00 	movl   $0x0,0x634(%rsp)
    34803670:	00 00 00 00 
    34803674:	48 83 c0 0c          	add    $0xc,%rax
    34803678:	49 89 e1             	mov    %rsp,%r9
    3480367b:	d9 c0                	fld    %st(0)
    3480367d:	41 db 39             	fstpt  (%r9)
    34803680:	db bc 24 d8 05 00 00 	fstpt  0x5d8(%rsp)
    34803687:	44 89 84 24 d4 05 00 	mov    %r8d,0x5d4(%rsp)
    3480368e:	00 
    3480368f:	89 8c 24 d0 05 00 00 	mov    %ecx,0x5d0(%rsp)
    34803696:	89 94 24 cc 05 00 00 	mov    %edx,0x5cc(%rsp)
    3480369d:	89 b4 24 c8 05 00 00 	mov    %esi,0x5c8(%rsp)
    348036a4:	48 89 bc 24 c0 05 00 	mov    %rdi,0x5c0(%rsp)
    348036ab:	00 
    348036ac:	48 89 84 24 b8 05 00 	mov    %rax,0x5b8(%rsp)
    348036b3:	00 
    348036b4:	e8 57 22 00 00       	callq  34805910 <__signbitl>
    348036b9:	83 f8 00             	cmp    $0x0,%eax
    348036bc:	0f 84 33 00 00 00    	je     348036f5 <.LBB9_2>
    348036c2:	48 b8 71 67 80 34 00 	movabs $0x34806771,%rax
    348036c9:	00 00 00 
    348036cc:	b9 01 00 00 00       	mov    $0x1,%ecx
    348036d1:	db ac 24 d8 05 00 00 	fldt   0x5d8(%rsp)
    348036d8:	d9 e0                	fchs   
    348036da:	89 8c 24 b4 05 00 00 	mov    %ecx,0x5b4(%rsp)
    348036e1:	48 89 84 24 a8 05 00 	mov    %rax,0x5a8(%rsp)
    348036e8:	00 
    348036e9:	db bc 24 9c 05 00 00 	fstpt  0x59c(%rsp)
    348036f0:	e9 89 00 00 00       	jmpq   3480377e <.LBB9_4>

00000000348036f5 <.LBB9_2>:
    348036f5:	48 b8 71 67 80 34 00 	movabs $0x34806771,%rax
    348036fc:	00 00 00 
    348036ff:	48 83 c0 03          	add    $0x3,%rax
    34803703:	b9 01 00 00 00       	mov    $0x1,%ecx
    34803708:	8b 94 24 d0 05 00 00 	mov    0x5d0(%rsp),%edx
    3480370f:	81 e2 00 08 00 00    	and    $0x800,%edx
    34803715:	83 fa 00             	cmp    $0x0,%edx
    34803718:	db ac 24 d8 05 00 00 	fldt   0x5d8(%rsp)
    3480371f:	48 89 84 24 a8 05 00 	mov    %rax,0x5a8(%rsp)
    34803726:	00 
    34803727:	89 8c 24 b4 05 00 00 	mov    %ecx,0x5b4(%rsp)
    3480372e:	db bc 24 9c 05 00 00 	fstpt  0x59c(%rsp)
    34803735:	0f 85 43 00 00 00    	jne    3480377e <.LBB9_4>
    3480373b:	48 b8 71 67 80 34 00 	movabs $0x34806771,%rax
    34803742:	00 00 00 
    34803745:	48 89 c1             	mov    %rax,%rcx
    34803748:	48 83 c1 01          	add    $0x1,%rcx
    3480374c:	48 83 c0 06          	add    $0x6,%rax
    34803750:	8b 94 24 d0 05 00 00 	mov    0x5d0(%rsp),%edx
    34803757:	83 e2 01             	and    $0x1,%edx
    3480375a:	83 fa 00             	cmp    $0x0,%edx
    3480375d:	48 0f 45 c8          	cmovne %rax,%rcx
    34803761:	db ac 24 d8 05 00 00 	fldt   0x5d8(%rsp)
    34803768:	48 89 8c 24 a8 05 00 	mov    %rcx,0x5a8(%rsp)
    3480376f:	00 
    34803770:	89 94 24 b4 05 00 00 	mov    %edx,0x5b4(%rsp)
    34803777:	db bc 24 9c 05 00 00 	fstpt  0x59c(%rsp)

000000003480377e <.LBB9_4>:
    3480377e:	db ac 24 9c 05 00 00 	fldt   0x59c(%rsp)
    34803785:	8b 84 24 b4 05 00 00 	mov    0x5b4(%rsp),%eax
    3480378c:	48 8b 8c 24 a8 05 00 	mov    0x5a8(%rsp),%rcx
    34803793:	00 
    34803794:	48 89 e2             	mov    %rsp,%rdx
    34803797:	d9 c0                	fld    %st(0)
    34803799:	db 3a                	fstpt  (%rdx)
    3480379b:	db bc 24 90 05 00 00 	fstpt  0x590(%rsp)
    348037a2:	89 84 24 8c 05 00 00 	mov    %eax,0x58c(%rsp)
    348037a9:	48 89 8c 24 80 05 00 	mov    %rcx,0x580(%rsp)
    348037b0:	00 
    348037b1:	e8 7a 20 00 00       	callq  34805830 <__fpclassifyl>
    348037b6:	83 f8 01             	cmp    $0x1,%eax
    348037b9:	0f 8f 16 01 00 00    	jg     348038d5 <.LBB9_6>
    348037bf:	be 20 00 00 00       	mov    $0x20,%esi
    348037c4:	8b 84 24 d4 05 00 00 	mov    0x5d4(%rsp),%eax
    348037cb:	83 e0 20             	and    $0x20,%eax
    348037ce:	c1 e8 05             	shr    $0x5,%eax
    348037d1:	b9 84 67 80 34       	mov    $0x34806784,%ecx
    348037d6:	89 ca                	mov    %ecx,%edx
    348037d8:	b9 88 67 80 34       	mov    $0x34806788,%ecx
    348037dd:	89 cf                	mov    %ecx,%edi
    348037df:	85 c0                	test   %eax,%eax
    348037e1:	48 0f 45 fa          	cmovne %rdx,%rdi
    348037e5:	b8 8c 67 80 34       	mov    $0x3480678c,%eax
    348037ea:	89 c2                	mov    %eax,%edx
    348037ec:	b8 90 67 80 34       	mov    $0x34806790,%eax
    348037f1:	41 89 c0             	mov    %eax,%r8d
    348037f4:	4c 0f 45 c2          	cmovne %rdx,%r8
    348037f8:	31 c0                	xor    %eax,%eax
    348037fa:	db ac 24 90 05 00 00 	fldt   0x590(%rsp)
    34803801:	df e8                	fucomip %st(0),%st
    34803803:	8b 8c 24 8c 05 00 00 	mov    0x58c(%rsp),%ecx
    3480380a:	0f 4a c8             	cmovp  %eax,%ecx
    3480380d:	49 0f 4a f8          	cmovp  %r8,%rdi
    34803811:	89 c8                	mov    %ecx,%eax
    34803813:	83 c0 03             	add    $0x3,%eax
    34803816:	44 8b 8c 24 d0 05 00 	mov    0x5d0(%rsp),%r9d
    3480381d:	00 
    3480381e:	41 81 e1 ff ff fe ff 	and    $0xfffeffff,%r9d
    34803825:	48 8b 94 24 c0 05 00 	mov    0x5c0(%rsp),%rdx
    3480382c:	00 
    3480382d:	48 89 bc 24 78 05 00 	mov    %rdi,0x578(%rsp)
    34803834:	00 
    34803835:	48 89 d7             	mov    %rdx,%rdi
    34803838:	8b 94 24 c8 05 00 00 	mov    0x5c8(%rsp),%edx
    3480383f:	89 8c 24 74 05 00 00 	mov    %ecx,0x574(%rsp)
    34803846:	89 c1                	mov    %eax,%ecx
    34803848:	45 89 c8             	mov    %r9d,%r8d
    3480384b:	89 84 24 70 05 00 00 	mov    %eax,0x570(%rsp)
    34803852:	e8 09 fd ff ff       	callq  34803560 <pad>
    34803857:	8b 84 24 74 05 00 00 	mov    0x574(%rsp),%eax
    3480385e:	89 c1                	mov    %eax,%ecx
    34803860:	89 ca                	mov    %ecx,%edx
    34803862:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    34803869:	00 
    3480386a:	48 8b b4 24 80 05 00 	mov    0x580(%rsp),%rsi
    34803871:	00 
    34803872:	e8 d9 f4 ff ff       	callq  34802d50 <out>
    34803877:	b8 03 00 00 00       	mov    $0x3,%eax
    3480387c:	89 c2                	mov    %eax,%edx
    3480387e:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    34803885:	00 
    34803886:	48 8b b4 24 78 05 00 	mov    0x578(%rsp),%rsi
    3480388d:	00 
    3480388e:	e8 bd f4 ff ff       	callq  34802d50 <out>
    34803893:	be 20 00 00 00       	mov    $0x20,%esi
    34803898:	8b 84 24 d0 05 00 00 	mov    0x5d0(%rsp),%eax
    3480389f:	35 00 20 00 00       	xor    $0x2000,%eax
    348038a4:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    348038ab:	00 
    348038ac:	8b 94 24 c8 05 00 00 	mov    0x5c8(%rsp),%edx
    348038b3:	8b 8c 24 70 05 00 00 	mov    0x570(%rsp),%ecx
    348038ba:	41 89 c0             	mov    %eax,%r8d
    348038bd:	e8 9e fc ff ff       	callq  34803560 <pad>
    348038c2:	8b 84 24 70 05 00 00 	mov    0x570(%rsp),%eax
    348038c9:	89 84 24 6c 05 00 00 	mov    %eax,0x56c(%rsp)
    348038d0:	e9 dc 1e 00 00       	jmpq   348057b1 <.LBB9_127>

00000000348038d5 <.LBB9_6>:
    348038d5:	48 89 e0             	mov    %rsp,%rax
    348038d8:	db ac 24 90 05 00 00 	fldt   0x590(%rsp)
    348038df:	db 38                	fstpt  (%rax)
    348038e1:	48 8d bc 24 34 06 00 	lea    0x634(%rsp),%rdi
    348038e8:	00 
    348038e9:	e8 42 20 00 00       	callq  34805930 <frexpl>
    348038ee:	dc c0                	fadd   %st,%st(0)
    348038f0:	d9 ee                	fldz   
    348038f2:	d9 c9                	fxch   %st(1)
    348038f4:	db e9                	fucomi %st(1),%st
    348038f6:	dd d9                	fstp   %st(1)
    348038f8:	0f 9a c1             	setp   %cl
    348038fb:	0f 95 c2             	setne  %dl
    348038fe:	08 ca                	or     %cl,%dl
    34803900:	f6 c2 01             	test   $0x1,%dl
    34803903:	db bc 24 60 05 00 00 	fstpt  0x560(%rsp)
    3480390a:	88 94 24 5f 05 00 00 	mov    %dl,0x55f(%rsp)
    34803911:	0f 85 05 00 00 00    	jne    3480391c <.LBB9_7>
    34803917:	e9 11 00 00 00       	jmpq   3480392d <.LBB9_8>

000000003480391c <.LBB9_7>:
    3480391c:	8b 84 24 34 06 00 00 	mov    0x634(%rsp),%eax
    34803923:	83 c0 ff             	add    $0xffffffff,%eax
    34803926:	89 84 24 34 06 00 00 	mov    %eax,0x634(%rsp)

000000003480392d <.LBB9_8>:
    3480392d:	8b 84 24 d4 05 00 00 	mov    0x5d4(%rsp),%eax
    34803934:	83 c8 20             	or     $0x20,%eax
    34803937:	83 f8 61             	cmp    $0x61,%eax
    3480393a:	89 84 24 58 05 00 00 	mov    %eax,0x558(%rsp)
    34803941:	0f 85 27 06 00 00    	jne    34803f6e <.LBB9_27>
    34803947:	8b 84 24 d4 05 00 00 	mov    0x5d4(%rsp),%eax
    3480394e:	83 e0 20             	and    $0x20,%eax
    34803951:	48 8b 8c 24 80 05 00 	mov    0x580(%rsp),%rcx
    34803958:	00 
    34803959:	48 83 c1 09          	add    $0x9,%rcx
    3480395d:	85 c0                	test   %eax,%eax
    3480395f:	48 8b 94 24 80 05 00 	mov    0x580(%rsp),%rdx
    34803966:	00 
    34803967:	48 0f 45 d1          	cmovne %rcx,%rdx
    3480396b:	8b b4 24 8c 05 00 00 	mov    0x58c(%rsp),%esi
    34803972:	83 ce 02             	or     $0x2,%esi
    34803975:	bf 0f 00 00 00       	mov    $0xf,%edi
    3480397a:	44 8b 84 24 cc 05 00 	mov    0x5cc(%rsp),%r8d
    34803981:	00 
    34803982:	44 29 c7             	sub    %r8d,%edi
    34803985:	45 31 c9             	xor    %r9d,%r9d
    34803988:	41 83 e8 0e          	sub    $0xe,%r8d
    3480398c:	41 0f 47 f9          	cmova  %r9d,%edi
    34803990:	d9 05 ba 2b 00 00    	flds   0x2bba(%rip)        # 34806550 <.Lvsnprintf.f+0xe0>
    34803996:	85 ff                	test   %edi,%edi
    34803998:	db ac 24 60 05 00 00 	fldt   0x560(%rsp)
    3480399f:	89 84 24 54 05 00 00 	mov    %eax,0x554(%rsp)
    348039a6:	48 89 94 24 48 05 00 	mov    %rdx,0x548(%rsp)
    348039ad:	00 
    348039ae:	89 b4 24 44 05 00 00 	mov    %esi,0x544(%rsp)
    348039b5:	d9 c9                	fxch   %st(1)
    348039b7:	db bc 24 38 05 00 00 	fstpt  0x538(%rsp)
    348039be:	44 89 84 24 34 05 00 	mov    %r8d,0x534(%rsp)
    348039c5:	00 
    348039c6:	89 bc 24 30 05 00 00 	mov    %edi,0x530(%rsp)
    348039cd:	db bc 24 24 05 00 00 	fstpt  0x524(%rsp)
    348039d4:	0f 84 b0 00 00 00    	je     34803a8a <.LBB9_15>
    348039da:	e9 00 00 00 00       	jmpq   348039df <.LBB9_10>

00000000348039df <.LBB9_10>:
    348039df:	8b 84 24 30 05 00 00 	mov    0x530(%rsp),%eax
    348039e6:	db ac 24 38 05 00 00 	fldt   0x538(%rsp)
    348039ed:	83 f8 00             	cmp    $0x0,%eax
    348039f0:	89 84 24 20 05 00 00 	mov    %eax,0x520(%rsp)
    348039f7:	db bc 24 14 05 00 00 	fstpt  0x514(%rsp)
    348039fe:	0f 84 3a 00 00 00    	je     34803a3e <.LBB9_12>
    34803a04:	b8 10 00 00 00       	mov    $0x10,%eax
    34803a09:	89 c1                	mov    %eax,%ecx
    34803a0b:	8b 84 24 20 05 00 00 	mov    0x520(%rsp),%eax
    34803a12:	ff c8                	dec    %eax
    34803a14:	d9 05 3a 2b 00 00    	flds   0x2b3a(%rip)        # 34806554 <.Lvsnprintf.f+0xe4>
    34803a1a:	db ac 24 14 05 00 00 	fldt   0x514(%rsp)
    34803a21:	de c9                	fmulp  %st,%st(1)
    34803a23:	48 89 8c 24 08 05 00 	mov    %rcx,0x508(%rsp)
    34803a2a:	00 
    34803a2b:	db bc 24 38 05 00 00 	fstpt  0x538(%rsp)
    34803a32:	89 84 24 30 05 00 00 	mov    %eax,0x530(%rsp)
    34803a39:	e9 a1 ff ff ff       	jmpq   348039df <.LBB9_10>

0000000034803a3e <.LBB9_12>:
    34803a3e:	48 8b 84 24 48 05 00 	mov    0x548(%rsp),%rax
    34803a45:	00 
    34803a46:	80 38 2d             	cmpb   $0x2d,(%rax)
    34803a49:	0f 85 22 00 00 00    	jne    34803a71 <.LBB9_14>
    34803a4f:	db ac 24 60 05 00 00 	fldt   0x560(%rsp)
    34803a56:	d9 e0                	fchs   
    34803a58:	db ac 24 14 05 00 00 	fldt   0x514(%rsp)
    34803a5f:	dc e9                	fsubr  %st,%st(1)
    34803a61:	de c1                	faddp  %st,%st(1)
    34803a63:	d9 e0                	fchs   
    34803a65:	db bc 24 24 05 00 00 	fstpt  0x524(%rsp)
    34803a6c:	e9 19 00 00 00       	jmpq   34803a8a <.LBB9_15>

0000000034803a71 <.LBB9_14>:
    34803a71:	db ac 24 60 05 00 00 	fldt   0x560(%rsp)
    34803a78:	db ac 24 14 05 00 00 	fldt   0x514(%rsp)
    34803a7f:	dc c1                	fadd   %st,%st(1)
    34803a81:	de e9                	fsubrp %st,%st(1)
    34803a83:	db bc 24 24 05 00 00 	fstpt  0x524(%rsp)

0000000034803a8a <.LBB9_15>:
    34803a8a:	db ac 24 24 05 00 00 	fldt   0x524(%rsp)
    34803a91:	31 c0                	xor    %eax,%eax
    34803a93:	8b 8c 24 34 06 00 00 	mov    0x634(%rsp),%ecx
    34803a9a:	29 c8                	sub    %ecx,%eax
    34803a9c:	83 f9 00             	cmp    $0x0,%ecx
    34803a9f:	0f 4c c8             	cmovl  %eax,%ecx
    34803aa2:	48 63 f9             	movslq %ecx,%rdi
    34803aa5:	48 8b b4 24 b8 05 00 	mov    0x5b8(%rsp),%rsi
    34803aac:	00 
    34803aad:	db bc 24 fc 04 00 00 	fstpt  0x4fc(%rsp)
    34803ab4:	e8 17 fa ff ff       	callq  348034d0 <fmt_u>
    34803ab9:	48 8b b4 24 b8 05 00 	mov    0x5b8(%rsp),%rsi
    34803ac0:	00 
    34803ac1:	48 39 f0             	cmp    %rsi,%rax
    34803ac4:	48 89 c7             	mov    %rax,%rdi
    34803ac7:	48 89 84 24 f0 04 00 	mov    %rax,0x4f0(%rsp)
    34803ace:	00 
    34803acf:	48 89 bc 24 e8 04 00 	mov    %rdi,0x4e8(%rsp)
    34803ad6:	00 
    34803ad7:	0f 85 20 00 00 00    	jne    34803afd <.LBB9_17>
    34803add:	48 8b 84 24 f0 04 00 	mov    0x4f0(%rsp),%rax
    34803ae4:	00 
    34803ae5:	48 83 c0 ff          	add    $0xffffffffffffffff,%rax
    34803ae9:	48 8b 8c 24 f0 04 00 	mov    0x4f0(%rsp),%rcx
    34803af0:	00 
    34803af1:	c6 41 ff 30          	movb   $0x30,-0x1(%rcx)
    34803af5:	48 89 84 24 e8 04 00 	mov    %rax,0x4e8(%rsp)
    34803afc:	00 

0000000034803afd <.LBB9_17>:
    34803afd:	48 8b 84 24 e8 04 00 	mov    0x4e8(%rsp),%rax
    34803b04:	00 
    34803b05:	48 8d 8c 24 10 06 00 	lea    0x610(%rsp),%rcx
    34803b0c:	00 
    34803b0d:	8b 94 24 34 06 00 00 	mov    0x634(%rsp),%edx
    34803b14:	c1 fa 1f             	sar    $0x1f,%edx
    34803b17:	83 e2 02             	and    $0x2,%edx
    34803b1a:	83 c2 2b             	add    $0x2b,%edx
    34803b1d:	40 88 d6             	mov    %dl,%sil
    34803b20:	40 88 70 ff          	mov    %sil,-0x1(%rax)
    34803b24:	8b 94 24 d4 05 00 00 	mov    0x5d4(%rsp),%edx
    34803b2b:	83 c2 0f             	add    $0xf,%edx
    34803b2e:	40 88 d6             	mov    %dl,%sil
    34803b31:	48 89 c7             	mov    %rax,%rdi
    34803b34:	48 83 c7 fe          	add    $0xfffffffffffffffe,%rdi
    34803b38:	40 88 70 fe          	mov    %sil,-0x2(%rax)
    34803b3c:	8b 94 24 cc 05 00 00 	mov    0x5cc(%rsp),%edx
    34803b43:	83 fa 00             	cmp    $0x0,%edx
    34803b46:	40 0f 9f c6          	setg   %sil
    34803b4a:	44 8b 84 24 d0 05 00 	mov    0x5d0(%rsp),%r8d
    34803b51:	00 
    34803b52:	41 83 e0 08          	and    $0x8,%r8d
    34803b56:	41 83 f8 00          	cmp    $0x0,%r8d
    34803b5a:	41 0f 95 c1          	setne  %r9b
    34803b5e:	48 89 c8             	mov    %rcx,%rax
    34803b61:	db ac 24 fc 04 00 00 	fldt   0x4fc(%rsp)
    34803b68:	48 89 bc 24 e0 04 00 	mov    %rdi,0x4e0(%rsp)
    34803b6f:	00 
    34803b70:	48 89 8c 24 d8 04 00 	mov    %rcx,0x4d8(%rsp)
    34803b77:	00 
    34803b78:	40 88 b4 24 d7 04 00 	mov    %sil,0x4d7(%rsp)
    34803b7f:	00 
    34803b80:	44 88 8c 24 d6 04 00 	mov    %r9b,0x4d6(%rsp)
    34803b87:	00 
    34803b88:	48 89 84 24 c8 04 00 	mov    %rax,0x4c8(%rsp)
    34803b8f:	00 
    34803b90:	db bc 24 bc 04 00 00 	fstpt  0x4bc(%rsp)

0000000034803b97 <.LBB9_18>:
    34803b97:	db ac 24 bc 04 00 00 	fldt   0x4bc(%rsp)
    34803b9e:	48 8b 84 24 c8 04 00 	mov    0x4c8(%rsp),%rax
    34803ba5:	00 
    34803ba6:	b9 10 00 00 00       	mov    $0x10,%ecx
    34803bab:	89 ca                	mov    %ecx,%edx
    34803bad:	d9 bc 24 e6 05 00 00 	fnstcw 0x5e6(%rsp)
    34803bb4:	66 8b b4 24 e6 05 00 	mov    0x5e6(%rsp),%si
    34803bbb:	00 
    34803bbc:	66 c7 84 24 e6 05 00 	movw   $0xc7f,0x5e6(%rsp)
    34803bc3:	00 7f 0c 
    34803bc6:	d9 ac 24 e6 05 00 00 	fldcw  0x5e6(%rsp)
    34803bcd:	66 89 b4 24 e6 05 00 	mov    %si,0x5e6(%rsp)
    34803bd4:	00 
    34803bd5:	db 94 24 e8 05 00 00 	fistl  0x5e8(%rsp)
    34803bdc:	d9 ac 24 e6 05 00 00 	fldcw  0x5e6(%rsp)
    34803be3:	48 63 bc 24 e8 05 00 	movslq 0x5e8(%rsp),%rdi
    34803bea:	00 
    34803beb:	89 f9                	mov    %edi,%ecx
    34803bed:	44 0f b6 87 50 67 80 	movzbl 0x34806750(%rdi),%r8d
    34803bf4:	34 
    34803bf5:	44 8b 8c 24 54 05 00 	mov    0x554(%rsp),%r9d
    34803bfc:	00 
    34803bfd:	45 09 c1             	or     %r8d,%r9d
    34803c00:	45 88 ca             	mov    %r9b,%r10b
    34803c03:	48 89 c7             	mov    %rax,%rdi
    34803c06:	48 ff c7             	inc    %rdi
    34803c09:	44 88 10             	mov    %r10b,(%rax)
    34803c0c:	89 8c 24 ec 05 00 00 	mov    %ecx,0x5ec(%rsp)
    34803c13:	db 84 24 ec 05 00 00 	fildl  0x5ec(%rsp)
    34803c1a:	de e9                	fsubrp %st,%st(1)
    34803c1c:	d9 05 32 29 00 00    	flds   0x2932(%rip)        # 34806554 <.Lvsnprintf.f+0xe4>
    34803c22:	de c9                	fmulp  %st,%st(1)
    34803c24:	49 89 fb             	mov    %rdi,%r11
    34803c27:	48 8b 9c 24 d8 04 00 	mov    0x4d8(%rsp),%rbx
    34803c2e:	00 
    34803c2f:	49 29 db             	sub    %rbx,%r11
    34803c32:	49 83 fb 01          	cmp    $0x1,%r11
    34803c36:	49 89 fb             	mov    %rdi,%r11
    34803c39:	48 89 bc 24 b0 04 00 	mov    %rdi,0x4b0(%rsp)
    34803c40:	00 
    34803c41:	48 89 84 24 a8 04 00 	mov    %rax,0x4a8(%rsp)
    34803c48:	00 
    34803c49:	48 89 94 24 a0 04 00 	mov    %rdx,0x4a0(%rsp)
    34803c50:	00 
    34803c51:	db bc 24 94 04 00 00 	fstpt  0x494(%rsp)
    34803c58:	4c 89 9c 24 88 04 00 	mov    %r11,0x488(%rsp)
    34803c5f:	00 
    34803c60:	0f 85 63 00 00 00    	jne    34803cc9 <.LBB9_21>
    34803c66:	d9 ee                	fldz   
    34803c68:	db ac 24 94 04 00 00 	fldt   0x494(%rsp)
    34803c6f:	df e9                	fucomip %st(1),%st
    34803c71:	dd d8                	fstp   %st(0)
    34803c73:	0f 9a c0             	setp   %al
    34803c76:	0f 95 c1             	setne  %cl
    34803c79:	08 c1                	or     %al,%cl
    34803c7b:	8a 84 24 d7 04 00 00 	mov    0x4d7(%rsp),%al
    34803c82:	08 c8                	or     %cl,%al
    34803c84:	8a 8c 24 d6 04 00 00 	mov    0x4d6(%rsp),%cl
    34803c8b:	08 c8                	or     %cl,%al
    34803c8d:	a8 01                	test   $0x1,%al
    34803c8f:	48 8b 94 24 b0 04 00 	mov    0x4b0(%rsp),%rdx
    34803c96:	00 
    34803c97:	48 89 94 24 88 04 00 	mov    %rdx,0x488(%rsp)
    34803c9e:	00 
    34803c9f:	0f 85 05 00 00 00    	jne    34803caa <.LBB9_20>
    34803ca5:	e9 1f 00 00 00       	jmpq   34803cc9 <.LBB9_21>

0000000034803caa <.LBB9_20>:
    34803caa:	48 8b 84 24 a8 04 00 	mov    0x4a8(%rsp),%rax
    34803cb1:	00 
    34803cb2:	48 83 c0 02          	add    $0x2,%rax
    34803cb6:	48 8b 8c 24 b0 04 00 	mov    0x4b0(%rsp),%rcx
    34803cbd:	00 
    34803cbe:	c6 01 2e             	movb   $0x2e,(%rcx)
    34803cc1:	48 89 84 24 88 04 00 	mov    %rax,0x488(%rsp)
    34803cc8:	00 

0000000034803cc9 <.LBB9_21>:
    34803cc9:	48 8b 84 24 88 04 00 	mov    0x488(%rsp),%rax
    34803cd0:	00 
    34803cd1:	d9 ee                	fldz   
    34803cd3:	db ac 24 94 04 00 00 	fldt   0x494(%rsp)
    34803cda:	db e9                	fucomi %st(1),%st
    34803cdc:	dd d9                	fstp   %st(1)
    34803cde:	48 89 c1             	mov    %rax,%rcx
    34803ce1:	48 89 84 24 80 04 00 	mov    %rax,0x480(%rsp)
    34803ce8:	00 
    34803ce9:	db bc 24 bc 04 00 00 	fstpt  0x4bc(%rsp)
    34803cf0:	48 89 8c 24 c8 04 00 	mov    %rcx,0x4c8(%rsp)
    34803cf7:	00 
    34803cf8:	0f 85 99 fe ff ff    	jne    34803b97 <.LBB9_18>
    34803cfe:	0f 8b 05 00 00 00    	jnp    34803d09 <.LBB9_22>
    34803d04:	e9 8e fe ff ff       	jmpq   34803b97 <.LBB9_18>

0000000034803d09 <.LBB9_22>:
    34803d09:	8b 84 24 cc 05 00 00 	mov    0x5cc(%rsp),%eax
    34803d10:	83 f8 00             	cmp    $0x0,%eax
    34803d13:	0f 84 6c 00 00 00    	je     34803d85 <.LBB9_25>
    34803d19:	48 c7 c0 fe ff ff ff 	mov    $0xfffffffffffffffe,%rax
    34803d20:	48 8b 8c 24 d8 04 00 	mov    0x4d8(%rsp),%rcx
    34803d27:	00 
    34803d28:	48 29 c8             	sub    %rcx,%rax
    34803d2b:	48 8b 94 24 80 04 00 	mov    0x480(%rsp),%rdx
    34803d32:	00 
    34803d33:	48 01 d0             	add    %rdx,%rax
    34803d36:	8b b4 24 cc 05 00 00 	mov    0x5cc(%rsp),%esi
    34803d3d:	48 63 fe             	movslq %esi,%rdi
    34803d40:	48 39 f8             	cmp    %rdi,%rax
    34803d43:	0f 8d 3c 00 00 00    	jge    34803d85 <.LBB9_25>
    34803d49:	31 c0                	xor    %eax,%eax
    34803d4b:	89 c1                	mov    %eax,%ecx
    34803d4d:	8b 84 24 cc 05 00 00 	mov    0x5cc(%rsp),%eax
    34803d54:	83 c0 02             	add    $0x2,%eax
    34803d57:	48 63 d0             	movslq %eax,%rdx
    34803d5a:	48 8b b4 24 e0 04 00 	mov    0x4e0(%rsp),%rsi
    34803d61:	00 
    34803d62:	48 29 f1             	sub    %rsi,%rcx
    34803d65:	48 8b bc 24 b8 05 00 	mov    0x5b8(%rsp),%rdi
    34803d6c:	00 
    34803d6d:	48 01 d7             	add    %rdx,%rdi
    34803d70:	48 89 8c 24 78 04 00 	mov    %rcx,0x478(%rsp)
    34803d77:	00 
    34803d78:	48 89 bc 24 70 04 00 	mov    %rdi,0x470(%rsp)
    34803d7f:	00 
    34803d80:	e9 36 00 00 00       	jmpq   34803dbb <.LBB9_26>

0000000034803d85 <.LBB9_25>:
    34803d85:	48 8b 84 24 b8 05 00 	mov    0x5b8(%rsp),%rax
    34803d8c:	00 
    34803d8d:	48 8b 8c 24 d8 04 00 	mov    0x4d8(%rsp),%rcx
    34803d94:	00 
    34803d95:	48 29 c8             	sub    %rcx,%rax
    34803d98:	48 8b 94 24 e0 04 00 	mov    0x4e0(%rsp),%rdx
    34803d9f:	00 
    34803da0:	48 29 d0             	sub    %rdx,%rax
    34803da3:	48 8b b4 24 80 04 00 	mov    0x480(%rsp),%rsi
    34803daa:	00 
    34803dab:	48 89 b4 24 78 04 00 	mov    %rsi,0x478(%rsp)
    34803db2:	00 
    34803db3:	48 89 84 24 70 04 00 	mov    %rax,0x470(%rsp)
    34803dba:	00 

0000000034803dbb <.LBB9_26>:
    34803dbb:	48 8b 84 24 70 04 00 	mov    0x470(%rsp),%rax
    34803dc2:	00 
    34803dc3:	48 8b 8c 24 78 04 00 	mov    0x478(%rsp),%rcx
    34803dca:	00 
    34803dcb:	be 20 00 00 00       	mov    $0x20,%esi
    34803dd0:	48 01 c8             	add    %rcx,%rax
    34803dd3:	89 c2                	mov    %eax,%edx
    34803dd5:	8b bc 24 44 05 00 00 	mov    0x544(%rsp),%edi
    34803ddc:	01 d7                	add    %edx,%edi
    34803dde:	48 8b 8c 24 c0 05 00 	mov    0x5c0(%rsp),%rcx
    34803de5:	00 
    34803de6:	89 bc 24 6c 04 00 00 	mov    %edi,0x46c(%rsp)
    34803ded:	48 89 cf             	mov    %rcx,%rdi
    34803df0:	8b 94 24 c8 05 00 00 	mov    0x5c8(%rsp),%edx
    34803df7:	8b 8c 24 6c 04 00 00 	mov    0x46c(%rsp),%ecx
    34803dfe:	44 8b 84 24 d0 05 00 	mov    0x5d0(%rsp),%r8d
    34803e05:	00 
    34803e06:	48 89 84 24 60 04 00 	mov    %rax,0x460(%rsp)
    34803e0d:	00 
    34803e0e:	e8 4d f7 ff ff       	callq  34803560 <pad>
    34803e13:	8b 8c 24 44 05 00 00 	mov    0x544(%rsp),%ecx
    34803e1a:	89 ca                	mov    %ecx,%edx
    34803e1c:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    34803e23:	00 
    34803e24:	48 8b b4 24 48 05 00 	mov    0x548(%rsp),%rsi
    34803e2b:	00 
    34803e2c:	e8 1f ef ff ff       	callq  34802d50 <out>
    34803e31:	be 30 00 00 00       	mov    $0x30,%esi
    34803e36:	8b 8c 24 d0 05 00 00 	mov    0x5d0(%rsp),%ecx
    34803e3d:	81 f1 00 00 01 00    	xor    $0x10000,%ecx
    34803e43:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    34803e4a:	00 
    34803e4b:	8b 94 24 c8 05 00 00 	mov    0x5c8(%rsp),%edx
    34803e52:	44 8b 84 24 6c 04 00 	mov    0x46c(%rsp),%r8d
    34803e59:	00 
    34803e5a:	89 8c 24 5c 04 00 00 	mov    %ecx,0x45c(%rsp)
    34803e61:	44 89 c1             	mov    %r8d,%ecx
    34803e64:	44 8b 84 24 5c 04 00 	mov    0x45c(%rsp),%r8d
    34803e6b:	00 
    34803e6c:	e8 ef f6 ff ff       	callq  34803560 <pad>
    34803e71:	48 8b 84 24 80 04 00 	mov    0x480(%rsp),%rax
    34803e78:	00 
    34803e79:	48 8b bc 24 d8 04 00 	mov    0x4d8(%rsp),%rdi
    34803e80:	00 
    34803e81:	48 29 f8             	sub    %rdi,%rax
    34803e84:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    34803e8b:	00 
    34803e8c:	48 8b b4 24 d8 04 00 	mov    0x4d8(%rsp),%rsi
    34803e93:	00 
    34803e94:	48 89 c2             	mov    %rax,%rdx
    34803e97:	48 89 84 24 50 04 00 	mov    %rax,0x450(%rsp)
    34803e9e:	00 
    34803e9f:	e8 ac ee ff ff       	callq  34802d50 <out>
    34803ea4:	be 30 00 00 00       	mov    $0x30,%esi
    34803ea9:	31 c9                	xor    %ecx,%ecx
    34803eab:	48 8b 84 24 b8 05 00 	mov    0x5b8(%rsp),%rax
    34803eb2:	00 
    34803eb3:	48 8b 94 24 e0 04 00 	mov    0x4e0(%rsp),%rdx
    34803eba:	00 
    34803ebb:	48 29 d0             	sub    %rdx,%rax
    34803ebe:	48 8b bc 24 50 04 00 	mov    0x450(%rsp),%rdi
    34803ec5:	00 
    34803ec6:	48 01 c7             	add    %rax,%rdi
    34803ec9:	4c 8b 8c 24 60 04 00 	mov    0x460(%rsp),%r9
    34803ed0:	00 
    34803ed1:	49 29 f9             	sub    %rdi,%r9
    34803ed4:	45 89 c8             	mov    %r9d,%r8d
    34803ed7:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    34803ede:	00 
    34803edf:	44 89 c2             	mov    %r8d,%edx
    34803ee2:	89 8c 24 4c 04 00 00 	mov    %ecx,0x44c(%rsp)
    34803ee9:	44 8b 84 24 4c 04 00 	mov    0x44c(%rsp),%r8d
    34803ef0:	00 
    34803ef1:	48 89 84 24 40 04 00 	mov    %rax,0x440(%rsp)
    34803ef8:	00 
    34803ef9:	e8 62 f6 ff ff       	callq  34803560 <pad>
    34803efe:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    34803f05:	00 
    34803f06:	48 8b b4 24 e0 04 00 	mov    0x4e0(%rsp),%rsi
    34803f0d:	00 
    34803f0e:	48 8b 94 24 40 04 00 	mov    0x440(%rsp),%rdx
    34803f15:	00 
    34803f16:	e8 35 ee ff ff       	callq  34802d50 <out>
    34803f1b:	be 20 00 00 00       	mov    $0x20,%esi
    34803f20:	8b 8c 24 d0 05 00 00 	mov    0x5d0(%rsp),%ecx
    34803f27:	81 f1 00 20 00 00    	xor    $0x2000,%ecx
    34803f2d:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    34803f34:	00 
    34803f35:	8b 94 24 c8 05 00 00 	mov    0x5c8(%rsp),%edx
    34803f3c:	44 8b 84 24 6c 04 00 	mov    0x46c(%rsp),%r8d
    34803f43:	00 
    34803f44:	89 8c 24 3c 04 00 00 	mov    %ecx,0x43c(%rsp)
    34803f4b:	44 89 c1             	mov    %r8d,%ecx
    34803f4e:	44 8b 84 24 3c 04 00 	mov    0x43c(%rsp),%r8d
    34803f55:	00 
    34803f56:	e8 05 f6 ff ff       	callq  34803560 <pad>
    34803f5b:	8b 8c 24 6c 04 00 00 	mov    0x46c(%rsp),%ecx
    34803f62:	89 8c 24 6c 05 00 00 	mov    %ecx,0x56c(%rsp)
    34803f69:	e9 43 18 00 00       	jmpq   348057b1 <.LBB9_127>

0000000034803f6e <.LBB9_27>:
    34803f6e:	b8 06 00 00 00       	mov    $0x6,%eax
    34803f73:	8b 8c 24 cc 05 00 00 	mov    0x5cc(%rsp),%ecx
    34803f7a:	83 f9 00             	cmp    $0x0,%ecx
    34803f7d:	0f 4c c8             	cmovl  %eax,%ecx
    34803f80:	8a 94 24 5f 05 00 00 	mov    0x55f(%rsp),%dl
    34803f87:	f6 c2 01             	test   $0x1,%dl
    34803f8a:	db ac 24 60 05 00 00 	fldt   0x560(%rsp)
    34803f91:	89 8c 24 38 04 00 00 	mov    %ecx,0x438(%rsp)
    34803f98:	db bc 24 2c 04 00 00 	fstpt  0x42c(%rsp)
    34803f9f:	0f 85 05 00 00 00    	jne    34803faa <.LBB9_28>
    34803fa5:	e9 36 00 00 00       	jmpq   34803fe0 <.LBB9_29>

0000000034803faa <.LBB9_28>:
    34803faa:	b8 00 00 00 10       	mov    $0x10000000,%eax
    34803faf:	89 c1                	mov    %eax,%ecx
    34803fb1:	d9 05 89 25 00 00    	flds   0x2589(%rip)        # 34806540 <.Lvsnprintf.f+0xd0>
    34803fb7:	db ac 24 60 05 00 00 	fldt   0x560(%rsp)
    34803fbe:	de c9                	fmulp  %st,%st(1)
    34803fc0:	8b 84 24 34 06 00 00 	mov    0x634(%rsp),%eax
    34803fc7:	83 c0 e4             	add    $0xffffffe4,%eax
    34803fca:	89 84 24 34 06 00 00 	mov    %eax,0x634(%rsp)
    34803fd1:	48 89 8c 24 20 04 00 	mov    %rcx,0x420(%rsp)
    34803fd8:	00 
    34803fd9:	db bc 24 2c 04 00 00 	fstpt  0x42c(%rsp)

0000000034803fe0 <.LBB9_29>:
    34803fe0:	db ac 24 2c 04 00 00 	fldt   0x42c(%rsp)
    34803fe7:	48 b8 e0 70 a0 34 00 	movabs $0x34a070e0,%rax
    34803fee:	00 00 00 
    34803ff1:	48 89 c1             	mov    %rax,%rcx
    34803ff4:	48 81 c1 a8 1b 00 00 	add    $0x1ba8,%rcx
    34803ffb:	83 bc 24 34 06 00 00 	cmpl   $0x0,0x634(%rsp)
    34804002:	00 
    34804003:	48 0f 4c c8          	cmovl  %rax,%rcx
    34804007:	48 89 c8             	mov    %rcx,%rax
    3480400a:	48 89 84 24 18 04 00 	mov    %rax,0x418(%rsp)
    34804011:	00 
    34804012:	48 89 8c 24 10 04 00 	mov    %rcx,0x410(%rsp)
    34804019:	00 
    3480401a:	db bc 24 04 04 00 00 	fstpt  0x404(%rsp)

0000000034804021 <.LBB9_30>:
    34804021:	db ac 24 04 04 00 00 	fldt   0x404(%rsp)
    34804028:	48 8b 84 24 18 04 00 	mov    0x418(%rsp),%rax
    3480402f:	00 
    34804030:	d9 bc 24 e4 05 00 00 	fnstcw 0x5e4(%rsp)
    34804037:	66 8b 8c 24 e4 05 00 	mov    0x5e4(%rsp),%cx
    3480403e:	00 
    3480403f:	66 c7 84 24 e4 05 00 	movw   $0xc7f,0x5e4(%rsp)
    34804046:	00 7f 0c 
    34804049:	d9 ac 24 e4 05 00 00 	fldcw  0x5e4(%rsp)
    34804050:	66 89 8c 24 e4 05 00 	mov    %cx,0x5e4(%rsp)
    34804057:	00 
    34804058:	d9 c0                	fld    %st(0)
    3480405a:	df bc 24 f8 05 00 00 	fistpll 0x5f8(%rsp)
    34804061:	d9 ac 24 e4 05 00 00 	fldcw  0x5e4(%rsp)
    34804068:	8b 94 24 f8 05 00 00 	mov    0x5f8(%rsp),%edx
    3480406f:	89 d6                	mov    %edx,%esi
    34804071:	89 f2                	mov    %esi,%edx
    34804073:	89 10                	mov    %edx,(%rax)
    34804075:	48 83 c0 04          	add    $0x4,%rax
    34804079:	48 89 b4 24 f0 05 00 	mov    %rsi,0x5f0(%rsp)
    34804080:	00 
    34804081:	df ac 24 f0 05 00 00 	fildll 0x5f0(%rsp)
    34804088:	de e9                	fsubrp %st,%st(1)
    3480408a:	d9 05 b4 24 00 00    	flds   0x24b4(%rip)        # 34806544 <.Lvsnprintf.f+0xd4>
    34804090:	de c9                	fmulp  %st,%st(1)
    34804092:	d9 ee                	fldz   
    34804094:	d9 c9                	fxch   %st(1)
    34804096:	db e9                	fucomi %st(1),%st
    34804098:	dd d9                	fstp   %st(1)
    3480409a:	48 89 c6             	mov    %rax,%rsi
    3480409d:	48 8b bc 24 10 04 00 	mov    0x410(%rsp),%rdi
    348040a4:	00 
    348040a5:	db bc 24 04 04 00 00 	fstpt  0x404(%rsp)
    348040ac:	48 89 b4 24 18 04 00 	mov    %rsi,0x418(%rsp)
    348040b3:	00 
    348040b4:	48 89 84 24 f8 03 00 	mov    %rax,0x3f8(%rsp)
    348040bb:	00 
    348040bc:	48 89 bc 24 f0 03 00 	mov    %rdi,0x3f0(%rsp)
    348040c3:	00 
    348040c4:	0f 85 57 ff ff ff    	jne    34804021 <.LBB9_30>
    348040ca:	0f 8b 05 00 00 00    	jnp    348040d5 <.LBB9_31>
    348040d0:	e9 4c ff ff ff       	jmpq   34804021 <.LBB9_30>

00000000348040d5 <.LBB9_31>:
    348040d5:	48 8b 84 24 f0 03 00 	mov    0x3f0(%rsp),%rax
    348040dc:	00 
    348040dd:	48 8b 8c 24 f8 03 00 	mov    0x3f8(%rsp),%rcx
    348040e4:	00 
    348040e5:	8b 94 24 34 06 00 00 	mov    0x634(%rsp),%edx
    348040ec:	83 fa 00             	cmp    $0x0,%edx
    348040ef:	48 89 84 24 e8 03 00 	mov    %rax,0x3e8(%rsp)
    348040f6:	00 
    348040f7:	48 89 8c 24 e0 03 00 	mov    %rcx,0x3e0(%rsp)
    348040fe:	00 
    348040ff:	89 94 24 dc 03 00 00 	mov    %edx,0x3dc(%rsp)
    34804106:	0f 8f 6b 00 00 00    	jg     34804177 <.LBB9_33>
    3480410c:	b8 09 00 00 00       	mov    $0x9,%eax
    34804111:	8b 8c 24 38 04 00 00 	mov    0x438(%rsp),%ecx
    34804118:	83 c1 1d             	add    $0x1d,%ecx
    3480411b:	89 84 24 d8 03 00 00 	mov    %eax,0x3d8(%rsp)
    34804122:	89 c8                	mov    %ecx,%eax
    34804124:	99                   	cltd   
    34804125:	8b 8c 24 d8 03 00 00 	mov    0x3d8(%rsp),%ecx
    3480412c:	f7 f9                	idiv   %ecx
    3480412e:	83 c0 01             	add    $0x1,%eax
    34804131:	8b b4 24 58 05 00 00 	mov    0x558(%rsp),%esi
    34804138:	83 fe 66             	cmp    $0x66,%esi
    3480413b:	40 0f 94 c7          	sete   %dil
    3480413f:	4c 63 c0             	movslq %eax,%r8
    34804142:	4c 8b 8c 24 e0 03 00 	mov    0x3e0(%rsp),%r9
    34804149:	00 
    3480414a:	4c 8b 94 24 e8 03 00 	mov    0x3e8(%rsp),%r10
    34804151:	00 
    34804152:	40 88 bc 24 d7 03 00 	mov    %dil,0x3d7(%rsp)
    34804159:	00 
    3480415a:	4c 89 84 24 c8 03 00 	mov    %r8,0x3c8(%rsp)
    34804161:	00 
    34804162:	4c 89 8c 24 c0 03 00 	mov    %r9,0x3c0(%rsp)
    34804169:	00 
    3480416a:	4c 89 94 24 b8 03 00 	mov    %r10,0x3b8(%rsp)
    34804171:	00 
    34804172:	e9 e6 01 00 00       	jmpq   3480435d <.LBB9_43>

0000000034804177 <.LBB9_33>:
    34804177:	31 c0                	xor    %eax,%eax
    34804179:	b9 1d 00 00 00       	mov    $0x1d,%ecx
    3480417e:	8b 94 24 dc 03 00 00 	mov    0x3dc(%rsp),%edx
    34804185:	83 fa 1d             	cmp    $0x1d,%edx
    34804188:	0f 4c ca             	cmovl  %edx,%ecx
    3480418b:	89 ce                	mov    %ecx,%esi
    3480418d:	89 f7                	mov    %esi,%edi
    3480418f:	4c 8b 84 24 e0 03 00 	mov    0x3e0(%rsp),%r8
    34804196:	00 
    34804197:	48 89 bc 24 b0 03 00 	mov    %rdi,0x3b0(%rsp)
    3480419e:	00 
    3480419f:	89 8c 24 ac 03 00 00 	mov    %ecx,0x3ac(%rsp)
    348041a6:	89 84 24 a8 03 00 00 	mov    %eax,0x3a8(%rsp)
    348041ad:	4c 89 84 24 a0 03 00 	mov    %r8,0x3a0(%rsp)
    348041b4:	00 

00000000348041b5 <.LBB9_34>:
    348041b5:	48 8b 84 24 a0 03 00 	mov    0x3a0(%rsp),%rax
    348041bc:	00 
    348041bd:	8b 8c 24 a8 03 00 00 	mov    0x3a8(%rsp),%ecx
    348041c4:	48 83 c0 fc          	add    $0xfffffffffffffffc,%rax
    348041c8:	48 8b 94 24 e8 03 00 	mov    0x3e8(%rsp),%rdx
    348041cf:	00 
    348041d0:	48 39 d0             	cmp    %rdx,%rax
    348041d3:	89 8c 24 9c 03 00 00 	mov    %ecx,0x39c(%rsp)
    348041da:	48 89 84 24 90 03 00 	mov    %rax,0x390(%rsp)
    348041e1:	00 
    348041e2:	0f 82 87 00 00 00    	jb     3480426f <.LBB9_36>
    348041e8:	b8 00 ca 9a 3b       	mov    $0x3b9aca00,%eax
    348041ed:	89 c1                	mov    %eax,%ecx
    348041ef:	48 8b 94 24 90 03 00 	mov    0x390(%rsp),%rdx
    348041f6:	00 
    348041f7:	8b 02                	mov    (%rdx),%eax
    348041f9:	89 c6                	mov    %eax,%esi
    348041fb:	48 8b bc 24 b0 03 00 	mov    0x3b0(%rsp),%rdi
    34804202:	00 
    34804203:	48 89 8c 24 88 03 00 	mov    %rcx,0x388(%rsp)
    3480420a:	00 
    3480420b:	48 89 f9             	mov    %rdi,%rcx
    3480420e:	48 d3 e6             	shl    %cl,%rsi
    34804211:	8b 84 24 9c 03 00 00 	mov    0x39c(%rsp),%eax
    34804218:	41 89 c0             	mov    %eax,%r8d
    3480421b:	45 89 c1             	mov    %r8d,%r9d
    3480421e:	4c 01 ce             	add    %r9,%rsi
    34804221:	48 89 f0             	mov    %rsi,%rax
    34804224:	45 31 c0             	xor    %r8d,%r8d
    34804227:	44 89 c2             	mov    %r8d,%edx
    3480422a:	4c 8b 8c 24 88 03 00 	mov    0x388(%rsp),%r9
    34804231:	00 
    34804232:	49 f7 f1             	div    %r9
    34804235:	41 89 d0             	mov    %edx,%r8d
    34804238:	48 8b 94 24 90 03 00 	mov    0x390(%rsp),%rdx
    3480423f:	00 
    34804240:	44 89 02             	mov    %r8d,(%rdx)
    34804243:	48 89 f0             	mov    %rsi,%rax
    34804246:	45 31 c0             	xor    %r8d,%r8d
    34804249:	44 89 c2             	mov    %r8d,%edx
    3480424c:	49 f7 f1             	div    %r9
    3480424f:	41 89 c0             	mov    %eax,%r8d
    34804252:	48 8b 84 24 90 03 00 	mov    0x390(%rsp),%rax
    34804259:	00 
    3480425a:	44 89 84 24 a8 03 00 	mov    %r8d,0x3a8(%rsp)
    34804261:	00 
    34804262:	48 89 84 24 a0 03 00 	mov    %rax,0x3a0(%rsp)
    34804269:	00 
    3480426a:	e9 46 ff ff ff       	jmpq   348041b5 <.LBB9_34>

000000003480426f <.LBB9_36>:
    3480426f:	8b 84 24 9c 03 00 00 	mov    0x39c(%rsp),%eax
    34804276:	83 f8 00             	cmp    $0x0,%eax
    34804279:	48 8b 8c 24 e8 03 00 	mov    0x3e8(%rsp),%rcx
    34804280:	00 
    34804281:	48 89 8c 24 80 03 00 	mov    %rcx,0x380(%rsp)
    34804288:	00 
    34804289:	0f 84 26 00 00 00    	je     348042b5 <.LBB9_38>
    3480428f:	48 8b 84 24 e8 03 00 	mov    0x3e8(%rsp),%rax
    34804296:	00 
    34804297:	48 83 c0 fc          	add    $0xfffffffffffffffc,%rax
    3480429b:	48 8b 8c 24 e8 03 00 	mov    0x3e8(%rsp),%rcx
    348042a2:	00 
    348042a3:	8b 94 24 9c 03 00 00 	mov    0x39c(%rsp),%edx
    348042aa:	89 51 fc             	mov    %edx,-0x4(%rcx)
    348042ad:	48 89 84 24 80 03 00 	mov    %rax,0x380(%rsp)
    348042b4:	00 

00000000348042b5 <.LBB9_38>:
    348042b5:	48 8b 84 24 80 03 00 	mov    0x380(%rsp),%rax
    348042bc:	00 
    348042bd:	48 8b 8c 24 e0 03 00 	mov    0x3e0(%rsp),%rcx
    348042c4:	00 
    348042c5:	48 89 84 24 78 03 00 	mov    %rax,0x378(%rsp)
    348042cc:	00 
    348042cd:	48 89 8c 24 70 03 00 	mov    %rcx,0x370(%rsp)
    348042d4:	00 

00000000348042d5 <.LBB9_39>:
    348042d5:	48 8b 84 24 70 03 00 	mov    0x370(%rsp),%rax
    348042dc:	00 
    348042dd:	48 8b 8c 24 78 03 00 	mov    0x378(%rsp),%rcx
    348042e4:	00 
    348042e5:	48 39 c8             	cmp    %rcx,%rax
    348042e8:	48 89 84 24 68 03 00 	mov    %rax,0x368(%rsp)
    348042ef:	00 
    348042f0:	0f 86 2b 00 00 00    	jbe    34804321 <.LBB9_42>
    348042f6:	48 8b 84 24 68 03 00 	mov    0x368(%rsp),%rax
    348042fd:	00 
    348042fe:	83 78 fc 00          	cmpl   $0x0,-0x4(%rax)
    34804302:	0f 85 19 00 00 00    	jne    34804321 <.LBB9_42>
    34804308:	48 8b 84 24 68 03 00 	mov    0x368(%rsp),%rax
    3480430f:	00 
    34804310:	48 83 c0 fc          	add    $0xfffffffffffffffc,%rax
    34804314:	48 89 84 24 70 03 00 	mov    %rax,0x370(%rsp)
    3480431b:	00 
    3480431c:	e9 b4 ff ff ff       	jmpq   348042d5 <.LBB9_39>

0000000034804321 <.LBB9_42>:
    34804321:	8b 84 24 34 06 00 00 	mov    0x634(%rsp),%eax
    34804328:	8b 8c 24 ac 03 00 00 	mov    0x3ac(%rsp),%ecx
    3480432f:	29 c8                	sub    %ecx,%eax
    34804331:	89 84 24 34 06 00 00 	mov    %eax,0x634(%rsp)
    34804338:	48 8b 94 24 68 03 00 	mov    0x368(%rsp),%rdx
    3480433f:	00 
    34804340:	48 8b b4 24 78 03 00 	mov    0x378(%rsp),%rsi
    34804347:	00 
    34804348:	48 89 94 24 f8 03 00 	mov    %rdx,0x3f8(%rsp)
    3480434f:	00 
    34804350:	48 89 b4 24 f0 03 00 	mov    %rsi,0x3f0(%rsp)
    34804357:	00 
    34804358:	e9 78 fd ff ff       	jmpq   348040d5 <.LBB9_31>

000000003480435d <.LBB9_43>:
    3480435d:	48 8b 84 24 b8 03 00 	mov    0x3b8(%rsp),%rax
    34804364:	00 
    34804365:	48 8b 8c 24 c0 03 00 	mov    0x3c0(%rsp),%rcx
    3480436c:	00 
    3480436d:	8b 94 24 34 06 00 00 	mov    0x634(%rsp),%edx
    34804374:	83 fa 00             	cmp    $0x0,%edx
    34804377:	48 89 84 24 60 03 00 	mov    %rax,0x360(%rsp)
    3480437e:	00 
    3480437f:	48 89 8c 24 58 03 00 	mov    %rcx,0x358(%rsp)
    34804386:	00 
    34804387:	89 94 24 54 03 00 00 	mov    %edx,0x354(%rsp)
    3480438e:	0f 8d e7 01 00 00    	jge    3480457b <.LBB9_50>
    34804394:	31 c0                	xor    %eax,%eax
    34804396:	b9 00 ca 9a 3b       	mov    $0x3b9aca00,%ecx
    3480439b:	ba 01 00 00 00       	mov    $0x1,%edx
    348043a0:	be 09 00 00 00       	mov    $0x9,%esi
    348043a5:	89 c7                	mov    %eax,%edi
    348043a7:	44 8b 84 24 54 03 00 	mov    0x354(%rsp),%r8d
    348043ae:	00 
    348043af:	44 29 c7             	sub    %r8d,%edi
    348043b2:	83 ff 09             	cmp    $0x9,%edi
    348043b5:	0f 4c f7             	cmovl  %edi,%esi
    348043b8:	89 8c 24 50 03 00 00 	mov    %ecx,0x350(%rsp)
    348043bf:	89 f1                	mov    %esi,%ecx
    348043c1:	d3 e2                	shl    %cl,%edx
    348043c3:	83 c2 ff             	add    $0xffffffff,%edx
    348043c6:	89 f1                	mov    %esi,%ecx
    348043c8:	8b bc 24 50 03 00 00 	mov    0x350(%rsp),%edi
    348043cf:	d3 ef                	shr    %cl,%edi
    348043d1:	4c 8b 8c 24 60 03 00 	mov    0x360(%rsp),%r9
    348043d8:	00 
    348043d9:	4c 89 8c 24 48 03 00 	mov    %r9,0x348(%rsp)
    348043e0:	00 
    348043e1:	89 b4 24 44 03 00 00 	mov    %esi,0x344(%rsp)
    348043e8:	89 94 24 40 03 00 00 	mov    %edx,0x340(%rsp)
    348043ef:	89 bc 24 3c 03 00 00 	mov    %edi,0x33c(%rsp)
    348043f6:	89 84 24 38 03 00 00 	mov    %eax,0x338(%rsp)

00000000348043fd <.LBB9_45>:
    348043fd:	8b 84 24 38 03 00 00 	mov    0x338(%rsp),%eax
    34804404:	48 8b 8c 24 48 03 00 	mov    0x348(%rsp),%rcx
    3480440b:	00 
    3480440c:	48 8b 94 24 58 03 00 	mov    0x358(%rsp),%rdx
    34804413:	00 
    34804414:	48 39 d1             	cmp    %rdx,%rcx
    34804417:	89 84 24 34 03 00 00 	mov    %eax,0x334(%rsp)
    3480441e:	48 89 8c 24 28 03 00 	mov    %rcx,0x328(%rsp)
    34804425:	00 
    34804426:	0f 83 62 00 00 00    	jae    3480448e <.LBB9_47>
    3480442c:	48 8b 84 24 28 03 00 	mov    0x328(%rsp),%rax
    34804433:	00 
    34804434:	8b 08                	mov    (%rax),%ecx
    34804436:	89 ca                	mov    %ecx,%edx
    34804438:	8b b4 24 40 03 00 00 	mov    0x340(%rsp),%esi
    3480443f:	21 f2                	and    %esi,%edx
    34804441:	8b bc 24 44 03 00 00 	mov    0x344(%rsp),%edi
    34804448:	89 8c 24 24 03 00 00 	mov    %ecx,0x324(%rsp)
    3480444f:	89 f9                	mov    %edi,%ecx
    34804451:	44 8b 84 24 24 03 00 	mov    0x324(%rsp),%r8d
    34804458:	00 
    34804459:	41 d3 e8             	shr    %cl,%r8d
    3480445c:	44 8b 8c 24 34 03 00 	mov    0x334(%rsp),%r9d
    34804463:	00 
    34804464:	45 01 c8             	add    %r9d,%r8d
    34804467:	44 89 00             	mov    %r8d,(%rax)
    3480446a:	44 8b 84 24 3c 03 00 	mov    0x33c(%rsp),%r8d
    34804471:	00 
    34804472:	41 0f af d0          	imul   %r8d,%edx
    34804476:	48 83 c0 04          	add    $0x4,%rax
    3480447a:	48 89 84 24 48 03 00 	mov    %rax,0x348(%rsp)
    34804481:	00 
    34804482:	89 94 24 38 03 00 00 	mov    %edx,0x338(%rsp)
    34804489:	e9 6f ff ff ff       	jmpq   348043fd <.LBB9_45>

000000003480448e <.LBB9_47>:
    3480448e:	48 8b 84 24 60 03 00 	mov    0x360(%rsp),%rax
    34804495:	00 
    34804496:	8b 08                	mov    (%rax),%ecx
    34804498:	48 83 c0 04          	add    $0x4,%rax
    3480449c:	83 f9 00             	cmp    $0x0,%ecx
    3480449f:	48 8b 94 24 60 03 00 	mov    0x360(%rsp),%rdx
    348044a6:	00 
    348044a7:	48 0f 45 c2          	cmovne %rdx,%rax
    348044ab:	8b 8c 24 34 03 00 00 	mov    0x334(%rsp),%ecx
    348044b2:	83 f9 00             	cmp    $0x0,%ecx
    348044b5:	48 8b b4 24 58 03 00 	mov    0x358(%rsp),%rsi
    348044bc:	00 
    348044bd:	48 89 84 24 18 03 00 	mov    %rax,0x318(%rsp)
    348044c4:	00 
    348044c5:	48 89 b4 24 10 03 00 	mov    %rsi,0x310(%rsp)
    348044cc:	00 
    348044cd:	0f 84 25 00 00 00    	je     348044f8 <.LBB9_49>
    348044d3:	48 8b 84 24 58 03 00 	mov    0x358(%rsp),%rax
    348044da:	00 
    348044db:	48 83 c0 04          	add    $0x4,%rax
    348044df:	48 8b 8c 24 58 03 00 	mov    0x358(%rsp),%rcx
    348044e6:	00 
    348044e7:	8b 94 24 34 03 00 00 	mov    0x334(%rsp),%edx
    348044ee:	89 11                	mov    %edx,(%rcx)
    348044f0:	48 89 84 24 10 03 00 	mov    %rax,0x310(%rsp)
    348044f7:	00 

00000000348044f8 <.LBB9_49>:
    348044f8:	48 8b 84 24 10 03 00 	mov    0x310(%rsp),%rax
    348044ff:	00 
    34804500:	8a 8c 24 d7 03 00 00 	mov    0x3d7(%rsp),%cl
    34804507:	f6 c1 01             	test   $0x1,%cl
    3480450a:	48 8b 94 24 18 03 00 	mov    0x318(%rsp),%rdx
    34804511:	00 
    34804512:	48 8b b4 24 10 04 00 	mov    0x410(%rsp),%rsi
    34804519:	00 
    3480451a:	48 0f 45 d6          	cmovne %rsi,%rdx
    3480451e:	48 89 c7             	mov    %rax,%rdi
    34804521:	48 29 d7             	sub    %rdx,%rdi
    34804524:	48 c1 ff 02          	sar    $0x2,%rdi
    34804528:	4c 8b 84 24 c8 03 00 	mov    0x3c8(%rsp),%r8
    3480452f:	00 
    34804530:	49 c1 e0 02          	shl    $0x2,%r8
    34804534:	4c 01 c2             	add    %r8,%rdx
    34804537:	4c 8b 84 24 c8 03 00 	mov    0x3c8(%rsp),%r8
    3480453e:	00 
    3480453f:	4c 39 c7             	cmp    %r8,%rdi
    34804542:	48 0f 4f c2          	cmovg  %rdx,%rax
    34804546:	44 8b 8c 24 44 03 00 	mov    0x344(%rsp),%r9d
    3480454d:	00 
    3480454e:	44 03 8c 24 34 06 00 	add    0x634(%rsp),%r9d
    34804555:	00 
    34804556:	44 89 8c 24 34 06 00 	mov    %r9d,0x634(%rsp)
    3480455d:	00 
    3480455e:	48 8b 94 24 18 03 00 	mov    0x318(%rsp),%rdx
    34804565:	00 
    34804566:	48 89 84 24 c0 03 00 	mov    %rax,0x3c0(%rsp)
    3480456d:	00 
    3480456e:	48 89 94 24 b8 03 00 	mov    %rdx,0x3b8(%rsp)
    34804575:	00 
    34804576:	e9 e2 fd ff ff       	jmpq   3480435d <.LBB9_43>

000000003480457b <.LBB9_50>:
    3480457b:	31 c0                	xor    %eax,%eax
    3480457d:	48 8b 8c 24 60 03 00 	mov    0x360(%rsp),%rcx
    34804584:	00 
    34804585:	48 8b 94 24 58 03 00 	mov    0x358(%rsp),%rdx
    3480458c:	00 
    3480458d:	48 39 d1             	cmp    %rdx,%rcx
    34804590:	89 84 24 0c 03 00 00 	mov    %eax,0x30c(%rsp)
    34804597:	0f 83 94 00 00 00    	jae    34804631 <.LBB9_54>
    3480459d:	b8 0a 00 00 00       	mov    $0xa,%eax
    348045a2:	48 8b 8c 24 10 04 00 	mov    0x410(%rsp),%rcx
    348045a9:	00 
    348045aa:	48 8b 94 24 60 03 00 	mov    0x360(%rsp),%rdx
    348045b1:	00 
    348045b2:	48 29 d1             	sub    %rdx,%rcx
    348045b5:	48 c1 f9 02          	sar    $0x2,%rcx
    348045b9:	48 6b c9 09          	imul   $0x9,%rcx,%rcx
    348045bd:	89 ce                	mov    %ecx,%esi
    348045bf:	8b 3a                	mov    (%rdx),%edi
    348045c1:	89 bc 24 08 03 00 00 	mov    %edi,0x308(%rsp)
    348045c8:	89 84 24 04 03 00 00 	mov    %eax,0x304(%rsp)
    348045cf:	89 b4 24 00 03 00 00 	mov    %esi,0x300(%rsp)

00000000348045d6 <.LBB9_52>:
    348045d6:	8b 84 24 00 03 00 00 	mov    0x300(%rsp),%eax
    348045dd:	8b 8c 24 04 03 00 00 	mov    0x304(%rsp),%ecx
    348045e4:	8b 94 24 08 03 00 00 	mov    0x308(%rsp),%edx
    348045eb:	39 ca                	cmp    %ecx,%edx
    348045ed:	89 c6                	mov    %eax,%esi
    348045ef:	89 84 24 fc 02 00 00 	mov    %eax,0x2fc(%rsp)
    348045f6:	89 8c 24 f8 02 00 00 	mov    %ecx,0x2f8(%rsp)
    348045fd:	89 b4 24 0c 03 00 00 	mov    %esi,0x30c(%rsp)
    34804604:	0f 82 27 00 00 00    	jb     34804631 <.LBB9_54>
    3480460a:	8b 84 24 f8 02 00 00 	mov    0x2f8(%rsp),%eax
    34804611:	6b c8 0a             	imul   $0xa,%eax,%ecx
    34804614:	8b 94 24 fc 02 00 00 	mov    0x2fc(%rsp),%edx
    3480461b:	83 c2 01             	add    $0x1,%edx
    3480461e:	89 8c 24 04 03 00 00 	mov    %ecx,0x304(%rsp)
    34804625:	89 94 24 00 03 00 00 	mov    %edx,0x300(%rsp)
    3480462c:	e9 a5 ff ff ff       	jmpq   348045d6 <.LBB9_52>

0000000034804631 <.LBB9_54>:
    34804631:	8b 84 24 0c 03 00 00 	mov    0x30c(%rsp),%eax
    34804638:	31 c9                	xor    %ecx,%ecx
    3480463a:	8b 94 24 58 05 00 00 	mov    0x558(%rsp),%edx
    34804641:	83 ea 66             	sub    $0x66,%edx
    34804644:	0f 45 c8             	cmovne %eax,%ecx
    34804647:	8b b4 24 38 04 00 00 	mov    0x438(%rsp),%esi
    3480464e:	29 ce                	sub    %ecx,%esi
    34804650:	8b 8c 24 58 05 00 00 	mov    0x558(%rsp),%ecx
    34804657:	83 e9 67             	sub    $0x67,%ecx
    3480465a:	40 0f 94 c7          	sete   %dil
    3480465e:	44 8b 84 24 38 04 00 	mov    0x438(%rsp),%r8d
    34804665:	00 
    34804666:	45 85 c0             	test   %r8d,%r8d
    34804669:	41 0f 95 c1          	setne  %r9b
    3480466d:	41 88 fa             	mov    %dil,%r10b
    34804670:	45 20 ca             	and    %r9b,%r10b
    34804673:	45 0f b6 da          	movzbl %r10b,%r11d
    34804677:	41 f7 db             	neg    %r11d
    3480467a:	44 01 de             	add    %r11d,%esi
    3480467d:	48 63 de             	movslq %esi,%rbx
    34804680:	4c 8b a4 24 58 03 00 	mov    0x358(%rsp),%r12
    34804687:	00 
    34804688:	4c 8b 84 24 10 04 00 	mov    0x410(%rsp),%r8
    3480468f:	00 
    34804690:	4d 29 c4             	sub    %r8,%r12
    34804693:	49 c1 fc 02          	sar    $0x2,%r12
    34804697:	4d 6b e4 09          	imul   $0x9,%r12,%r12
    3480469b:	49 83 c4 f7          	add    $0xfffffffffffffff7,%r12
    3480469f:	49 39 dc             	cmp    %rbx,%r12
    348046a2:	41 89 c3             	mov    %eax,%r11d
    348046a5:	48 8b 9c 24 58 03 00 	mov    0x358(%rsp),%rbx
    348046ac:	00 
    348046ad:	4c 8b a4 24 60 03 00 	mov    0x360(%rsp),%r12
    348046b4:	00 
    348046b5:	89 84 24 f4 02 00 00 	mov    %eax,0x2f4(%rsp)
    348046bc:	89 94 24 f0 02 00 00 	mov    %edx,0x2f0(%rsp)
    348046c3:	89 b4 24 ec 02 00 00 	mov    %esi,0x2ec(%rsp)
    348046ca:	89 8c 24 e8 02 00 00 	mov    %ecx,0x2e8(%rsp)
    348046d1:	40 88 bc 24 e7 02 00 	mov    %dil,0x2e7(%rsp)
    348046d8:	00 
    348046d9:	44 88 8c 24 e6 02 00 	mov    %r9b,0x2e6(%rsp)
    348046e0:	00 
    348046e1:	44 89 9c 24 e0 02 00 	mov    %r11d,0x2e0(%rsp)
    348046e8:	00 
    348046e9:	48 89 9c 24 d8 02 00 	mov    %rbx,0x2d8(%rsp)
    348046f0:	00 
    348046f1:	4c 89 a4 24 d0 02 00 	mov    %r12,0x2d0(%rsp)
    348046f8:	00 
    348046f9:	0f 8e de 04 00 00    	jle    34804bdd <.LBB9_74>
    348046ff:	b8 0a 00 00 00       	mov    $0xa,%eax
    34804704:	b9 09 00 00 00       	mov    $0x9,%ecx
    34804709:	48 8b 94 24 10 04 00 	mov    0x410(%rsp),%rdx
    34804710:	00 
    34804711:	48 83 c2 04          	add    $0x4,%rdx
    34804715:	8b b4 24 ec 02 00 00 	mov    0x2ec(%rsp),%esi
    3480471c:	81 c6 00 40 02 00    	add    $0x24000,%esi
    34804722:	89 84 24 cc 02 00 00 	mov    %eax,0x2cc(%rsp)
    34804729:	89 f0                	mov    %esi,%eax
    3480472b:	48 89 94 24 c0 02 00 	mov    %rdx,0x2c0(%rsp)
    34804732:	00 
    34804733:	99                   	cltd   
    34804734:	f7 f9                	idiv   %ecx
    34804736:	05 00 c0 ff ff       	add    $0xffffc000,%eax
    3480473b:	48 63 f8             	movslq %eax,%rdi
    3480473e:	48 c1 e7 02          	shl    $0x2,%rdi
    34804742:	4c 8b 84 24 c0 02 00 	mov    0x2c0(%rsp),%r8
    34804749:	00 
    3480474a:	49 01 f8             	add    %rdi,%r8
    3480474d:	89 f0                	mov    %esi,%eax
    3480474f:	99                   	cltd   
    34804750:	f7 f9                	idiv   %ecx
    34804752:	8b 8c 24 cc 02 00 00 	mov    0x2cc(%rsp),%ecx
    34804759:	4c 89 84 24 b8 02 00 	mov    %r8,0x2b8(%rsp)
    34804760:	00 
    34804761:	89 94 24 b4 02 00 00 	mov    %edx,0x2b4(%rsp)
    34804768:	89 8c 24 b0 02 00 00 	mov    %ecx,0x2b0(%rsp)

000000003480476f <.LBB9_56>:
    3480476f:	8b 84 24 b0 02 00 00 	mov    0x2b0(%rsp),%eax
    34804776:	8b 8c 24 b4 02 00 00 	mov    0x2b4(%rsp),%ecx
    3480477d:	83 f9 08             	cmp    $0x8,%ecx
    34804780:	89 84 24 ac 02 00 00 	mov    %eax,0x2ac(%rsp)
    34804787:	89 8c 24 a8 02 00 00 	mov    %ecx,0x2a8(%rsp)
    3480478e:	0f 8d 27 00 00 00    	jge    348047bb <.LBB9_58>
    34804794:	8b 84 24 a8 02 00 00 	mov    0x2a8(%rsp),%eax
    3480479b:	83 c0 01             	add    $0x1,%eax
    3480479e:	8b 8c 24 ac 02 00 00 	mov    0x2ac(%rsp),%ecx
    348047a5:	6b d1 0a             	imul   $0xa,%ecx,%edx
    348047a8:	89 84 24 b4 02 00 00 	mov    %eax,0x2b4(%rsp)
    348047af:	89 94 24 b0 02 00 00 	mov    %edx,0x2b0(%rsp)
    348047b6:	e9 b4 ff ff ff       	jmpq   3480476f <.LBB9_56>

00000000348047bb <.LBB9_58>:
    348047bb:	48 8b 84 24 b8 02 00 	mov    0x2b8(%rsp),%rax
    348047c2:	00 
    348047c3:	8b 00                	mov    (%rax),%eax
    348047c5:	31 d2                	xor    %edx,%edx
    348047c7:	8b 8c 24 ac 02 00 00 	mov    0x2ac(%rsp),%ecx
    348047ce:	f7 f1                	div    %ecx
    348047d0:	83 fa 00             	cmp    $0x0,%edx
    348047d3:	40 0f 95 c6          	setne  %sil
    348047d7:	48 8b bc 24 b8 02 00 	mov    0x2b8(%rsp),%rdi
    348047de:	00 
    348047df:	48 83 c7 04          	add    $0x4,%rdi
    348047e3:	4c 8b 84 24 58 03 00 	mov    0x358(%rsp),%r8
    348047ea:	00 
    348047eb:	4c 39 c7             	cmp    %r8,%rdi
    348047ee:	41 0f 95 c1          	setne  %r9b
    348047f2:	44 08 ce             	or     %r9b,%sil
    348047f5:	40 f6 c6 01          	test   $0x1,%sil
    348047f9:	44 8b 94 24 f4 02 00 	mov    0x2f4(%rsp),%r10d
    34804800:	00 
    34804801:	48 8b bc 24 b8 02 00 	mov    0x2b8(%rsp),%rdi
    34804808:	00 
    34804809:	4c 8b 9c 24 60 03 00 	mov    0x360(%rsp),%r11
    34804810:	00 
    34804811:	89 94 24 a4 02 00 00 	mov    %edx,0x2a4(%rsp)
    34804818:	44 89 94 24 a0 02 00 	mov    %r10d,0x2a0(%rsp)
    3480481f:	00 
    34804820:	48 89 bc 24 98 02 00 	mov    %rdi,0x298(%rsp)
    34804827:	00 
    34804828:	4c 89 9c 24 90 02 00 	mov    %r11,0x290(%rsp)
    3480482f:	00 
    34804830:	0f 85 05 00 00 00    	jne    3480483b <.LBB9_59>
    34804836:	e9 61 03 00 00       	jmpq   34804b9c <.LBB9_73>

000000003480483b <.LBB9_59>:
    3480483b:	48 8b 84 24 b8 02 00 	mov    0x2b8(%rsp),%rax
    34804842:	00 
    34804843:	8b 00                	mov    (%rax),%eax
    34804845:	31 d2                	xor    %edx,%edx
    34804847:	8b 8c 24 ac 02 00 00 	mov    0x2ac(%rsp),%ecx
    3480484e:	f7 f1                	div    %ecx
    34804850:	83 e0 01             	and    $0x1,%eax
    34804853:	89 c6                	mov    %eax,%esi
    34804855:	48 c1 e6 04          	shl    $0x4,%rsi
    34804859:	db ae 60 65 80 34    	fldt   0x34806560(%rsi)
    3480485f:	c1 e9 1f             	shr    $0x1f,%ecx
    34804862:	8b 84 24 ac 02 00 00 	mov    0x2ac(%rsp),%eax
    34804869:	01 c8                	add    %ecx,%eax
    3480486b:	d1 f8                	sar    %eax
    3480486d:	d9 05 d5 1c 00 00    	flds   0x1cd5(%rip)        # 34806548 <.Lvsnprintf.f+0xd8>
    34804873:	8b 8c 24 a4 02 00 00 	mov    0x2a4(%rsp),%ecx
    3480487a:	29 c1                	sub    %eax,%ecx
    3480487c:	d9 c9                	fxch   %st(1)
    3480487e:	db bc 24 84 02 00 00 	fstpt  0x284(%rsp)
    34804885:	89 84 24 80 02 00 00 	mov    %eax,0x280(%rsp)
    3480488c:	89 8c 24 7c 02 00 00 	mov    %ecx,0x27c(%rsp)
    34804893:	db bc 24 70 02 00 00 	fstpt  0x270(%rsp)
    3480489a:	0f 82 54 00 00 00    	jb     348048f4 <.LBB9_61>
    348048a0:	e9 00 00 00 00       	jmpq   348048a5 <.LBB9_60>

00000000348048a5 <.LBB9_60>:
    348048a5:	48 8b 84 24 b8 02 00 	mov    0x2b8(%rsp),%rax
    348048ac:	00 
    348048ad:	48 83 c0 04          	add    $0x4,%rax
    348048b1:	48 8b 8c 24 58 03 00 	mov    0x358(%rsp),%rcx
    348048b8:	00 
    348048b9:	48 29 c8             	sub    %rcx,%rax
    348048bc:	d9 e8                	fld1   
    348048be:	d9 05 88 1c 00 00    	flds   0x1c88(%rip)        # 3480654c <.Lvsnprintf.f+0xdc>
    348048c4:	d9 c0                	fld    %st(0)
    348048c6:	da ca                	fcmove %st(2),%st
    348048c8:	dd da                	fstp   %st(2)
    348048ca:	8b 94 24 a4 02 00 00 	mov    0x2a4(%rsp),%edx
    348048d1:	8b b4 24 80 02 00 00 	mov    0x280(%rsp),%esi
    348048d8:	29 f2                	sub    %esi,%edx
    348048da:	da c9                	fcmove %st(1),%st
    348048dc:	dd d9                	fstp   %st(1)
    348048de:	48 89 84 24 68 02 00 	mov    %rax,0x268(%rsp)
    348048e5:	00 
    348048e6:	89 94 24 64 02 00 00 	mov    %edx,0x264(%rsp)
    348048ed:	db bc 24 70 02 00 00 	fstpt  0x270(%rsp)

00000000348048f4 <.LBB9_61>:
    348048f4:	db ac 24 70 02 00 00 	fldt   0x270(%rsp)
    348048fb:	8b 84 24 8c 05 00 00 	mov    0x58c(%rsp),%eax
    34804902:	83 f8 00             	cmp    $0x0,%eax
    34804905:	db ac 24 84 02 00 00 	fldt   0x284(%rsp)
    3480490c:	d9 c1                	fld    %st(1)
    3480490e:	d9 ca                	fxch   %st(2)
    34804910:	db bc 24 58 02 00 00 	fstpt  0x258(%rsp)
    34804917:	db bc 24 4c 02 00 00 	fstpt  0x24c(%rsp)
    3480491e:	db bc 24 40 02 00 00 	fstpt  0x240(%rsp)
    34804925:	0f 84 51 00 00 00    	je     3480497c <.LBB9_64>
    3480492b:	48 8b 84 24 80 05 00 	mov    0x580(%rsp),%rax
    34804932:	00 
    34804933:	80 38 2d             	cmpb   $0x2d,(%rax)
    34804936:	db ac 24 84 02 00 00 	fldt   0x284(%rsp)
    3480493d:	db ac 24 58 02 00 00 	fldt   0x258(%rsp)
    34804944:	d9 c9                	fxch   %st(1)
    34804946:	db bc 24 4c 02 00 00 	fstpt  0x24c(%rsp)
    3480494d:	db bc 24 40 02 00 00 	fstpt  0x240(%rsp)
    34804954:	0f 85 22 00 00 00    	jne    3480497c <.LBB9_64>
    3480495a:	db ac 24 84 02 00 00 	fldt   0x284(%rsp)
    34804961:	d9 e0                	fchs   
    34804963:	db ac 24 58 02 00 00 	fldt   0x258(%rsp)
    3480496a:	d9 e0                	fchs   
    3480496c:	d9 c9                	fxch   %st(1)
    3480496e:	db bc 24 4c 02 00 00 	fstpt  0x24c(%rsp)
    34804975:	db bc 24 40 02 00 00 	fstpt  0x240(%rsp)

000000003480497c <.LBB9_64>:
    3480497c:	db ac 24 40 02 00 00 	fldt   0x240(%rsp)
    34804983:	db ac 24 4c 02 00 00 	fldt   0x24c(%rsp)
    3480498a:	48 8b 84 24 b8 02 00 	mov    0x2b8(%rsp),%rax
    34804991:	00 
    34804992:	8b 08                	mov    (%rax),%ecx
    34804994:	8b 94 24 a4 02 00 00 	mov    0x2a4(%rsp),%edx
    3480499b:	29 d1                	sub    %edx,%ecx
    3480499d:	89 08                	mov    %ecx,(%rax)
    3480499f:	dc c1                	fadd   %st,%st(1)
    348049a1:	d9 c9                	fxch   %st(1)
    348049a3:	df e9                	fucomip %st(1),%st
    348049a5:	dd d8                	fstp   %st(0)
    348049a7:	8b b4 24 f4 02 00 00 	mov    0x2f4(%rsp),%esi
    348049ae:	48 8b bc 24 60 03 00 	mov    0x360(%rsp),%rdi
    348049b5:	00 
    348049b6:	89 8c 24 3c 02 00 00 	mov    %ecx,0x23c(%rsp)
    348049bd:	48 89 84 24 98 02 00 	mov    %rax,0x298(%rsp)
    348049c4:	00 
    348049c5:	89 b4 24 a0 02 00 00 	mov    %esi,0x2a0(%rsp)
    348049cc:	48 89 bc 24 90 02 00 	mov    %rdi,0x290(%rsp)
    348049d3:	00 
    348049d4:	0f 85 0b 00 00 00    	jne    348049e5 <.LBB9_65>
    348049da:	0f 8a 05 00 00 00    	jp     348049e5 <.LBB9_65>
    348049e0:	e9 b7 01 00 00       	jmpq   34804b9c <.LBB9_73>

00000000348049e5 <.LBB9_65>:
    348049e5:	8b 84 24 3c 02 00 00 	mov    0x23c(%rsp),%eax
    348049ec:	8b 8c 24 ac 02 00 00 	mov    0x2ac(%rsp),%ecx
    348049f3:	01 c8                	add    %ecx,%eax
    348049f5:	48 8b 94 24 b8 02 00 	mov    0x2b8(%rsp),%rdx
    348049fc:	00 
    348049fd:	48 8b b4 24 60 03 00 	mov    0x360(%rsp),%rsi
    34804a04:	00 
    34804a05:	48 89 94 24 30 02 00 	mov    %rdx,0x230(%rsp)
    34804a0c:	00 
    34804a0d:	89 84 24 2c 02 00 00 	mov    %eax,0x22c(%rsp)
    34804a14:	48 89 b4 24 20 02 00 	mov    %rsi,0x220(%rsp)
    34804a1b:	00 

0000000034804a1c <.LBB9_66>:
    34804a1c:	48 8b 84 24 20 02 00 	mov    0x220(%rsp),%rax
    34804a23:	00 
    34804a24:	48 8b 8c 24 30 02 00 	mov    0x230(%rsp),%rcx
    34804a2b:	00 
    34804a2c:	8b 94 24 2c 02 00 00 	mov    0x22c(%rsp),%edx
    34804a33:	48 8b b4 24 30 02 00 	mov    0x230(%rsp),%rsi
    34804a3a:	00 
    34804a3b:	89 16                	mov    %edx,(%rsi)
    34804a3d:	81 fa ff c9 9a 3b    	cmp    $0x3b9ac9ff,%edx
    34804a43:	48 89 84 24 18 02 00 	mov    %rax,0x218(%rsp)
    34804a4a:	00 
    34804a4b:	48 89 8c 24 10 02 00 	mov    %rcx,0x210(%rsp)
    34804a52:	00 
    34804a53:	0f 86 8f 00 00 00    	jbe    34804ae8 <.LBB9_70>
    34804a59:	48 8b 84 24 10 02 00 	mov    0x210(%rsp),%rax
    34804a60:	00 
    34804a61:	48 83 c0 fc          	add    $0xfffffffffffffffc,%rax
    34804a65:	48 8b 8c 24 10 02 00 	mov    0x210(%rsp),%rcx
    34804a6c:	00 
    34804a6d:	c7 01 00 00 00 00    	movl   $0x0,(%rcx)
    34804a73:	48 8b 94 24 18 02 00 	mov    0x218(%rsp),%rdx
    34804a7a:	00 
    34804a7b:	48 39 d0             	cmp    %rdx,%rax
    34804a7e:	48 89 84 24 08 02 00 	mov    %rax,0x208(%rsp)
    34804a85:	00 
    34804a86:	48 89 94 24 00 02 00 	mov    %rdx,0x200(%rsp)
    34804a8d:	00 
    34804a8e:	0f 83 23 00 00 00    	jae    34804ab7 <.LBB9_69>
    34804a94:	48 8b 84 24 18 02 00 	mov    0x218(%rsp),%rax
    34804a9b:	00 
    34804a9c:	48 83 c0 fc          	add    $0xfffffffffffffffc,%rax
    34804aa0:	48 8b 8c 24 18 02 00 	mov    0x218(%rsp),%rcx
    34804aa7:	00 
    34804aa8:	c7 41 fc 00 00 00 00 	movl   $0x0,-0x4(%rcx)
    34804aaf:	48 89 84 24 00 02 00 	mov    %rax,0x200(%rsp)
    34804ab6:	00 

0000000034804ab7 <.LBB9_69>:
    34804ab7:	48 8b 84 24 00 02 00 	mov    0x200(%rsp),%rax
    34804abe:	00 
    34804abf:	48 8b 8c 24 08 02 00 	mov    0x208(%rsp),%rcx
    34804ac6:	00 
    34804ac7:	8b 11                	mov    (%rcx),%edx
    34804ac9:	83 c2 01             	add    $0x1,%edx
    34804acc:	89 94 24 2c 02 00 00 	mov    %edx,0x22c(%rsp)
    34804ad3:	48 89 8c 24 30 02 00 	mov    %rcx,0x230(%rsp)
    34804ada:	00 
    34804adb:	48 89 84 24 20 02 00 	mov    %rax,0x220(%rsp)
    34804ae2:	00 
    34804ae3:	e9 34 ff ff ff       	jmpq   34804a1c <.LBB9_66>

0000000034804ae8 <.LBB9_70>:
    34804ae8:	b8 0a 00 00 00       	mov    $0xa,%eax
    34804aed:	48 8b 8c 24 10 04 00 	mov    0x410(%rsp),%rcx
    34804af4:	00 
    34804af5:	48 8b 94 24 18 02 00 	mov    0x218(%rsp),%rdx
    34804afc:	00 
    34804afd:	48 29 d1             	sub    %rdx,%rcx
    34804b00:	48 c1 f9 02          	sar    $0x2,%rcx
    34804b04:	48 6b c9 09          	imul   $0x9,%rcx,%rcx
    34804b08:	89 ce                	mov    %ecx,%esi
    34804b0a:	8b 3a                	mov    (%rdx),%edi
    34804b0c:	89 bc 24 fc 01 00 00 	mov    %edi,0x1fc(%rsp)
    34804b13:	89 84 24 f8 01 00 00 	mov    %eax,0x1f8(%rsp)
    34804b1a:	89 b4 24 f4 01 00 00 	mov    %esi,0x1f4(%rsp)

0000000034804b21 <.LBB9_71>:
    34804b21:	8b 84 24 f4 01 00 00 	mov    0x1f4(%rsp),%eax
    34804b28:	8b 8c 24 f8 01 00 00 	mov    0x1f8(%rsp),%ecx
    34804b2f:	8b 94 24 fc 01 00 00 	mov    0x1fc(%rsp),%edx
    34804b36:	39 ca                	cmp    %ecx,%edx
    34804b38:	89 c6                	mov    %eax,%esi
    34804b3a:	48 8b bc 24 10 02 00 	mov    0x210(%rsp),%rdi
    34804b41:	00 
    34804b42:	4c 8b 84 24 18 02 00 	mov    0x218(%rsp),%r8
    34804b49:	00 
    34804b4a:	89 84 24 f0 01 00 00 	mov    %eax,0x1f0(%rsp)
    34804b51:	89 8c 24 ec 01 00 00 	mov    %ecx,0x1ec(%rsp)
    34804b58:	89 b4 24 a0 02 00 00 	mov    %esi,0x2a0(%rsp)
    34804b5f:	48 89 bc 24 98 02 00 	mov    %rdi,0x298(%rsp)
    34804b66:	00 
    34804b67:	4c 89 84 24 90 02 00 	mov    %r8,0x290(%rsp)
    34804b6e:	00 
    34804b6f:	0f 82 27 00 00 00    	jb     34804b9c <.LBB9_73>
    34804b75:	8b 84 24 ec 01 00 00 	mov    0x1ec(%rsp),%eax
    34804b7c:	6b c8 0a             	imul   $0xa,%eax,%ecx
    34804b7f:	8b 94 24 f0 01 00 00 	mov    0x1f0(%rsp),%edx
    34804b86:	83 c2 01             	add    $0x1,%edx
    34804b89:	89 8c 24 f8 01 00 00 	mov    %ecx,0x1f8(%rsp)
    34804b90:	89 94 24 f4 01 00 00 	mov    %edx,0x1f4(%rsp)
    34804b97:	e9 85 ff ff ff       	jmpq   34804b21 <.LBB9_71>

0000000034804b9c <.LBB9_73>:
    34804b9c:	48 8b 84 24 90 02 00 	mov    0x290(%rsp),%rax
    34804ba3:	00 
    34804ba4:	48 8b 8c 24 98 02 00 	mov    0x298(%rsp),%rcx
    34804bab:	00 
    34804bac:	8b 94 24 a0 02 00 00 	mov    0x2a0(%rsp),%edx
    34804bb3:	48 83 c1 04          	add    $0x4,%rcx
    34804bb7:	48 8b b4 24 58 03 00 	mov    0x358(%rsp),%rsi
    34804bbe:	00 
    34804bbf:	48 39 ce             	cmp    %rcx,%rsi
    34804bc2:	48 0f 47 f1          	cmova  %rcx,%rsi
    34804bc6:	48 89 b4 24 d8 02 00 	mov    %rsi,0x2d8(%rsp)
    34804bcd:	00 
    34804bce:	89 94 24 e0 02 00 00 	mov    %edx,0x2e0(%rsp)
    34804bd5:	48 89 84 24 d0 02 00 	mov    %rax,0x2d0(%rsp)
    34804bdc:	00 

0000000034804bdd <.LBB9_74>:
    34804bdd:	48 8b 84 24 d0 02 00 	mov    0x2d0(%rsp),%rax
    34804be4:	00 
    34804be5:	48 8b 8c 24 d8 02 00 	mov    0x2d8(%rsp),%rcx
    34804bec:	00 
    34804bed:	8b 94 24 e0 02 00 00 	mov    0x2e0(%rsp),%edx
    34804bf4:	48 89 84 24 e0 01 00 	mov    %rax,0x1e0(%rsp)
    34804bfb:	00 
    34804bfc:	89 94 24 dc 01 00 00 	mov    %edx,0x1dc(%rsp)
    34804c03:	48 89 8c 24 d0 01 00 	mov    %rcx,0x1d0(%rsp)
    34804c0a:	00 

0000000034804c0b <.LBB9_75>:
    34804c0b:	48 8b 84 24 d0 01 00 	mov    0x1d0(%rsp),%rax
    34804c12:	00 
    34804c13:	48 8b 8c 24 e0 01 00 	mov    0x1e0(%rsp),%rcx
    34804c1a:	00 
    34804c1b:	48 39 c8             	cmp    %rcx,%rax
    34804c1e:	0f 97 c2             	seta   %dl
    34804c21:	f6 c2 01             	test   $0x1,%dl
    34804c24:	48 89 84 24 c8 01 00 	mov    %rax,0x1c8(%rsp)
    34804c2b:	00 
    34804c2c:	88 94 24 c7 01 00 00 	mov    %dl,0x1c7(%rsp)
    34804c33:	0f 85 05 00 00 00    	jne    34804c3e <.LBB9_76>
    34804c39:	e9 2b 00 00 00       	jmpq   34804c69 <.LBB9_78>

0000000034804c3e <.LBB9_76>:
    34804c3e:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
    34804c45:	00 
    34804c46:	83 78 fc 00          	cmpl   $0x0,-0x4(%rax)
    34804c4a:	0f 85 19 00 00 00    	jne    34804c69 <.LBB9_78>
    34804c50:	48 8b 84 24 c8 01 00 	mov    0x1c8(%rsp),%rax
    34804c57:	00 
    34804c58:	48 83 c0 fc          	add    $0xfffffffffffffffc,%rax
    34804c5c:	48 89 84 24 d0 01 00 	mov    %rax,0x1d0(%rsp)
    34804c63:	00 
    34804c64:	e9 a2 ff ff ff       	jmpq   34804c0b <.LBB9_75>

0000000034804c69 <.LBB9_78>:
    34804c69:	31 c0                	xor    %eax,%eax
    34804c6b:	8b 8c 24 dc 01 00 00 	mov    0x1dc(%rsp),%ecx
    34804c72:	29 c8                	sub    %ecx,%eax
    34804c74:	8a 94 24 e7 02 00 00 	mov    0x2e7(%rsp),%dl
    34804c7b:	f6 c2 01             	test   $0x1,%dl
    34804c7e:	8b b4 24 d4 05 00 00 	mov    0x5d4(%rsp),%esi
    34804c85:	8b bc 24 38 04 00 00 	mov    0x438(%rsp),%edi
    34804c8c:	89 84 24 c0 01 00 00 	mov    %eax,0x1c0(%rsp)
    34804c93:	89 b4 24 bc 01 00 00 	mov    %esi,0x1bc(%rsp)
    34804c9a:	89 bc 24 b8 01 00 00 	mov    %edi,0x1b8(%rsp)
    34804ca1:	0f 85 05 00 00 00    	jne    34804cac <.LBB9_79>
    34804ca7:	e9 c7 02 00 00       	jmpq   34804f73 <.LBB9_91>

0000000034804cac <.LBB9_79>:
    34804cac:	8a 84 24 e6 02 00 00 	mov    0x2e6(%rsp),%al
    34804cb3:	34 ff                	xor    $0xff,%al
    34804cb5:	24 01                	and    $0x1,%al
    34804cb7:	0f b6 c8             	movzbl %al,%ecx
    34804cba:	8b 94 24 38 04 00 00 	mov    0x438(%rsp),%edx
    34804cc1:	01 ca                	add    %ecx,%edx
    34804cc3:	8b 8c 24 dc 01 00 00 	mov    0x1dc(%rsp),%ecx
    34804cca:	39 ca                	cmp    %ecx,%edx
    34804ccc:	0f 9f c0             	setg   %al
    34804ccf:	83 f9 fb             	cmp    $0xfffffffb,%ecx
    34804cd2:	40 0f 9f c6          	setg   %sil
    34804cd6:	40 20 c6             	and    %al,%sil
    34804cd9:	40 f6 c6 01          	test   $0x1,%sil
    34804cdd:	89 94 24 b4 01 00 00 	mov    %edx,0x1b4(%rsp)
    34804ce4:	0f 85 05 00 00 00    	jne    34804cef <.LBB9_80>
    34804cea:	e9 27 00 00 00       	jmpq   34804d16 <.LBB9_81>

0000000034804cef <.LBB9_80>:
    34804cef:	8b 84 24 d4 05 00 00 	mov    0x5d4(%rsp),%eax
    34804cf6:	83 c0 ff             	add    $0xffffffff,%eax
    34804cf9:	8b 8c 24 dc 01 00 00 	mov    0x1dc(%rsp),%ecx
    34804d00:	83 f1 ff             	xor    $0xffffffff,%ecx
    34804d03:	89 84 24 b0 01 00 00 	mov    %eax,0x1b0(%rsp)
    34804d0a:	89 8c 24 ac 01 00 00 	mov    %ecx,0x1ac(%rsp)
    34804d11:	e9 1d 00 00 00       	jmpq   34804d33 <.LBB9_82>

0000000034804d16 <.LBB9_81>:
    34804d16:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    34804d1b:	8b 8c 24 d4 05 00 00 	mov    0x5d4(%rsp),%ecx
    34804d22:	83 c1 fe             	add    $0xfffffffe,%ecx
    34804d25:	89 8c 24 b0 01 00 00 	mov    %ecx,0x1b0(%rsp)
    34804d2c:	89 84 24 ac 01 00 00 	mov    %eax,0x1ac(%rsp)

0000000034804d33 <.LBB9_82>:
    34804d33:	8b 84 24 ac 01 00 00 	mov    0x1ac(%rsp),%eax
    34804d3a:	8b 8c 24 b0 01 00 00 	mov    0x1b0(%rsp),%ecx
    34804d41:	8b 94 24 b4 01 00 00 	mov    0x1b4(%rsp),%edx
    34804d48:	01 c2                	add    %eax,%edx
    34804d4a:	8b 84 24 d0 05 00 00 	mov    0x5d0(%rsp),%eax
    34804d51:	83 e0 08             	and    $0x8,%eax
    34804d54:	83 f8 00             	cmp    $0x0,%eax
    34804d57:	89 c8                	mov    %ecx,%eax
    34804d59:	89 d6                	mov    %edx,%esi
    34804d5b:	89 94 24 a8 01 00 00 	mov    %edx,0x1a8(%rsp)
    34804d62:	89 8c 24 a4 01 00 00 	mov    %ecx,0x1a4(%rsp)
    34804d69:	89 84 24 bc 01 00 00 	mov    %eax,0x1bc(%rsp)
    34804d70:	89 b4 24 b8 01 00 00 	mov    %esi,0x1b8(%rsp)
    34804d77:	0f 85 f6 01 00 00    	jne    34804f73 <.LBB9_91>
    34804d7d:	b8 09 00 00 00       	mov    $0x9,%eax
    34804d82:	8a 8c 24 c7 01 00 00 	mov    0x1c7(%rsp),%cl
    34804d89:	f6 c1 01             	test   $0x1,%cl
    34804d8c:	89 84 24 a0 01 00 00 	mov    %eax,0x1a0(%rsp)
    34804d93:	0f 85 05 00 00 00    	jne    34804d9e <.LBB9_84>
    34804d99:	e9 bf 00 00 00       	jmpq   34804e5d <.LBB9_88>

0000000034804d9e <.LBB9_84>:
    34804d9e:	b8 09 00 00 00       	mov    $0x9,%eax
    34804da3:	48 8b 8c 24 c8 01 00 	mov    0x1c8(%rsp),%rcx
    34804daa:	00 
    34804dab:	48 83 c1 fc          	add    $0xfffffffffffffffc,%rcx
    34804daf:	48 8b 94 24 c8 01 00 	mov    0x1c8(%rsp),%rdx
    34804db6:	00 
    34804db7:	83 7a fc 00          	cmpl   $0x0,-0x4(%rdx)
    34804dbb:	48 89 8c 24 98 01 00 	mov    %rcx,0x198(%rsp)
    34804dc2:	00 
    34804dc3:	89 84 24 a0 01 00 00 	mov    %eax,0x1a0(%rsp)
    34804dca:	0f 84 8d 00 00 00    	je     34804e5d <.LBB9_88>
    34804dd0:	b8 0a 00 00 00       	mov    $0xa,%eax
    34804dd5:	31 c9                	xor    %ecx,%ecx
    34804dd7:	48 8b 94 24 98 01 00 	mov    0x198(%rsp),%rdx
    34804dde:	00 
    34804ddf:	8b 32                	mov    (%rdx),%esi
    34804de1:	89 b4 24 94 01 00 00 	mov    %esi,0x194(%rsp)
    34804de8:	89 84 24 90 01 00 00 	mov    %eax,0x190(%rsp)
    34804def:	89 8c 24 8c 01 00 00 	mov    %ecx,0x18c(%rsp)

0000000034804df6 <.LBB9_86>:
    34804df6:	8b 84 24 8c 01 00 00 	mov    0x18c(%rsp),%eax
    34804dfd:	8b 8c 24 90 01 00 00 	mov    0x190(%rsp),%ecx
    34804e04:	8b 94 24 94 01 00 00 	mov    0x194(%rsp),%edx
    34804e0b:	89 84 24 88 01 00 00 	mov    %eax,0x188(%rsp)
    34804e12:	89 d0                	mov    %edx,%eax
    34804e14:	31 d2                	xor    %edx,%edx
    34804e16:	f7 f1                	div    %ecx
    34804e18:	83 fa 00             	cmp    $0x0,%edx
    34804e1b:	8b 94 24 88 01 00 00 	mov    0x188(%rsp),%edx
    34804e22:	89 8c 24 84 01 00 00 	mov    %ecx,0x184(%rsp)
    34804e29:	89 94 24 a0 01 00 00 	mov    %edx,0x1a0(%rsp)
    34804e30:	0f 85 27 00 00 00    	jne    34804e5d <.LBB9_88>
    34804e36:	8b 84 24 84 01 00 00 	mov    0x184(%rsp),%eax
    34804e3d:	6b c8 0a             	imul   $0xa,%eax,%ecx
    34804e40:	8b 94 24 88 01 00 00 	mov    0x188(%rsp),%edx
    34804e47:	83 c2 01             	add    $0x1,%edx
    34804e4a:	89 8c 24 90 01 00 00 	mov    %ecx,0x190(%rsp)
    34804e51:	89 94 24 8c 01 00 00 	mov    %edx,0x18c(%rsp)
    34804e58:	e9 99 ff ff ff       	jmpq   34804df6 <.LBB9_86>

0000000034804e5d <.LBB9_88>:
    34804e5d:	8b 84 24 a0 01 00 00 	mov    0x1a0(%rsp),%eax
    34804e64:	8b 8c 24 a4 01 00 00 	mov    0x1a4(%rsp),%ecx
    34804e6b:	83 c9 20             	or     $0x20,%ecx
    34804e6e:	8b 94 24 a8 01 00 00 	mov    0x1a8(%rsp),%edx
    34804e75:	48 63 f2             	movslq %edx,%rsi
    34804e78:	48 8b bc 24 c8 01 00 	mov    0x1c8(%rsp),%rdi
    34804e7f:	00 
    34804e80:	4c 8b 84 24 10 04 00 	mov    0x410(%rsp),%r8
    34804e87:	00 
    34804e88:	4c 29 c7             	sub    %r8,%rdi
    34804e8b:	48 c1 ff 02          	sar    $0x2,%rdi
    34804e8f:	48 6b ff 09          	imul   $0x9,%rdi,%rdi
    34804e93:	48 83 c7 f7          	add    $0xfffffffffffffff7,%rdi
    34804e97:	83 f9 66             	cmp    $0x66,%ecx
    34804e9a:	89 84 24 80 01 00 00 	mov    %eax,0x180(%rsp)
    34804ea1:	48 89 bc 24 78 01 00 	mov    %rdi,0x178(%rsp)
    34804ea8:	00 
    34804ea9:	48 89 b4 24 70 01 00 	mov    %rsi,0x170(%rsp)
    34804eb0:	00 
    34804eb1:	0f 85 59 00 00 00    	jne    34804f10 <.LBB9_90>
    34804eb7:	31 c0                	xor    %eax,%eax
    34804eb9:	89 c1                	mov    %eax,%ecx
    34804ebb:	8b 84 24 80 01 00 00 	mov    0x180(%rsp),%eax
    34804ec2:	48 63 d0             	movslq %eax,%rdx
    34804ec5:	48 8b b4 24 78 01 00 	mov    0x178(%rsp),%rsi
    34804ecc:	00 
    34804ecd:	48 29 d6             	sub    %rdx,%rsi
    34804ed0:	48 83 fe 00          	cmp    $0x0,%rsi
    34804ed4:	48 89 f2             	mov    %rsi,%rdx
    34804ed7:	48 0f 4c d1          	cmovl  %rcx,%rdx
    34804edb:	48 83 fe 00          	cmp    $0x0,%rsi
    34804edf:	48 0f 4c f1          	cmovl  %rcx,%rsi
    34804ee3:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
    34804eea:	00 
    34804eeb:	48 39 ca             	cmp    %rcx,%rdx
    34804eee:	48 0f 4f f1          	cmovg  %rcx,%rsi
    34804ef2:	89 f7                	mov    %esi,%edi
    34804ef4:	44 8b 84 24 a4 01 00 	mov    0x1a4(%rsp),%r8d
    34804efb:	00 
    34804efc:	44 89 84 24 bc 01 00 	mov    %r8d,0x1bc(%rsp)
    34804f03:	00 
    34804f04:	89 bc 24 b8 01 00 00 	mov    %edi,0x1b8(%rsp)
    34804f0b:	e9 63 00 00 00       	jmpq   34804f73 <.LBB9_91>

0000000034804f10 <.LBB9_90>:
    34804f10:	31 c0                	xor    %eax,%eax
    34804f12:	89 c1                	mov    %eax,%ecx
    34804f14:	8b 84 24 dc 01 00 00 	mov    0x1dc(%rsp),%eax
    34804f1b:	48 63 d0             	movslq %eax,%rdx
    34804f1e:	48 8b b4 24 78 01 00 	mov    0x178(%rsp),%rsi
    34804f25:	00 
    34804f26:	48 01 d6             	add    %rdx,%rsi
    34804f29:	8b bc 24 80 01 00 00 	mov    0x180(%rsp),%edi
    34804f30:	48 63 d7             	movslq %edi,%rdx
    34804f33:	48 29 d6             	sub    %rdx,%rsi
    34804f36:	48 83 fe 00          	cmp    $0x0,%rsi
    34804f3a:	48 89 f2             	mov    %rsi,%rdx
    34804f3d:	48 0f 4c d1          	cmovl  %rcx,%rdx
    34804f41:	48 83 fe 00          	cmp    $0x0,%rsi
    34804f45:	48 0f 4c f1          	cmovl  %rcx,%rsi
    34804f49:	48 8b 8c 24 70 01 00 	mov    0x170(%rsp),%rcx
    34804f50:	00 
    34804f51:	48 39 ca             	cmp    %rcx,%rdx
    34804f54:	48 0f 4f f1          	cmovg  %rcx,%rsi
    34804f58:	41 89 f0             	mov    %esi,%r8d
    34804f5b:	44 8b 8c 24 a4 01 00 	mov    0x1a4(%rsp),%r9d
    34804f62:	00 
    34804f63:	44 89 8c 24 bc 01 00 	mov    %r9d,0x1bc(%rsp)
    34804f6a:	00 
    34804f6b:	44 89 84 24 b8 01 00 	mov    %r8d,0x1b8(%rsp)
    34804f72:	00 

0000000034804f73 <.LBB9_91>:
    34804f73:	8b 84 24 b8 01 00 00 	mov    0x1b8(%rsp),%eax
    34804f7a:	8b 8c 24 bc 01 00 00 	mov    0x1bc(%rsp),%ecx
    34804f81:	89 c2                	mov    %eax,%edx
    34804f83:	83 c2 01             	add    $0x1,%edx
    34804f86:	8b b4 24 d0 05 00 00 	mov    0x5d0(%rsp),%esi
    34804f8d:	83 e6 08             	and    $0x8,%esi
    34804f90:	89 c7                	mov    %eax,%edi
    34804f92:	09 f7                	or     %esi,%edi
    34804f94:	83 ff 00             	cmp    $0x0,%edi
    34804f97:	41 0f 95 c0          	setne  %r8b
    34804f9b:	41 80 e0 01          	and    $0x1,%r8b
    34804f9f:	41 0f b6 f0          	movzbl %r8b,%esi
    34804fa3:	01 f2                	add    %esi,%edx
    34804fa5:	89 ce                	mov    %ecx,%esi
    34804fa7:	83 ce 20             	or     $0x20,%esi
    34804faa:	83 fe 66             	cmp    $0x66,%esi
    34804fad:	41 0f 94 c0          	sete   %r8b
    34804fb1:	41 f6 c0 01          	test   $0x1,%r8b
    34804fb5:	89 84 24 6c 01 00 00 	mov    %eax,0x16c(%rsp)
    34804fbc:	89 8c 24 68 01 00 00 	mov    %ecx,0x168(%rsp)
    34804fc3:	89 94 24 64 01 00 00 	mov    %edx,0x164(%rsp)
    34804fca:	44 88 84 24 63 01 00 	mov    %r8b,0x163(%rsp)
    34804fd1:	00 
    34804fd2:	0f 85 05 00 00 00    	jne    34804fdd <.LBB9_92>
    34804fd8:	e9 2c 00 00 00       	jmpq   34805009 <.LBB9_93>

0000000034804fdd <.LBB9_92>:
    34804fdd:	31 c0                	xor    %eax,%eax
    34804fdf:	8b 8c 24 dc 01 00 00 	mov    0x1dc(%rsp),%ecx
    34804fe6:	83 f9 00             	cmp    $0x0,%ecx
    34804fe9:	0f 4f c1             	cmovg  %ecx,%eax
    34804fec:	8b 94 24 64 01 00 00 	mov    0x164(%rsp),%edx
    34804ff3:	01 c2                	add    %eax,%edx
    34804ff5:	89 94 24 5c 01 00 00 	mov    %edx,0x15c(%rsp)
    34804ffc:	48 89 b4 24 50 01 00 	mov    %rsi,0x150(%rsp)
    34805003:	00 
    34805004:	e9 d9 00 00 00       	jmpq   348050e2 <.LBB9_97>

0000000034805009 <.LBB9_93>:
    34805009:	8b 84 24 dc 01 00 00 	mov    0x1dc(%rsp),%eax
    34805010:	83 f8 00             	cmp    $0x0,%eax
    34805013:	8b 8c 24 c0 01 00 00 	mov    0x1c0(%rsp),%ecx
    3480501a:	0f 4c c1             	cmovl  %ecx,%eax
    3480501d:	48 63 f8             	movslq %eax,%rdi
    34805020:	48 8b b4 24 b8 05 00 	mov    0x5b8(%rsp),%rsi
    34805027:	00 
    34805028:	e8 a3 e4 ff ff       	callq  348034d0 <fmt_u>
    3480502d:	48 89 84 24 48 01 00 	mov    %rax,0x148(%rsp)
    34805034:	00 

0000000034805035 <.LBB9_94>:
    34805035:	48 8b 84 24 48 01 00 	mov    0x148(%rsp),%rax
    3480503c:	00 
    3480503d:	48 8b 8c 24 b8 05 00 	mov    0x5b8(%rsp),%rcx
    34805044:	00 
    34805045:	48 29 c1             	sub    %rax,%rcx
    34805048:	48 83 f9 02          	cmp    $0x2,%rcx
    3480504c:	48 89 84 24 40 01 00 	mov    %rax,0x140(%rsp)
    34805053:	00 
    34805054:	0f 8d 25 00 00 00    	jge    3480507f <.LBB9_96>
    3480505a:	48 8b 84 24 40 01 00 	mov    0x140(%rsp),%rax
    34805061:	00 
    34805062:	48 83 c0 ff          	add    $0xffffffffffffffff,%rax
    34805066:	48 8b 8c 24 40 01 00 	mov    0x140(%rsp),%rcx
    3480506d:	00 
    3480506e:	c6 41 ff 30          	movb   $0x30,-0x1(%rcx)
    34805072:	48 89 84 24 48 01 00 	mov    %rax,0x148(%rsp)
    34805079:	00 
    3480507a:	e9 b6 ff ff ff       	jmpq   34805035 <.LBB9_94>

000000003480507f <.LBB9_96>:
    3480507f:	8b 84 24 dc 01 00 00 	mov    0x1dc(%rsp),%eax
    34805086:	c1 f8 1f             	sar    $0x1f,%eax
    34805089:	83 e0 02             	and    $0x2,%eax
    3480508c:	83 c0 2b             	add    $0x2b,%eax
    3480508f:	88 c1                	mov    %al,%cl
    34805091:	48 8b 94 24 40 01 00 	mov    0x140(%rsp),%rdx
    34805098:	00 
    34805099:	88 4a ff             	mov    %cl,-0x1(%rdx)
    3480509c:	8b 84 24 68 01 00 00 	mov    0x168(%rsp),%eax
    348050a3:	88 c1                	mov    %al,%cl
    348050a5:	48 83 c2 fe          	add    $0xfffffffffffffffe,%rdx
    348050a9:	48 8b b4 24 40 01 00 	mov    0x140(%rsp),%rsi
    348050b0:	00 
    348050b1:	88 4e fe             	mov    %cl,-0x2(%rsi)
    348050b4:	8b bc 24 64 01 00 00 	mov    0x164(%rsp),%edi
    348050bb:	41 89 f8             	mov    %edi,%r8d
    348050be:	45 89 c1             	mov    %r8d,%r9d
    348050c1:	4c 8b 94 24 b8 05 00 	mov    0x5b8(%rsp),%r10
    348050c8:	00 
    348050c9:	4d 01 d1             	add    %r10,%r9
    348050cc:	49 29 d1             	sub    %rdx,%r9
    348050cf:	45 89 c8             	mov    %r9d,%r8d
    348050d2:	44 89 84 24 5c 01 00 	mov    %r8d,0x15c(%rsp)
    348050d9:	00 
    348050da:	48 89 94 24 50 01 00 	mov    %rdx,0x150(%rsp)
    348050e1:	00 

00000000348050e2 <.LBB9_97>:
    348050e2:	48 8b 84 24 50 01 00 	mov    0x150(%rsp),%rax
    348050e9:	00 
    348050ea:	8b 8c 24 5c 01 00 00 	mov    0x15c(%rsp),%ecx
    348050f1:	be 20 00 00 00       	mov    $0x20,%esi
    348050f6:	8b 94 24 8c 05 00 00 	mov    0x58c(%rsp),%edx
    348050fd:	01 d1                	add    %edx,%ecx
    348050ff:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    34805106:	00 
    34805107:	8b 94 24 c8 05 00 00 	mov    0x5c8(%rsp),%edx
    3480510e:	89 8c 24 3c 01 00 00 	mov    %ecx,0x13c(%rsp)
    34805115:	44 8b 84 24 d0 05 00 	mov    0x5d0(%rsp),%r8d
    3480511c:	00 
    3480511d:	48 89 84 24 30 01 00 	mov    %rax,0x130(%rsp)
    34805124:	00 
    34805125:	e8 36 e4 ff ff       	callq  34803560 <pad>
    3480512a:	8b 8c 24 8c 05 00 00 	mov    0x58c(%rsp),%ecx
    34805131:	89 ca                	mov    %ecx,%edx
    34805133:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    3480513a:	00 
    3480513b:	48 8b b4 24 80 05 00 	mov    0x580(%rsp),%rsi
    34805142:	00 
    34805143:	e8 08 dc ff ff       	callq  34802d50 <out>
    34805148:	be 30 00 00 00       	mov    $0x30,%esi
    3480514d:	8b 8c 24 d0 05 00 00 	mov    0x5d0(%rsp),%ecx
    34805154:	81 f1 00 00 01 00    	xor    $0x10000,%ecx
    3480515a:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    34805161:	00 
    34805162:	8b 94 24 c8 05 00 00 	mov    0x5c8(%rsp),%edx
    34805169:	44 8b 84 24 3c 01 00 	mov    0x13c(%rsp),%r8d
    34805170:	00 
    34805171:	89 8c 24 2c 01 00 00 	mov    %ecx,0x12c(%rsp)
    34805178:	44 89 c1             	mov    %r8d,%ecx
    3480517b:	44 8b 84 24 2c 01 00 	mov    0x12c(%rsp),%r8d
    34805182:	00 
    34805183:	e8 d8 e3 ff ff       	callq  34803560 <pad>
    34805188:	44 8a 8c 24 63 01 00 	mov    0x163(%rsp),%r9b
    3480518f:	00 
    34805190:	41 f6 c1 01          	test   $0x1,%r9b
    34805194:	0f 85 05 00 00 00    	jne    3480519f <.LBB9_98>
    3480519a:	e9 23 03 00 00       	jmpq   348054c2 <.LBB9_115>

000000003480519f <.LBB9_98>:
    3480519f:	48 8d 84 24 10 06 00 	lea    0x610(%rsp),%rax
    348051a6:	00 
    348051a7:	48 8b 8c 24 e0 01 00 	mov    0x1e0(%rsp),%rcx
    348051ae:	00 
    348051af:	48 8b 94 24 10 04 00 	mov    0x410(%rsp),%rdx
    348051b6:	00 
    348051b7:	48 39 d1             	cmp    %rdx,%rcx
    348051ba:	48 0f 47 ca          	cmova  %rdx,%rcx
    348051be:	48 89 c6             	mov    %rax,%rsi
    348051c1:	48 83 c6 09          	add    $0x9,%rsi
    348051c5:	48 89 cf             	mov    %rcx,%rdi
    348051c8:	48 89 84 24 20 01 00 	mov    %rax,0x120(%rsp)
    348051cf:	00 
    348051d0:	48 89 8c 24 18 01 00 	mov    %rcx,0x118(%rsp)
    348051d7:	00 
    348051d8:	48 89 b4 24 10 01 00 	mov    %rsi,0x110(%rsp)
    348051df:	00 
    348051e0:	48 89 bc 24 08 01 00 	mov    %rdi,0x108(%rsp)
    348051e7:	00 

00000000348051e8 <.LBB9_99>:
    348051e8:	48 8b 84 24 08 01 00 	mov    0x108(%rsp),%rax
    348051ef:	00 
    348051f0:	48 8b 8c 24 10 04 00 	mov    0x410(%rsp),%rcx
    348051f7:	00 
    348051f8:	48 39 c8             	cmp    %rcx,%rax
    348051fb:	48 89 84 24 00 01 00 	mov    %rax,0x100(%rsp)
    34805202:	00 
    34805203:	0f 87 16 01 00 00    	ja     3480531f <.LBB9_106>
    34805209:	48 8b 84 24 00 01 00 	mov    0x100(%rsp),%rax
    34805210:	00 
    34805211:	8b 08                	mov    (%rax),%ecx
    34805213:	89 cf                	mov    %ecx,%edi
    34805215:	48 8b b4 24 10 01 00 	mov    0x110(%rsp),%rsi
    3480521c:	00 
    3480521d:	e8 ae e2 ff ff       	callq  348034d0 <fmt_u>
    34805222:	48 8b b4 24 00 01 00 	mov    0x100(%rsp),%rsi
    34805229:	00 
    3480522a:	48 8b bc 24 18 01 00 	mov    0x118(%rsp),%rdi
    34805231:	00 
    34805232:	48 39 fe             	cmp    %rdi,%rsi
    34805235:	48 89 c2             	mov    %rax,%rdx
    34805238:	48 89 84 24 f8 00 00 	mov    %rax,0xf8(%rsp)
    3480523f:	00 
    34805240:	48 89 94 24 f0 00 00 	mov    %rdx,0xf0(%rsp)
    34805247:	00 
    34805248:	0f 84 51 00 00 00    	je     3480529f <.LBB9_103>

000000003480524e <.LBB9_101>:
    3480524e:	48 8b 84 24 f0 00 00 	mov    0xf0(%rsp),%rax
    34805255:	00 
    34805256:	48 8b 8c 24 20 01 00 	mov    0x120(%rsp),%rcx
    3480525d:	00 
    3480525e:	48 39 c8             	cmp    %rcx,%rax
    34805261:	48 89 c2             	mov    %rax,%rdx
    34805264:	48 89 84 24 e8 00 00 	mov    %rax,0xe8(%rsp)
    3480526b:	00 
    3480526c:	48 89 94 24 e0 00 00 	mov    %rdx,0xe0(%rsp)
    34805273:	00 
    34805274:	0f 86 66 00 00 00    	jbe    348052e0 <.LBB9_105>
    3480527a:	48 8b 84 24 e8 00 00 	mov    0xe8(%rsp),%rax
    34805281:	00 
    34805282:	48 83 c0 ff          	add    $0xffffffffffffffff,%rax
    34805286:	48 8b 8c 24 e8 00 00 	mov    0xe8(%rsp),%rcx
    3480528d:	00 
    3480528e:	c6 41 ff 30          	movb   $0x30,-0x1(%rcx)
    34805292:	48 89 84 24 f0 00 00 	mov    %rax,0xf0(%rsp)
    34805299:	00 
    3480529a:	e9 af ff ff ff       	jmpq   3480524e <.LBB9_101>

000000003480529f <.LBB9_103>:
    3480529f:	48 8b 84 24 f8 00 00 	mov    0xf8(%rsp),%rax
    348052a6:	00 
    348052a7:	48 8b 8c 24 10 01 00 	mov    0x110(%rsp),%rcx
    348052ae:	00 
    348052af:	48 39 c8             	cmp    %rcx,%rax
    348052b2:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
    348052b9:	00 
    348052ba:	0f 85 20 00 00 00    	jne    348052e0 <.LBB9_105>
    348052c0:	48 8b 84 24 f8 00 00 	mov    0xf8(%rsp),%rax
    348052c7:	00 
    348052c8:	48 83 c0 ff          	add    $0xffffffffffffffff,%rax
    348052cc:	48 8b 8c 24 f8 00 00 	mov    0xf8(%rsp),%rcx
    348052d3:	00 
    348052d4:	c6 41 ff 30          	movb   $0x30,-0x1(%rcx)
    348052d8:	48 89 84 24 e0 00 00 	mov    %rax,0xe0(%rsp)
    348052df:	00 

00000000348052e0 <.LBB9_105>:
    348052e0:	48 8b 84 24 e0 00 00 	mov    0xe0(%rsp),%rax
    348052e7:	00 
    348052e8:	48 8b 8c 24 10 01 00 	mov    0x110(%rsp),%rcx
    348052ef:	00 
    348052f0:	48 29 c1             	sub    %rax,%rcx
    348052f3:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    348052fa:	00 
    348052fb:	48 89 c6             	mov    %rax,%rsi
    348052fe:	48 89 ca             	mov    %rcx,%rdx
    34805301:	e8 4a da ff ff       	callq  34802d50 <out>
    34805306:	48 8b 84 24 00 01 00 	mov    0x100(%rsp),%rax
    3480530d:	00 
    3480530e:	48 83 c0 04          	add    $0x4,%rax
    34805312:	48 89 84 24 08 01 00 	mov    %rax,0x108(%rsp)
    34805319:	00 
    3480531a:	e9 c9 fe ff ff       	jmpq   348051e8 <.LBB9_99>

000000003480531f <.LBB9_106>:
    3480531f:	8b 84 24 d0 05 00 00 	mov    0x5d0(%rsp),%eax
    34805326:	83 e0 08             	and    $0x8,%eax
    34805329:	8b 8c 24 6c 01 00 00 	mov    0x16c(%rsp),%ecx
    34805330:	09 c1                	or     %eax,%ecx
    34805332:	83 f9 00             	cmp    $0x0,%ecx
    34805335:	0f 84 1e 00 00 00    	je     34805359 <.LBB9_108>
    3480533b:	48 be 94 67 80 34 00 	movabs $0x34806794,%rsi
    34805342:	00 00 00 
    34805345:	b8 01 00 00 00       	mov    $0x1,%eax
    3480534a:	89 c2                	mov    %eax,%edx
    3480534c:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    34805353:	00 
    34805354:	e8 f7 d9 ff ff       	callq  34802d50 <out>

0000000034805359 <.LBB9_108>:
    34805359:	48 8d 84 24 10 06 00 	lea    0x610(%rsp),%rax
    34805360:	00 
    34805361:	48 89 c1             	mov    %rax,%rcx
    34805364:	48 83 c1 09          	add    $0x9,%rcx
    34805368:	48 8b 94 24 00 01 00 	mov    0x100(%rsp),%rdx
    3480536f:	00 
    34805370:	8b b4 24 6c 01 00 00 	mov    0x16c(%rsp),%esi
    34805377:	48 89 84 24 d8 00 00 	mov    %rax,0xd8(%rsp)
    3480537e:	00 
    3480537f:	48 89 8c 24 d0 00 00 	mov    %rcx,0xd0(%rsp)
    34805386:	00 
    34805387:	48 89 94 24 c8 00 00 	mov    %rdx,0xc8(%rsp)
    3480538e:	00 
    3480538f:	89 b4 24 c4 00 00 00 	mov    %esi,0xc4(%rsp)

0000000034805396 <.LBB9_109>:
    34805396:	8b 84 24 c4 00 00 00 	mov    0xc4(%rsp),%eax
    3480539d:	48 8b 8c 24 c8 00 00 	mov    0xc8(%rsp),%rcx
    348053a4:	00 
    348053a5:	48 8b 94 24 c8 01 00 	mov    0x1c8(%rsp),%rdx
    348053ac:	00 
    348053ad:	48 39 d1             	cmp    %rdx,%rcx
    348053b0:	40 0f 92 c6          	setb   %sil
    348053b4:	83 f8 00             	cmp    $0x0,%eax
    348053b7:	40 0f 9f c7          	setg   %dil
    348053bb:	40 20 fe             	and    %dil,%sil
    348053be:	40 f6 c6 01          	test   $0x1,%sil
    348053c2:	89 84 24 c0 00 00 00 	mov    %eax,0xc0(%rsp)
    348053c9:	48 89 8c 24 b8 00 00 	mov    %rcx,0xb8(%rsp)
    348053d0:	00 
    348053d1:	0f 85 05 00 00 00    	jne    348053dc <.LBB9_110>
    348053d7:	e9 bb 00 00 00       	jmpq   34805497 <.LBB9_114>

00000000348053dc <.LBB9_110>:
    348053dc:	48 8b 84 24 b8 00 00 	mov    0xb8(%rsp),%rax
    348053e3:	00 
    348053e4:	8b 08                	mov    (%rax),%ecx
    348053e6:	89 cf                	mov    %ecx,%edi
    348053e8:	48 8b b4 24 d0 00 00 	mov    0xd0(%rsp),%rsi
    348053ef:	00 
    348053f0:	e8 db e0 ff ff       	callq  348034d0 <fmt_u>
    348053f5:	48 89 84 24 b0 00 00 	mov    %rax,0xb0(%rsp)
    348053fc:	00 

00000000348053fd <.LBB9_111>:
    348053fd:	48 8b 84 24 b0 00 00 	mov    0xb0(%rsp),%rax
    34805404:	00 
    34805405:	48 8b 8c 24 d8 00 00 	mov    0xd8(%rsp),%rcx
    3480540c:	00 
    3480540d:	48 39 c8             	cmp    %rcx,%rax
    34805410:	48 89 84 24 a8 00 00 	mov    %rax,0xa8(%rsp)
    34805417:	00 
    34805418:	0f 86 25 00 00 00    	jbe    34805443 <.LBB9_113>
    3480541e:	48 8b 84 24 a8 00 00 	mov    0xa8(%rsp),%rax
    34805425:	00 
    34805426:	48 83 c0 ff          	add    $0xffffffffffffffff,%rax
    3480542a:	48 8b 8c 24 a8 00 00 	mov    0xa8(%rsp),%rcx
    34805431:	00 
    34805432:	c6 41 ff 30          	movb   $0x30,-0x1(%rcx)
    34805436:	48 89 84 24 b0 00 00 	mov    %rax,0xb0(%rsp)
    3480543d:	00 
    3480543e:	e9 ba ff ff ff       	jmpq   348053fd <.LBB9_111>

0000000034805443 <.LBB9_113>:
    34805443:	b8 09 00 00 00       	mov    $0x9,%eax
    34805448:	8b 8c 24 c0 00 00 00 	mov    0xc0(%rsp),%ecx
    3480544f:	83 f9 09             	cmp    $0x9,%ecx
    34805452:	0f 4c c1             	cmovl  %ecx,%eax
    34805455:	48 63 d0             	movslq %eax,%rdx
    34805458:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    3480545f:	00 
    34805460:	48 8b b4 24 a8 00 00 	mov    0xa8(%rsp),%rsi
    34805467:	00 
    34805468:	e8 e3 d8 ff ff       	callq  34802d50 <out>
    3480546d:	48 8b 94 24 b8 00 00 	mov    0xb8(%rsp),%rdx
    34805474:	00 
    34805475:	48 83 c2 04          	add    $0x4,%rdx
    34805479:	8b 84 24 c0 00 00 00 	mov    0xc0(%rsp),%eax
    34805480:	83 c0 f7             	add    $0xfffffff7,%eax
    34805483:	48 89 94 24 c8 00 00 	mov    %rdx,0xc8(%rsp)
    3480548a:	00 
    3480548b:	89 84 24 c4 00 00 00 	mov    %eax,0xc4(%rsp)
    34805492:	e9 ff fe ff ff       	jmpq   34805396 <.LBB9_109>

0000000034805497 <.LBB9_114>:
    34805497:	be 30 00 00 00       	mov    $0x30,%esi
    3480549c:	b9 09 00 00 00       	mov    $0x9,%ecx
    348054a1:	45 31 c0             	xor    %r8d,%r8d
    348054a4:	8b 84 24 c0 00 00 00 	mov    0xc0(%rsp),%eax
    348054ab:	83 c0 09             	add    $0x9,%eax
    348054ae:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    348054b5:	00 
    348054b6:	89 c2                	mov    %eax,%edx
    348054b8:	e8 a3 e0 ff ff       	callq  34803560 <pad>
    348054bd:	e9 b2 02 00 00       	jmpq   34805774 <.LBB9_126>

00000000348054c2 <.LBB9_115>:
    348054c2:	48 8d 84 24 10 06 00 	lea    0x610(%rsp),%rax
    348054c9:	00 
    348054ca:	48 8b 8c 24 e0 01 00 	mov    0x1e0(%rsp),%rcx
    348054d1:	00 
    348054d2:	48 83 c1 04          	add    $0x4,%rcx
    348054d6:	48 8b 94 24 c8 01 00 	mov    0x1c8(%rsp),%rdx
    348054dd:	00 
    348054de:	48 8b b4 24 e0 01 00 	mov    0x1e0(%rsp),%rsi
    348054e5:	00 
    348054e6:	48 39 f2             	cmp    %rsi,%rdx
    348054e9:	48 0f 46 d1          	cmovbe %rcx,%rdx
    348054ed:	48 89 c1             	mov    %rax,%rcx
    348054f0:	48 83 c1 09          	add    $0x9,%rcx
    348054f4:	8b bc 24 d0 05 00 00 	mov    0x5d0(%rsp),%edi
    348054fb:	83 e7 08             	and    $0x8,%edi
    348054fe:	83 ff 00             	cmp    $0x0,%edi
    34805501:	41 0f 95 c0          	setne  %r8b
    34805505:	8b bc 24 6c 01 00 00 	mov    0x16c(%rsp),%edi
    3480550c:	48 89 84 24 a0 00 00 	mov    %rax,0xa0(%rsp)
    34805513:	00 
    34805514:	48 89 b4 24 98 00 00 	mov    %rsi,0x98(%rsp)
    3480551b:	00 
    3480551c:	48 89 94 24 90 00 00 	mov    %rdx,0x90(%rsp)
    34805523:	00 
    34805524:	48 89 8c 24 88 00 00 	mov    %rcx,0x88(%rsp)
    3480552b:	00 
    3480552c:	44 88 84 24 87 00 00 	mov    %r8b,0x87(%rsp)
    34805533:	00 
    34805534:	89 bc 24 80 00 00 00 	mov    %edi,0x80(%rsp)

000000003480553b <.LBB9_116>:
    3480553b:	8b 84 24 80 00 00 00 	mov    0x80(%rsp),%eax
    34805542:	48 8b 8c 24 98 00 00 	mov    0x98(%rsp),%rcx
    34805549:	00 
    3480554a:	48 8b 94 24 90 00 00 	mov    0x90(%rsp),%rdx
    34805551:	00 
    34805552:	48 39 d1             	cmp    %rdx,%rcx
    34805555:	40 0f 92 c6          	setb   %sil
    34805559:	83 f8 ff             	cmp    $0xffffffff,%eax
    3480555c:	40 0f 9f c7          	setg   %dil
    34805560:	40 20 fe             	and    %dil,%sil
    34805563:	40 f6 c6 01          	test   $0x1,%sil
    34805567:	89 44 24 7c          	mov    %eax,0x7c(%rsp)
    3480556b:	48 89 4c 24 70       	mov    %rcx,0x70(%rsp)
    34805570:	0f 85 05 00 00 00    	jne    3480557b <.LBB9_117>
    34805576:	e9 a6 01 00 00       	jmpq   34805721 <.LBB9_125>

000000003480557b <.LBB9_117>:
    3480557b:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
    34805580:	8b 08                	mov    (%rax),%ecx
    34805582:	89 cf                	mov    %ecx,%edi
    34805584:	48 8b b4 24 88 00 00 	mov    0x88(%rsp),%rsi
    3480558b:	00 
    3480558c:	e8 3f df ff ff       	callq  348034d0 <fmt_u>
    34805591:	48 8b b4 24 88 00 00 	mov    0x88(%rsp),%rsi
    34805598:	00 
    34805599:	48 39 f0             	cmp    %rsi,%rax
    3480559c:	48 89 c7             	mov    %rax,%rdi
    3480559f:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
    348055a4:	48 89 7c 24 60       	mov    %rdi,0x60(%rsp)
    348055a9:	0f 85 17 00 00 00    	jne    348055c6 <.LBB9_119>
    348055af:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    348055b4:	48 83 c0 ff          	add    $0xffffffffffffffff,%rax
    348055b8:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
    348055bd:	c6 41 ff 30          	movb   $0x30,-0x1(%rcx)
    348055c1:	48 89 44 24 60       	mov    %rax,0x60(%rsp)

00000000348055c6 <.LBB9_119>:
    348055c6:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
    348055cb:	48 8b 4c 24 70       	mov    0x70(%rsp),%rcx
    348055d0:	48 8b 94 24 e0 01 00 	mov    0x1e0(%rsp),%rdx
    348055d7:	00 
    348055d8:	48 39 d1             	cmp    %rdx,%rcx
    348055db:	48 89 c6             	mov    %rax,%rsi
    348055de:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
    348055e3:	48 89 74 24 50       	mov    %rsi,0x50(%rsp)
    348055e8:	0f 84 3f 00 00 00    	je     3480562d <.LBB9_122>

00000000348055ee <.LBB9_120>:
    348055ee:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
    348055f3:	48 8b 8c 24 a0 00 00 	mov    0xa0(%rsp),%rcx
    348055fa:	00 
    348055fb:	48 39 c8             	cmp    %rcx,%rax
    348055fe:	48 89 c2             	mov    %rax,%rdx
    34805601:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
    34805606:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
    3480560b:	0f 86 9a 00 00 00    	jbe    348056ab <.LBB9_124>
    34805611:	48 8b 44 24 48       	mov    0x48(%rsp),%rax
    34805616:	48 83 c0 ff          	add    $0xffffffffffffffff,%rax
    3480561a:	48 8b 4c 24 48       	mov    0x48(%rsp),%rcx
    3480561f:	c6 41 ff 30          	movb   $0x30,-0x1(%rcx)
    34805623:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
    34805628:	e9 c1 ff ff ff       	jmpq   348055ee <.LBB9_120>

000000003480562d <.LBB9_122>:
    3480562d:	b8 01 00 00 00       	mov    $0x1,%eax
    34805632:	89 c2                	mov    %eax,%edx
    34805634:	48 8b 4c 24 58       	mov    0x58(%rsp),%rcx
    34805639:	48 83 c1 01          	add    $0x1,%rcx
    3480563d:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    34805644:	00 
    34805645:	48 8b 74 24 58       	mov    0x58(%rsp),%rsi
    3480564a:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
    3480564f:	e8 fc d6 ff ff       	callq  34802d50 <out>
    34805654:	8b 44 24 7c          	mov    0x7c(%rsp),%eax
    34805658:	83 f8 00             	cmp    $0x0,%eax
    3480565b:	41 0f 9f c0          	setg   %r8b
    3480565f:	44 8a 8c 24 87 00 00 	mov    0x87(%rsp),%r9b
    34805666:	00 
    34805667:	45 08 c8             	or     %r9b,%r8b
    3480566a:	41 f6 c0 01          	test   $0x1,%r8b
    3480566e:	48 8b 4c 24 38       	mov    0x38(%rsp),%rcx
    34805673:	48 89 4c 24 40       	mov    %rcx,0x40(%rsp)
    34805678:	0f 85 05 00 00 00    	jne    34805683 <.LBB9_123>
    3480567e:	e9 28 00 00 00       	jmpq   348056ab <.LBB9_124>

0000000034805683 <.LBB9_123>:
    34805683:	48 be 94 67 80 34 00 	movabs $0x34806794,%rsi
    3480568a:	00 00 00 
    3480568d:	b8 01 00 00 00       	mov    $0x1,%eax
    34805692:	89 c2                	mov    %eax,%edx
    34805694:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    3480569b:	00 
    3480569c:	e8 af d6 ff ff       	callq  34802d50 <out>
    348056a1:	48 8b 54 24 38       	mov    0x38(%rsp),%rdx
    348056a6:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)

00000000348056ab <.LBB9_124>:
    348056ab:	48 8b 44 24 40       	mov    0x40(%rsp),%rax
    348056b0:	48 8b 8c 24 88 00 00 	mov    0x88(%rsp),%rcx
    348056b7:	00 
    348056b8:	48 29 c1             	sub    %rax,%rcx
    348056bb:	8b 54 24 7c          	mov    0x7c(%rsp),%edx
    348056bf:	48 63 f2             	movslq %edx,%rsi
    348056c2:	48 39 f1             	cmp    %rsi,%rcx
    348056c5:	48 89 f7             	mov    %rsi,%rdi
    348056c8:	48 0f 4c f9          	cmovl  %rcx,%rdi
    348056cc:	4c 8b 84 24 c0 05 00 	mov    0x5c0(%rsp),%r8
    348056d3:	00 
    348056d4:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
    348056d9:	4c 89 c7             	mov    %r8,%rdi
    348056dc:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
    348056e1:	48 89 c6             	mov    %rax,%rsi
    348056e4:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
    348056e9:	48 89 4c 24 20       	mov    %rcx,0x20(%rsp)
    348056ee:	e8 5d d6 ff ff       	callq  34802d50 <out>
    348056f3:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
    348056f8:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    348056fd:	48 29 c8             	sub    %rcx,%rax
    34805700:	41 89 c1             	mov    %eax,%r9d
    34805703:	48 8b 44 24 70       	mov    0x70(%rsp),%rax
    34805708:	48 83 c0 04          	add    $0x4,%rax
    3480570c:	48 89 84 24 98 00 00 	mov    %rax,0x98(%rsp)
    34805713:	00 
    34805714:	44 89 8c 24 80 00 00 	mov    %r9d,0x80(%rsp)
    3480571b:	00 
    3480571c:	e9 1a fe ff ff       	jmpq   3480553b <.LBB9_116>

0000000034805721 <.LBB9_125>:
    34805721:	be 30 00 00 00       	mov    $0x30,%esi
    34805726:	b9 12 00 00 00       	mov    $0x12,%ecx
    3480572b:	45 31 c0             	xor    %r8d,%r8d
    3480572e:	8b 44 24 7c          	mov    0x7c(%rsp),%eax
    34805732:	83 c0 12             	add    $0x12,%eax
    34805735:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    3480573c:	00 
    3480573d:	89 c2                	mov    %eax,%edx
    3480573f:	e8 1c de ff ff       	callq  34803560 <pad>
    34805744:	48 8b bc 24 b8 05 00 	mov    0x5b8(%rsp),%rdi
    3480574b:	00 
    3480574c:	4c 8b 8c 24 30 01 00 	mov    0x130(%rsp),%r9
    34805753:	00 
    34805754:	4c 29 cf             	sub    %r9,%rdi
    34805757:	4c 8b 94 24 c0 05 00 	mov    0x5c0(%rsp),%r10
    3480575e:	00 
    3480575f:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
    34805764:	4c 89 d7             	mov    %r10,%rdi
    34805767:	4c 89 ce             	mov    %r9,%rsi
    3480576a:	48 8b 54 24 18       	mov    0x18(%rsp),%rdx
    3480576f:	e8 dc d5 ff ff       	callq  34802d50 <out>

0000000034805774 <.LBB9_126>:
    34805774:	be 20 00 00 00       	mov    $0x20,%esi
    34805779:	8b 84 24 d0 05 00 00 	mov    0x5d0(%rsp),%eax
    34805780:	35 00 20 00 00       	xor    $0x2000,%eax
    34805785:	48 8b bc 24 c0 05 00 	mov    0x5c0(%rsp),%rdi
    3480578c:	00 
    3480578d:	8b 94 24 c8 05 00 00 	mov    0x5c8(%rsp),%edx
    34805794:	8b 8c 24 3c 01 00 00 	mov    0x13c(%rsp),%ecx
    3480579b:	41 89 c0             	mov    %eax,%r8d
    3480579e:	e8 bd dd ff ff       	callq  34803560 <pad>
    348057a3:	8b 84 24 3c 01 00 00 	mov    0x13c(%rsp),%eax
    348057aa:	89 84 24 6c 05 00 00 	mov    %eax,0x56c(%rsp)

00000000348057b1 <.LBB9_127>:
    348057b1:	8b 84 24 6c 05 00 00 	mov    0x56c(%rsp),%eax
    348057b8:	8b 8c 24 c8 05 00 00 	mov    0x5c8(%rsp),%ecx
    348057bf:	39 c8                	cmp    %ecx,%eax
    348057c1:	0f 4c c1             	cmovl  %ecx,%eax
    348057c4:	48 81 c4 38 06 00 00 	add    $0x638,%rsp
    348057cb:	5b                   	pop    %rbx
    348057cc:	41 5c                	pop    %r12
    348057ce:	c3                   	retq   
    348057cf:	90                   	nop

00000000348057d0 <__FLOAT_BITS>:
    348057d0:	66 0f 7e c0          	movd   %xmm0,%eax
    348057d4:	c3                   	retq   
    348057d5:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%rax,%rax,1)
    348057dc:	00 00 00 00 

00000000348057e0 <__DOUBLE_BITS>:
    348057e0:	66 48 0f 7e c0       	movq   %xmm0,%rax
    348057e5:	c3                   	retq   
    348057e6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    348057ed:	00 00 00 

00000000348057f0 <wctomb>:
    348057f0:	48 83 ec 18          	sub    $0x18,%rsp
    348057f4:	31 c0                	xor    %eax,%eax
    348057f6:	48 83 ff 00          	cmp    $0x0,%rdi
    348057fa:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
    348057ff:	89 74 24 0c          	mov    %esi,0xc(%rsp)
    34805803:	89 44 24 08          	mov    %eax,0x8(%rsp)
    34805807:	0f 84 18 00 00 00    	je     34805825 <.LBB0_2>
    3480580d:	31 c0                	xor    %eax,%eax
    3480580f:	89 c2                	mov    %eax,%edx
    34805811:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    34805816:	8b 74 24 0c          	mov    0xc(%rsp),%esi
    3480581a:	e8 71 06 00 00       	callq  34805e90 <wcrtomb>
    3480581f:	89 c6                	mov    %eax,%esi
    34805821:	89 74 24 08          	mov    %esi,0x8(%rsp)

0000000034805825 <.LBB0_2>:
    34805825:	8b 44 24 08          	mov    0x8(%rsp),%eax
    34805829:	48 83 c4 18          	add    $0x18,%rsp
    3480582d:	c3                   	retq   
    3480582e:	66 90                	xchg   %ax,%ax

0000000034805830 <__fpclassifyl>:
    34805830:	db 6c 24 08          	fldt   0x8(%rsp)
    34805834:	db 7c 24 e8          	fstpt  -0x18(%rsp)
    34805838:	48 8b 44 24 e8       	mov    -0x18(%rsp),%rax
    3480583d:	0f b7 4c 24 f0       	movzwl -0x10(%rsp),%ecx
    34805842:	81 e1 ff 7f 00 00    	and    $0x7fff,%ecx
    34805848:	83 f9 00             	cmp    $0x0,%ecx
    3480584b:	0f 95 c2             	setne  %dl
    3480584e:	48 83 f8 00          	cmp    $0x0,%rax
    34805852:	40 0f 9c c6          	setl   %sil
    34805856:	40 88 f7             	mov    %sil,%dil
    34805859:	40 08 d7             	or     %dl,%dil
    3480585c:	40 f6 c7 01          	test   $0x1,%dil
    34805860:	48 89 44 24 e0       	mov    %rax,-0x20(%rsp)
    34805865:	89 4c 24 dc          	mov    %ecx,-0x24(%rsp)
    34805869:	40 88 74 24 db       	mov    %sil,-0x25(%rsp)
    3480586e:	0f 85 1f 00 00 00    	jne    34805893 <.LBB0_2>
    34805874:	b8 02 00 00 00       	mov    $0x2,%eax
    34805879:	b9 03 00 00 00       	mov    $0x3,%ecx
    3480587e:	48 8b 54 24 e0       	mov    -0x20(%rsp),%rdx
    34805883:	48 83 fa 00          	cmp    $0x0,%rdx
    34805887:	0f 45 c1             	cmovne %ecx,%eax
    3480588a:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
    3480588e:	e9 54 00 00 00       	jmpq   348058e7 <.LBB0_5>

0000000034805893 <.LBB0_2>:
    34805893:	31 c0                	xor    %eax,%eax
    34805895:	8a 4c 24 db          	mov    -0x25(%rsp),%cl
    34805899:	f6 c1 01             	test   $0x1,%cl
    3480589c:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
    348058a0:	0f 85 05 00 00 00    	jne    348058ab <.LBB0_3>
    348058a6:	e9 3c 00 00 00       	jmpq   348058e7 <.LBB0_5>

00000000348058ab <.LBB0_3>:
    348058ab:	b8 04 00 00 00       	mov    $0x4,%eax
    348058b0:	8b 4c 24 dc          	mov    -0x24(%rsp),%ecx
    348058b4:	81 f9 ff 7f 00 00    	cmp    $0x7fff,%ecx
    348058ba:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
    348058be:	0f 85 23 00 00 00    	jne    348058e7 <.LBB0_5>
    348058c4:	48 b8 ff ff ff ff ff 	movabs $0x7fffffffffffffff,%rax
    348058cb:	ff ff 7f 
    348058ce:	48 8b 4c 24 e0       	mov    -0x20(%rsp),%rcx
    348058d3:	48 21 c1             	and    %rax,%rcx
    348058d6:	48 83 f9 00          	cmp    $0x0,%rcx
    348058da:	0f 94 c2             	sete   %dl
    348058dd:	80 e2 01             	and    $0x1,%dl
    348058e0:	0f b6 f2             	movzbl %dl,%esi
    348058e3:	89 74 24 d4          	mov    %esi,-0x2c(%rsp)

00000000348058e7 <.LBB0_5>:
    348058e7:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
    348058eb:	c3                   	retq   
    348058ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000348058f0 <__lockfile>:
    348058f0:	31 c0                	xor    %eax,%eax
    348058f2:	48 89 7c 24 f8       	mov    %rdi,-0x8(%rsp)
    348058f7:	c3                   	retq   
    348058f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    348058ff:	00 

0000000034805900 <__unlockfile>:
    34805900:	48 89 7c 24 f8       	mov    %rdi,-0x8(%rsp)
    34805905:	c3                   	retq   
    34805906:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    3480590d:	00 00 00 

0000000034805910 <__signbitl>:
    34805910:	db 6c 24 08          	fldt   0x8(%rsp)
    34805914:	db 7c 24 e8          	fstpt  -0x18(%rsp)
    34805918:	0f b7 44 24 f0       	movzwl -0x10(%rsp),%eax
    3480591d:	89 c1                	mov    %eax,%ecx
    3480591f:	48 c1 e9 0f          	shr    $0xf,%rcx
    34805923:	89 c8                	mov    %ecx,%eax
    34805925:	c3                   	retq   
    34805926:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    3480592d:	00 00 00 

0000000034805930 <frexpl>:
    34805930:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
    34805937:	db ac 24 a0 00 00 00 	fldt   0xa0(%rsp)
    3480593e:	d9 c0                	fld    %st(0)
    34805940:	db bc 24 80 00 00 00 	fstpt  0x80(%rsp)
    34805947:	0f b7 84 24 88 00 00 	movzwl 0x88(%rsp),%eax
    3480594e:	00 
    3480594f:	89 c1                	mov    %eax,%ecx
    34805951:	89 c8                	mov    %ecx,%eax
    34805953:	48 8b 94 24 80 00 00 	mov    0x80(%rsp),%rdx
    3480595a:	00 
    3480595b:	31 f6                	xor    %esi,%esi
    3480595d:	41 89 f0             	mov    %esi,%r8d
    34805960:	49 89 c9             	mov    %rcx,%r9
    34805963:	66 41 89 ca          	mov    %cx,%r10w
    34805967:	25 ff 7f 00 00       	and    $0x7fff,%eax
    3480596c:	2d ff 7f 00 00       	sub    $0x7fff,%eax
    34805971:	d9 c0                	fld    %st(0)
    34805973:	48 89 7c 24 68       	mov    %rdi,0x68(%rsp)
    34805978:	d9 c9                	fxch   %st(1)
    3480597a:	db 7c 24 5c          	fstpt  0x5c(%rsp)
    3480597e:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)
    34805983:	66 44 89 54 24 4e    	mov    %r10w,0x4e(%rsp)
    34805989:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
    3480598e:	4c 89 44 24 38       	mov    %r8,0x38(%rsp)
    34805993:	4c 89 4c 24 30       	mov    %r9,0x30(%rsp)
    34805998:	89 44 24 2c          	mov    %eax,0x2c(%rsp)
    3480599c:	db 7c 24 20          	fstpt  0x20(%rsp)
    348059a0:	0f 84 d1 00 00 00    	je     34805a77 <.LBB0_5>
    348059a6:	e9 00 00 00 00       	jmpq   348059ab <.LBB0_6>

00000000348059ab <.LBB0_6>:
    348059ab:	66 8b 4c 24 4e       	mov    0x4e(%rsp),%cx
    348059b0:	66 89 c8             	mov    %cx,%ax
    348059b3:	66 89 c2             	mov    %ax,%dx
    348059b6:	66 f7 c2 ff 7f       	test   $0x7fff,%dx
    348059bb:	0f 85 6f 00 00 00    	jne    34805a30 <.LBB0_4>
    348059c1:	e9 00 00 00 00       	jmpq   348059c6 <.LBB0_1>

00000000348059c6 <.LBB0_1>:
    348059c6:	31 c0                	xor    %eax,%eax
    348059c8:	d9 ee                	fldz   
    348059ca:	db 6c 24 5c          	fldt   0x5c(%rsp)
    348059ce:	db e9                	fucomi %st(1),%st
    348059d0:	dd d9                	fstp   %st(1)
    348059d2:	db 7c 24 14          	fstpt  0x14(%rsp)
    348059d6:	89 44 24 10          	mov    %eax,0x10(%rsp)
    348059da:	0f 85 0b 00 00 00    	jne    348059eb <.LBB0_2>
    348059e0:	0f 8a 05 00 00 00    	jp     348059eb <.LBB0_2>
    348059e6:	e9 2d 00 00 00       	jmpq   34805a18 <.LBB0_3>

00000000348059eb <.LBB0_2>:
    348059eb:	d9 05 a7 0d 00 00    	flds   0xda7(%rip)        # 34806798 <xdigits+0x48>
    348059f1:	db 6c 24 5c          	fldt   0x5c(%rsp)
    348059f5:	de c9                	fmulp  %st,%st(1)
    348059f7:	48 89 e0             	mov    %rsp,%rax
    348059fa:	db 38                	fstpt  (%rax)
    348059fc:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
    34805a01:	e8 2a ff ff ff       	callq  34805930 <frexpl>
    34805a06:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34805a0b:	8b 08                	mov    (%rax),%ecx
    34805a0d:	83 c1 88             	add    $0xffffff88,%ecx
    34805a10:	89 4c 24 10          	mov    %ecx,0x10(%rsp)
    34805a14:	db 7c 24 14          	fstpt  0x14(%rsp)

0000000034805a18 <.LBB0_3>:
    34805a18:	db 6c 24 14          	fldt   0x14(%rsp)
    34805a1c:	8b 44 24 10          	mov    0x10(%rsp),%eax
    34805a20:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
    34805a25:	89 01                	mov    %eax,(%rcx)
    34805a27:	db 7c 24 20          	fstpt  0x20(%rsp)
    34805a2b:	e9 47 00 00 00       	jmpq   34805a77 <.LBB0_5>

0000000034805a30 <.LBB0_4>:
    34805a30:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
    34805a35:	89 c1                	mov    %eax,%ecx
    34805a37:	81 e1 ff 7f 00 00    	and    $0x7fff,%ecx
    34805a3d:	81 c1 02 c0 ff ff    	add    $0xffffc002,%ecx
    34805a43:	48 8b 54 24 68       	mov    0x68(%rsp),%rdx
    34805a48:	89 0a                	mov    %ecx,(%rdx)
    34805a4a:	48 8b 74 24 50       	mov    0x50(%rsp),%rsi
    34805a4f:	89 f1                	mov    %esi,%ecx
    34805a51:	81 e1 00 80 ff ff    	and    $0xffff8000,%ecx
    34805a57:	81 c9 fe 3f 00 00    	or     $0x3ffe,%ecx
    34805a5d:	66 89 cf             	mov    %cx,%di
    34805a60:	4c 8b 44 24 40       	mov    0x40(%rsp),%r8
    34805a65:	4c 89 44 24 70       	mov    %r8,0x70(%rsp)
    34805a6a:	66 89 7c 24 78       	mov    %di,0x78(%rsp)
    34805a6f:	db 6c 24 70          	fldt   0x70(%rsp)
    34805a73:	db 7c 24 20          	fstpt  0x20(%rsp)

0000000034805a77 <.LBB0_5>:
    34805a77:	db 6c 24 20          	fldt   0x20(%rsp)
    34805a7b:	48 81 c4 98 00 00 00 	add    $0x98,%rsp
    34805a82:	c3                   	retq   
    34805a83:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    34805a8a:	00 00 00 
    34805a8d:	0f 1f 00             	nopl   (%rax)

0000000034805a90 <__fwritex>:
    34805a90:	48 83 ec 78          	sub    $0x78,%rsp
    34805a94:	48 89 d0             	mov    %rdx,%rax
    34805a97:	48 83 c0 20          	add    $0x20,%rax
    34805a9b:	48 83 7a 20 00       	cmpq   $0x0,0x20(%rdx)
    34805aa0:	48 89 74 24 70       	mov    %rsi,0x70(%rsp)
    34805aa5:	48 89 7c 24 68       	mov    %rdi,0x68(%rsp)
    34805aaa:	48 89 54 24 60       	mov    %rdx,0x60(%rsp)
    34805aaf:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
    34805ab4:	0f 85 1c 00 00 00    	jne    34805ad6 <.LBB0_2>
    34805aba:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
    34805abf:	e8 6c 05 00 00       	callq  34806030 <__towrite>
    34805ac4:	31 c9                	xor    %ecx,%ecx
    34805ac6:	89 cf                	mov    %ecx,%edi
    34805ac8:	83 f8 00             	cmp    $0x0,%eax
    34805acb:	48 89 7c 24 50       	mov    %rdi,0x50(%rsp)
    34805ad0:	0f 85 a1 01 00 00    	jne    34805c77 <.LBB0_12>

0000000034805ad6 <.LBB0_2>:
    34805ad6:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
    34805adb:	48 8b 08             	mov    (%rax),%rcx
    34805ade:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
    34805ae3:	48 83 c2 28          	add    $0x28,%rdx
    34805ae7:	48 8b 74 24 60       	mov    0x60(%rsp),%rsi
    34805aec:	48 2b 4e 28          	sub    0x28(%rsi),%rcx
    34805af0:	48 8b 7c 24 70       	mov    0x70(%rsp),%rdi
    34805af5:	48 39 f9             	cmp    %rdi,%rcx
    34805af8:	48 89 54 24 48       	mov    %rdx,0x48(%rsp)
    34805afd:	0f 83 21 00 00 00    	jae    34805b24 <.LBB0_4>
    34805b03:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
    34805b08:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
    34805b0d:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
    34805b12:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
    34805b17:	ff 50 48             	callq  *0x48(%rax)
    34805b1a:	48 89 44 24 50       	mov    %rax,0x50(%rsp)
    34805b1f:	e9 53 01 00 00       	jmpq   34805c77 <.LBB0_12>

0000000034805b24 <.LBB0_4>:
    34805b24:	31 c0                	xor    %eax,%eax
    34805b26:	89 c1                	mov    %eax,%ecx
    34805b28:	48 8b 54 24 60       	mov    0x60(%rsp),%rdx
    34805b2d:	80 ba 8b 00 00 00 ff 	cmpb   $0xff,0x8b(%rdx)
    34805b34:	48 8b 74 24 70       	mov    0x70(%rsp),%rsi
    34805b39:	48 8b 7c 24 68       	mov    0x68(%rsp),%rdi
    34805b3e:	4c 8b 44 24 70       	mov    0x70(%rsp),%r8
    34805b43:	4c 89 44 24 40       	mov    %r8,0x40(%rsp)
    34805b48:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
    34805b4d:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
    34805b52:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
    34805b57:	0f 8e c8 00 00 00    	jle    34805c25 <.LBB0_11>

0000000034805b5d <.LBB0_5>:
    34805b5d:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
    34805b62:	48 83 f8 00          	cmp    $0x0,%rax
    34805b66:	0f 95 c1             	setne  %cl
    34805b69:	f6 c1 01             	test   $0x1,%cl
    34805b6c:	48 89 44 24 20       	mov    %rax,0x20(%rsp)
    34805b71:	88 4c 24 1f          	mov    %cl,0x1f(%rsp)
    34805b75:	0f 85 05 00 00 00    	jne    34805b80 <.LBB0_6>
    34805b7b:	e9 28 00 00 00       	jmpq   34805ba8 <.LBB0_8>

0000000034805b80 <.LBB0_6>:
    34805b80:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34805b85:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    34805b8a:	80 7c 08 ff 0a       	cmpb   $0xa,-0x1(%rax,%rcx,1)
    34805b8f:	0f 84 13 00 00 00    	je     34805ba8 <.LBB0_8>
    34805b95:	48 8b 44 24 20       	mov    0x20(%rsp),%rax
    34805b9a:	48 83 c0 ff          	add    $0xffffffffffffffff,%rax
    34805b9e:	48 89 44 24 38       	mov    %rax,0x38(%rsp)
    34805ba3:	e9 b5 ff ff ff       	jmpq   34805b5d <.LBB0_5>

0000000034805ba8 <.LBB0_8>:
    34805ba8:	8a 44 24 1f          	mov    0x1f(%rsp),%al
    34805bac:	a8 01                	test   $0x1,%al
    34805bae:	48 8b 4c 24 68       	mov    0x68(%rsp),%rcx
    34805bb3:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
    34805bb8:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    34805bbd:	48 89 4c 24 30       	mov    %rcx,0x30(%rsp)
    34805bc2:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
    34805bc7:	48 89 74 24 28       	mov    %rsi,0x28(%rsp)
    34805bcc:	0f 85 05 00 00 00    	jne    34805bd7 <.LBB0_9>
    34805bd2:	e9 4e 00 00 00       	jmpq   34805c25 <.LBB0_11>

0000000034805bd7 <.LBB0_9>:
    34805bd7:	48 8b 7c 24 60       	mov    0x60(%rsp),%rdi
    34805bdc:	48 8b 74 24 68       	mov    0x68(%rsp),%rsi
    34805be1:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    34805be6:	48 8b 44 24 60       	mov    0x60(%rsp),%rax
    34805beb:	ff 50 48             	callq  *0x48(%rax)
    34805bee:	48 8b 54 24 20       	mov    0x20(%rsp),%rdx
    34805bf3:	48 39 d0             	cmp    %rdx,%rax
    34805bf6:	48 89 54 24 50       	mov    %rdx,0x50(%rsp)
    34805bfb:	0f 82 76 00 00 00    	jb     34805c77 <.LBB0_12>
    34805c01:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
    34805c06:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    34805c0b:	48 01 c8             	add    %rcx,%rax
    34805c0e:	48 8b 54 24 70       	mov    0x70(%rsp),%rdx
    34805c13:	48 29 ca             	sub    %rcx,%rdx
    34805c16:	48 89 44 24 30       	mov    %rax,0x30(%rsp)
    34805c1b:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
    34805c20:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)

0000000034805c25 <.LBB0_11>:
    34805c25:	48 8b 44 24 28       	mov    0x28(%rsp),%rax
    34805c2a:	48 8b 4c 24 40       	mov    0x40(%rsp),%rcx
    34805c2f:	48 8b 54 24 30       	mov    0x30(%rsp),%rdx
    34805c34:	48 8b 74 24 48       	mov    0x48(%rsp),%rsi
    34805c39:	48 8b 3e             	mov    (%rsi),%rdi
    34805c3c:	48 89 d6             	mov    %rdx,%rsi
    34805c3f:	48 89 ca             	mov    %rcx,%rdx
    34805c42:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    34805c47:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    34805c4c:	e8 ef af ff ff       	callq  34800c40 <memcpy>
    34805c51:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
    34805c56:	48 8b 54 24 48       	mov    0x48(%rsp),%rdx
    34805c5b:	48 03 0a             	add    (%rdx),%rcx
    34805c5e:	48 89 0a             	mov    %rcx,(%rdx)
    34805c61:	48 8b 4c 24 10       	mov    0x10(%rsp),%rcx
    34805c66:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    34805c6b:	48 01 f1             	add    %rsi,%rcx
    34805c6e:	48 89 04 24          	mov    %rax,(%rsp)
    34805c72:	48 89 4c 24 50       	mov    %rcx,0x50(%rsp)

0000000034805c77 <.LBB0_12>:
    34805c77:	48 8b 44 24 50       	mov    0x50(%rsp),%rax
    34805c7c:	48 83 c4 78          	add    $0x78,%rsp
    34805c80:	c3                   	retq   
    34805c81:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34805c88:	0f 1f 84 00 00 00 00 
    34805c8f:	00 

0000000034805c90 <fwrite>:
    34805c90:	48 83 ec 48          	sub    $0x48,%rsp
    34805c94:	31 c0                	xor    %eax,%eax
    34805c96:	41 88 c0             	mov    %al,%r8b
    34805c99:	49 89 d1             	mov    %rdx,%r9
    34805c9c:	4c 0f af ce          	imul   %rsi,%r9
    34805ca0:	83 b9 8c 00 00 00 ff 	cmpl   $0xffffffff,0x8c(%rcx)
    34805ca7:	48 89 54 24 40       	mov    %rdx,0x40(%rsp)
    34805cac:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
    34805cb1:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
    34805cb6:	48 89 4c 24 28       	mov    %rcx,0x28(%rsp)
    34805cbb:	4c 89 4c 24 20       	mov    %r9,0x20(%rsp)
    34805cc0:	44 88 44 24 1f       	mov    %r8b,0x1f(%rsp)
    34805cc5:	0f 8e 14 00 00 00    	jle    34805cdf <.LBB1_2>
    34805ccb:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
    34805cd0:	e8 1b fc ff ff       	callq  348058f0 <__lockfile>
    34805cd5:	83 f8 00             	cmp    $0x0,%eax
    34805cd8:	0f 95 c1             	setne  %cl
    34805cdb:	88 4c 24 1f          	mov    %cl,0x1f(%rsp)

0000000034805cdf <.LBB1_2>:
    34805cdf:	8a 44 24 1f          	mov    0x1f(%rsp),%al
    34805ce3:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
    34805ce8:	48 8b 74 24 20       	mov    0x20(%rsp),%rsi
    34805ced:	48 8b 54 24 28       	mov    0x28(%rsp),%rdx
    34805cf2:	88 44 24 1e          	mov    %al,0x1e(%rsp)
    34805cf6:	e8 95 fd ff ff       	callq  34805a90 <__fwritex>
    34805cfb:	8a 4c 24 1e          	mov    0x1e(%rsp),%cl
    34805cff:	f6 c1 01             	test   $0x1,%cl
    34805d02:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
    34805d07:	0f 85 05 00 00 00    	jne    34805d12 <.LBB1_3>
    34805d0d:	e9 0a 00 00 00       	jmpq   34805d1c <.LBB1_4>

0000000034805d12 <.LBB1_3>:
    34805d12:	48 8b 7c 24 28       	mov    0x28(%rsp),%rdi
    34805d17:	e8 e4 fb ff ff       	callq  34805900 <__unlockfile>

0000000034805d1c <.LBB1_4>:
    34805d1c:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    34805d21:	48 8b 4c 24 20       	mov    0x20(%rsp),%rcx
    34805d26:	48 39 c8             	cmp    %rcx,%rax
    34805d29:	48 8b 54 24 40       	mov    0x40(%rsp),%rdx
    34805d2e:	48 89 54 24 08       	mov    %rdx,0x8(%rsp)
    34805d33:	0f 84 16 00 00 00    	je     34805d4f <.LBB1_6>
    34805d39:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    34805d3e:	31 c9                	xor    %ecx,%ecx
    34805d40:	89 ca                	mov    %ecx,%edx
    34805d42:	48 8b 74 24 38       	mov    0x38(%rsp),%rsi
    34805d47:	48 f7 f6             	div    %rsi
    34805d4a:	48 89 44 24 08       	mov    %rax,0x8(%rsp)

0000000034805d4f <.LBB1_6>:
    34805d4f:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    34805d54:	48 83 c4 48          	add    $0x48,%rsp
    34805d58:	c3                   	retq   

0000000034805d59 <memset>:
    34805d59:	81 e6 ff 00 00 00    	and    $0xff,%esi
    34805d5f:	48 b8 01 01 01 01 01 	movabs $0x101010101010101,%rax
    34805d66:	01 01 01 
    34805d69:	48 89 d1             	mov    %rdx,%rcx
    34805d6c:	49 89 f8             	mov    %rdi,%r8
    34805d6f:	48 0f af c6          	imul   %rsi,%rax
    34805d73:	48 83 f9 10          	cmp    $0x10,%rcx
    34805d77:	72 10                	jb     34805d89 <memset+0x30>
    34805d79:	48 89 44 0f f8       	mov    %rax,-0x8(%rdi,%rcx,1)
    34805d7e:	48 c1 e9 03          	shr    $0x3,%rcx
    34805d82:	f3 48 ab             	rep stos %rax,%es:(%rdi)
    34805d85:	4c 89 c0             	mov    %r8,%rax
    34805d88:	c3                   	retq   
    34805d89:	85 c9                	test   %ecx,%ecx
    34805d8b:	74 29                	je     34805db6 <memset+0x5d>
    34805d8d:	88 07                	mov    %al,(%rdi)
    34805d8f:	88 44 0f ff          	mov    %al,-0x1(%rdi,%rcx,1)
    34805d93:	83 f9 02             	cmp    $0x2,%ecx
    34805d96:	76 1e                	jbe    34805db6 <memset+0x5d>
    34805d98:	88 47 01             	mov    %al,0x1(%rdi)
    34805d9b:	88 44 0f fe          	mov    %al,-0x2(%rdi,%rcx,1)
    34805d9f:	83 f9 04             	cmp    $0x4,%ecx
    34805da2:	76 12                	jbe    34805db6 <memset+0x5d>
    34805da4:	89 07                	mov    %eax,(%rdi)
    34805da6:	89 44 0f fc          	mov    %eax,-0x4(%rdi,%rcx,1)
    34805daa:	83 f9 08             	cmp    $0x8,%ecx
    34805dad:	76 07                	jbe    34805db6 <memset+0x5d>
    34805daf:	89 47 04             	mov    %eax,0x4(%rdi)
    34805db2:	89 44 0f f8          	mov    %eax,-0x8(%rdi,%rcx,1)
    34805db6:	4c 89 c0             	mov    %r8,%rax
    34805db9:	c3                   	retq   
    34805dba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000034805dc0 <strerror>:
    34805dc0:	31 c0                	xor    %eax,%eax
    34805dc2:	89 7c 24 fc          	mov    %edi,-0x4(%rsp)
    34805dc6:	89 44 24 f8          	mov    %eax,-0x8(%rsp)
    34805dca:	e9 00 00 00 00       	jmpq   34805dcf <.LBB0_1>

0000000034805dcf <.LBB0_1>:
    34805dcf:	8b 44 24 f8          	mov    -0x8(%rsp),%eax
    34805dd3:	48 b9 00 68 80 34 00 	movabs $0x34806800,%rcx
    34805dda:	00 00 00 
    34805ddd:	48 63 d0             	movslq %eax,%rdx
    34805de0:	0f b6 34 15 a0 67 80 	movzbl 0x348067a0(,%rdx,1),%esi
    34805de7:	34 
    34805de8:	83 f8 57             	cmp    $0x57,%eax
    34805deb:	40 0f 95 c7          	setne  %dil
    34805def:	44 8b 44 24 fc       	mov    -0x4(%rsp),%r8d
    34805df4:	44 39 c6             	cmp    %r8d,%esi
    34805df7:	41 0f 95 c1          	setne  %r9b
    34805dfb:	44 20 cf             	and    %r9b,%dil
    34805dfe:	40 f6 c7 01          	test   $0x1,%dil
    34805e02:	89 c6                	mov    %eax,%esi
    34805e04:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
    34805e08:	48 89 4c 24 e8       	mov    %rcx,-0x18(%rsp)
    34805e0d:	89 74 24 e4          	mov    %esi,-0x1c(%rsp)
    34805e11:	0f 85 05 00 00 00    	jne    34805e1c <.LBB0_2>
    34805e17:	e9 10 00 00 00       	jmpq   34805e2c <.LBB0_3>

0000000034805e1c <.LBB0_2>:
    34805e1c:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
    34805e20:	83 c0 01             	add    $0x1,%eax
    34805e23:	89 44 24 f8          	mov    %eax,-0x8(%rsp)
    34805e27:	e9 a3 ff ff ff       	jmpq   34805dcf <.LBB0_1>

0000000034805e2c <.LBB0_3>:
    34805e2c:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
    34805e30:	48 8b 4c 24 e8       	mov    -0x18(%rsp),%rcx
    34805e35:	83 f8 00             	cmp    $0x0,%eax
    34805e38:	48 89 ca             	mov    %rcx,%rdx
    34805e3b:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
    34805e3f:	48 89 4c 24 d8       	mov    %rcx,-0x28(%rsp)
    34805e44:	48 89 54 24 d0       	mov    %rdx,-0x30(%rsp)
    34805e49:	0f 84 3b 00 00 00    	je     34805e8a <.LBB0_6>

0000000034805e4f <.LBB0_4>:
    34805e4f:	48 8b 44 24 d0       	mov    -0x30(%rsp),%rax
    34805e54:	8a 08                	mov    (%rax),%cl
    34805e56:	48 83 c0 01          	add    $0x1,%rax
    34805e5a:	80 f9 00             	cmp    $0x0,%cl
    34805e5d:	48 89 c2             	mov    %rax,%rdx
    34805e60:	48 89 44 24 c8       	mov    %rax,-0x38(%rsp)
    34805e65:	48 89 54 24 d0       	mov    %rdx,-0x30(%rsp)
    34805e6a:	0f 85 df ff ff ff    	jne    34805e4f <.LBB0_4>
    34805e70:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
    34805e74:	83 c0 ff             	add    $0xffffffff,%eax
    34805e77:	48 8b 4c 24 c8       	mov    -0x38(%rsp),%rcx
    34805e7c:	48 89 4c 24 e8       	mov    %rcx,-0x18(%rsp)
    34805e81:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
    34805e85:	e9 a2 ff ff ff       	jmpq   34805e2c <.LBB0_3>

0000000034805e8a <.LBB0_6>:
    34805e8a:	48 8b 44 24 d8       	mov    -0x28(%rsp),%rax
    34805e8f:	c3                   	retq   

0000000034805e90 <wcrtomb>:
    34805e90:	48 83 ec 28          	sub    $0x28,%rsp
    34805e94:	b8 01 00 00 00       	mov    $0x1,%eax
    34805e99:	89 c1                	mov    %eax,%ecx
    34805e9b:	48 83 ff 00          	cmp    $0x0,%rdi
    34805e9f:	89 74 24 24          	mov    %esi,0x24(%rsp)
    34805ea3:	48 89 7c 24 18       	mov    %rdi,0x18(%rsp)
    34805ea8:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
    34805ead:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    34805eb2:	0f 84 5f 01 00 00    	je     34806017 <.LBB0_10>
    34805eb8:	8b 44 24 24          	mov    0x24(%rsp),%eax
    34805ebc:	3d 80 00 00 00       	cmp    $0x80,%eax
    34805ec1:	0f 83 1e 00 00 00    	jae    34805ee5 <.LBB0_3>
    34805ec7:	b8 01 00 00 00       	mov    $0x1,%eax
    34805ecc:	89 c1                	mov    %eax,%ecx
    34805ece:	8b 44 24 24          	mov    0x24(%rsp),%eax
    34805ed2:	88 c2                	mov    %al,%dl
    34805ed4:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    34805ed9:	88 16                	mov    %dl,(%rsi)
    34805edb:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    34805ee0:	e9 32 01 00 00       	jmpq   34806017 <.LBB0_10>

0000000034805ee5 <.LBB0_3>:
    34805ee5:	8b 44 24 24          	mov    0x24(%rsp),%eax
    34805ee9:	3d 00 08 00 00       	cmp    $0x800,%eax
    34805eee:	0f 83 33 00 00 00    	jae    34805f27 <.LBB0_5>
    34805ef4:	b8 02 00 00 00       	mov    $0x2,%eax
    34805ef9:	89 c1                	mov    %eax,%ecx
    34805efb:	8b 44 24 24          	mov    0x24(%rsp),%eax
    34805eff:	c1 e8 06             	shr    $0x6,%eax
    34805f02:	88 c2                	mov    %al,%dl
    34805f04:	80 ca c0             	or     $0xc0,%dl
    34805f07:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    34805f0c:	88 16                	mov    %dl,(%rsi)
    34805f0e:	8b 44 24 24          	mov    0x24(%rsp),%eax
    34805f12:	88 c2                	mov    %al,%dl
    34805f14:	80 e2 3f             	and    $0x3f,%dl
    34805f17:	80 ca 80             	or     $0x80,%dl
    34805f1a:	88 56 01             	mov    %dl,0x1(%rsi)
    34805f1d:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    34805f22:	e9 f0 00 00 00       	jmpq   34806017 <.LBB0_10>

0000000034805f27 <.LBB0_5>:
    34805f27:	8b 44 24 24          	mov    0x24(%rsp),%eax
    34805f2b:	3d 00 d8 00 00       	cmp    $0xd800,%eax
    34805f30:	0f 92 c1             	setb   %cl
    34805f33:	25 00 e0 ff ff       	and    $0xffffe000,%eax
    34805f38:	3d 00 e0 00 00       	cmp    $0xe000,%eax
    34805f3d:	0f 94 c2             	sete   %dl
    34805f40:	08 d1                	or     %dl,%cl
    34805f42:	f6 c1 01             	test   $0x1,%cl
    34805f45:	0f 85 05 00 00 00    	jne    34805f50 <.LBB0_6>
    34805f4b:	e9 45 00 00 00       	jmpq   34805f95 <.LBB0_7>

0000000034805f50 <.LBB0_6>:
    34805f50:	b8 03 00 00 00       	mov    $0x3,%eax
    34805f55:	89 c1                	mov    %eax,%ecx
    34805f57:	8b 44 24 24          	mov    0x24(%rsp),%eax
    34805f5b:	c1 e8 0c             	shr    $0xc,%eax
    34805f5e:	88 c2                	mov    %al,%dl
    34805f60:	80 ca e0             	or     $0xe0,%dl
    34805f63:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    34805f68:	88 16                	mov    %dl,(%rsi)
    34805f6a:	8b 44 24 24          	mov    0x24(%rsp),%eax
    34805f6e:	c1 e8 06             	shr    $0x6,%eax
    34805f71:	88 c2                	mov    %al,%dl
    34805f73:	80 e2 3f             	and    $0x3f,%dl
    34805f76:	80 ca 80             	or     $0x80,%dl
    34805f79:	88 56 01             	mov    %dl,0x1(%rsi)
    34805f7c:	8b 44 24 24          	mov    0x24(%rsp),%eax
    34805f80:	88 c2                	mov    %al,%dl
    34805f82:	80 e2 3f             	and    $0x3f,%dl
    34805f85:	80 ca 80             	or     $0x80,%dl
    34805f88:	88 56 02             	mov    %dl,0x2(%rsi)
    34805f8b:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    34805f90:	e9 82 00 00 00       	jmpq   34806017 <.LBB0_10>

0000000034805f95 <.LBB0_7>:
    34805f95:	8b 44 24 24          	mov    0x24(%rsp),%eax
    34805f99:	05 00 00 ff ff       	add    $0xffff0000,%eax
    34805f9e:	3d 00 00 10 00       	cmp    $0x100000,%eax
    34805fa3:	0f 83 57 00 00 00    	jae    34806000 <.LBB0_9>
    34805fa9:	b8 04 00 00 00       	mov    $0x4,%eax
    34805fae:	89 c1                	mov    %eax,%ecx
    34805fb0:	8b 44 24 24          	mov    0x24(%rsp),%eax
    34805fb4:	c1 e8 12             	shr    $0x12,%eax
    34805fb7:	88 c2                	mov    %al,%dl
    34805fb9:	80 ca f0             	or     $0xf0,%dl
    34805fbc:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    34805fc1:	88 16                	mov    %dl,(%rsi)
    34805fc3:	8b 44 24 24          	mov    0x24(%rsp),%eax
    34805fc7:	c1 e8 0c             	shr    $0xc,%eax
    34805fca:	88 c2                	mov    %al,%dl
    34805fcc:	80 e2 3f             	and    $0x3f,%dl
    34805fcf:	80 ca 80             	or     $0x80,%dl
    34805fd2:	88 56 01             	mov    %dl,0x1(%rsi)
    34805fd5:	8b 44 24 24          	mov    0x24(%rsp),%eax
    34805fd9:	c1 e8 06             	shr    $0x6,%eax
    34805fdc:	88 c2                	mov    %al,%dl
    34805fde:	80 e2 3f             	and    $0x3f,%dl
    34805fe1:	80 ca 80             	or     $0x80,%dl
    34805fe4:	88 56 02             	mov    %dl,0x2(%rsi)
    34805fe7:	8b 44 24 24          	mov    0x24(%rsp),%eax
    34805feb:	88 c2                	mov    %al,%dl
    34805fed:	80 e2 3f             	and    $0x3f,%dl
    34805ff0:	80 ca 80             	or     $0x80,%dl
    34805ff3:	88 56 03             	mov    %dl,0x3(%rsi)
    34805ff6:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
    34805ffb:	e9 17 00 00 00       	jmpq   34806017 <.LBB0_10>

0000000034806000 <.LBB0_9>:
    34806000:	e8 eb ab ff ff       	callq  34800bf0 <__errno_location>
    34806005:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
    3480600c:	c7 00 54 00 00 00    	movl   $0x54,(%rax)
    34806012:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)

0000000034806017 <.LBB0_10>:
    34806017:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
    3480601c:	48 83 c4 28          	add    $0x28,%rsp
    34806020:	c3                   	retq   
    34806021:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    34806028:	00 00 00 
    3480602b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000034806030 <__towrite>:
    34806030:	8a 87 8a 00 00 00    	mov    0x8a(%rdi),%al
    34806036:	88 c1                	mov    %al,%cl
    34806038:	80 c1 ff             	add    $0xff,%cl
    3480603b:	08 c1                	or     %al,%cl
    3480603d:	88 8f 8a 00 00 00    	mov    %cl,0x8a(%rdi)
    34806043:	8b 17                	mov    (%rdi),%edx
    34806045:	89 d6                	mov    %edx,%esi
    34806047:	83 e6 08             	and    $0x8,%esi
    3480604a:	83 fe 00             	cmp    $0x0,%esi
    3480604d:	48 89 7c 24 f8       	mov    %rdi,-0x8(%rsp)
    34806052:	89 54 24 f4          	mov    %edx,-0xc(%rsp)
    34806056:	0f 84 1c 00 00 00    	je     34806078 <.LBB0_2>
    3480605c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    34806061:	8b 4c 24 f4          	mov    -0xc(%rsp),%ecx
    34806065:	83 c9 20             	or     $0x20,%ecx
    34806068:	48 8b 54 24 f8       	mov    -0x8(%rsp),%rdx
    3480606d:	89 0a                	mov    %ecx,(%rdx)
    3480606f:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
    34806073:	e9 33 00 00 00       	jmpq   348060ab <.LBB0_3>

0000000034806078 <.LBB0_2>:
    34806078:	31 c0                	xor    %eax,%eax
    3480607a:	48 8b 4c 24 f8       	mov    -0x8(%rsp),%rcx
    3480607f:	48 c7 41 10 00 00 00 	movq   $0x0,0x10(%rcx)
    34806086:	00 
    34806087:	48 c7 41 08 00 00 00 	movq   $0x0,0x8(%rcx)
    3480608e:	00 
    3480608f:	48 8b 51 58          	mov    0x58(%rcx),%rdx
    34806093:	48 89 51 38          	mov    %rdx,0x38(%rcx)
    34806097:	48 89 51 28          	mov    %rdx,0x28(%rcx)
    3480609b:	48 8b 51 58          	mov    0x58(%rcx),%rdx
    3480609f:	48 03 51 60          	add    0x60(%rcx),%rdx
    348060a3:	48 89 51 20          	mov    %rdx,0x20(%rcx)
    348060a7:	89 44 24 f0          	mov    %eax,-0x10(%rsp)

00000000348060ab <.LBB0_3>:
    348060ab:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
    348060af:	c3                   	retq   

00000000348060b0 <__towrite_needs_stdio_exit>:
    348060b0:	50                   	push   %rax
    348060b1:	e8 0a 00 00 00       	callq  348060c0 <__stdio_exit>
    348060b6:	58                   	pop    %rax
    348060b7:	c3                   	retq   
    348060b8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    348060bf:	00 

00000000348060c0 <__stdio_exit>:
    348060c0:	48 83 ec 18          	sub    $0x18,%rsp
    348060c4:	48 b8 98 70 a0 34 00 	movabs $0x34a07098,%rax
    348060cb:	00 00 00 
    348060ce:	48 83 c0 28          	add    $0x28,%rax
    348060d2:	48 89 c7             	mov    %rax,%rdi
    348060d5:	e8 16 01 00 00       	callq  348061f0 <__lock>
    348060da:	48 b8 98 70 a0 34 00 	movabs $0x34a07098,%rax
    348060e1:	00 00 00 
    348060e4:	48 83 c0 20          	add    $0x20,%rax
    348060e8:	48 89 44 24 10       	mov    %rax,0x10(%rsp)

00000000348060ed <.LBB0_1>:
    348060ed:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    348060f2:	48 8b 00             	mov    (%rax),%rax
    348060f5:	48 83 f8 00          	cmp    $0x0,%rax
    348060f9:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    348060fe:	0f 84 1d 00 00 00    	je     34806121 <.LBB0_3>
    34806104:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    34806109:	e8 32 00 00 00       	callq  34806140 <close_file>
    3480610e:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
    34806113:	48 83 c7 70          	add    $0x70,%rdi
    34806117:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
    3480611c:	e9 cc ff ff ff       	jmpq   348060ed <.LBB0_1>

0000000034806121 <.LBB0_3>:
    34806121:	48 8b 3c 25 48 70 a0 	mov    0x34a07048,%rdi
    34806128:	34 
    34806129:	e8 12 00 00 00       	callq  34806140 <close_file>
    3480612e:	48 8b 3c 25 48 70 a0 	mov    0x34a07048,%rdi
    34806135:	34 
    34806136:	e8 05 00 00 00       	callq  34806140 <close_file>
    3480613b:	48 83 c4 18          	add    $0x18,%rsp
    3480613f:	c3                   	retq   

0000000034806140 <close_file>:
    34806140:	48 83 ec 38          	sub    $0x38,%rsp
    34806144:	48 83 ff 00          	cmp    $0x0,%rdi
    34806148:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
    3480614d:	0f 84 94 00 00 00    	je     348061e7 <.LBB1_7>
    34806153:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
    34806158:	83 b8 8c 00 00 00 ff 	cmpl   $0xffffffff,0x8c(%rax)
    3480615f:	0f 8e 0e 00 00 00    	jle    34806173 <.LBB1_3>
    34806165:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
    3480616a:	e8 81 f7 ff ff       	callq  348058f0 <__lockfile>
    3480616f:	89 44 24 2c          	mov    %eax,0x2c(%rsp)

0000000034806173 <.LBB1_3>:
    34806173:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
    34806178:	48 8b 48 28          	mov    0x28(%rax),%rcx
    3480617c:	48 3b 48 38          	cmp    0x38(%rax),%rcx
    34806180:	0f 86 1c 00 00 00    	jbe    348061a2 <.LBB1_5>
    34806186:	31 c0                	xor    %eax,%eax
    34806188:	89 c1                	mov    %eax,%ecx
    3480618a:	48 8b 7c 24 30       	mov    0x30(%rsp),%rdi
    3480618f:	48 89 ce             	mov    %rcx,%rsi
    34806192:	48 89 ca             	mov    %rcx,%rdx
    34806195:	48 8b 4c 24 30       	mov    0x30(%rsp),%rcx
    3480619a:	ff 51 48             	callq  *0x48(%rcx)
    3480619d:	48 89 44 24 20       	mov    %rax,0x20(%rsp)

00000000348061a2 <.LBB1_5>:
    348061a2:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
    348061a7:	48 8b 48 08          	mov    0x8(%rax),%rcx
    348061ab:	48 8b 50 10          	mov    0x10(%rax),%rdx
    348061af:	48 39 d1             	cmp    %rdx,%rcx
    348061b2:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
    348061b7:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
    348061bc:	0f 83 25 00 00 00    	jae    348061e7 <.LBB1_7>
    348061c2:	ba 01 00 00 00       	mov    $0x1,%edx
    348061c7:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
    348061cc:	48 8b 48 50          	mov    0x50(%rax),%rcx
    348061d0:	48 8b 74 24 18       	mov    0x18(%rsp),%rsi
    348061d5:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    348061da:	48 29 fe             	sub    %rdi,%rsi
    348061dd:	48 89 c7             	mov    %rax,%rdi
    348061e0:	ff d1                	callq  *%rcx
    348061e2:	48 89 44 24 08       	mov    %rax,0x8(%rsp)

00000000348061e7 <.LBB1_7>:
    348061e7:	48 83 c4 38          	add    $0x38,%rsp
    348061eb:	c3                   	retq   
    348061ec:	0f 1f 40 00          	nopl   0x0(%rax)

00000000348061f0 <__lock>:
    348061f0:	48 83 ec 18          	sub    $0x18,%rsp
    348061f4:	8b 04 25 b0 70 a0 34 	mov    0x34a070b0,%eax
    348061fb:	83 f8 00             	cmp    $0x0,%eax
    348061fe:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
    34806203:	0f 84 43 00 00 00    	je     3480624c <.LBB0_4>
    34806209:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
    3480620e:	48 83 c0 04          	add    $0x4,%rax
    34806212:	48 89 44 24 08       	mov    %rax,0x8(%rsp)

0000000034806217 <.LBB0_2>:
    34806217:	be 01 00 00 00       	mov    $0x1,%esi
    3480621c:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    34806221:	e8 3a 00 00 00       	callq  34806260 <a_swap>
    34806226:	83 f8 00             	cmp    $0x0,%eax
    34806229:	0f 84 1d 00 00 00    	je     3480624c <.LBB0_4>
    3480622f:	b8 01 00 00 00       	mov    $0x1,%eax
    34806234:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    34806239:	48 8b 74 24 08       	mov    0x8(%rsp),%rsi
    3480623e:	89 c2                	mov    %eax,%edx
    34806240:	89 c1                	mov    %eax,%ecx
    34806242:	e8 a9 00 00 00       	callq  348062f0 <__wait>
    34806247:	e9 cb ff ff ff       	jmpq   34806217 <.LBB0_2>

000000003480624c <.LBB0_4>:
    3480624c:	48 83 c4 18          	add    $0x18,%rsp
    34806250:	c3                   	retq   
    34806251:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34806258:	0f 1f 84 00 00 00 00 
    3480625f:	00 

0000000034806260 <a_swap>:
    34806260:	87 37                	xchg   %esi,(%rdi)
    34806262:	89 f0                	mov    %esi,%eax
    34806264:	c3                   	retq   
    34806265:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%rax,%rax,1)
    3480626c:	00 00 00 00 

0000000034806270 <__unlock>:
    34806270:	48 83 ec 18          	sub    $0x18,%rsp
    34806274:	8b 07                	mov    (%rdi),%eax
    34806276:	83 f8 00             	cmp    $0x0,%eax
    34806279:	48 89 7c 24 10       	mov    %rdi,0x10(%rsp)
    3480627e:	0f 84 3d 00 00 00    	je     348062c1 <.LBB2_3>
    34806284:	31 f6                	xor    %esi,%esi
    34806286:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    3480628b:	e8 40 00 00 00       	callq  348062d0 <a_store>
    34806290:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
    34806295:	8b 77 04             	mov    0x4(%rdi),%esi
    34806298:	83 fe 00             	cmp    $0x0,%esi
    3480629b:	0f 84 20 00 00 00    	je     348062c1 <.LBB2_3>
    348062a1:	b8 ca 00 00 00       	mov    $0xca,%eax
    348062a6:	89 c7                	mov    %eax,%edi
    348062a8:	b8 01 00 00 00       	mov    $0x1,%eax
    348062ad:	89 c1                	mov    %eax,%ecx
    348062af:	48 8b 74 24 10       	mov    0x10(%rsp),%rsi
    348062b4:	48 89 ca             	mov    %rcx,%rdx
    348062b7:	e8 24 00 00 00       	callq  348062e0 <__syscall3>
    348062bc:	48 89 44 24 08       	mov    %rax,0x8(%rsp)

00000000348062c1 <.LBB2_3>:
    348062c1:	48 83 c4 18          	add    $0x18,%rsp
    348062c5:	c3                   	retq   
    348062c6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    348062cd:	00 00 00 

00000000348062d0 <a_store>:
    348062d0:	89 37                	mov    %esi,(%rdi)
    348062d2:	c3                   	retq   
    348062d3:	66 66 66 66 2e 0f 1f 	data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    348062da:	84 00 00 00 00 00 

00000000348062e0 <__syscall3>:
    348062e0:	48 89 f8             	mov    %rdi,%rax
    348062e3:	48 89 f7             	mov    %rsi,%rdi
    348062e6:	48 89 d6             	mov    %rdx,%rsi
    348062e9:	48 89 ca             	mov    %rcx,%rdx
    348062ec:	0f 05                	syscall 
    348062ee:	c3                   	retq   
    348062ef:	90                   	nop

00000000348062f0 <__wait>:
    348062f0:	48 83 ec 48          	sub    $0x48,%rsp
    348062f4:	b8 10 27 00 00       	mov    $0x2710,%eax
    348062f9:	89 54 24 44          	mov    %edx,0x44(%rsp)
    348062fd:	48 89 74 24 38       	mov    %rsi,0x38(%rsp)
    34806302:	48 89 7c 24 30       	mov    %rdi,0x30(%rsp)
    34806307:	89 4c 24 2c          	mov    %ecx,0x2c(%rsp)
    3480630b:	89 44 24 28          	mov    %eax,0x28(%rsp)
    3480630f:	e9 00 00 00 00       	jmpq   34806314 <.LBB0_1>

0000000034806314 <.LBB0_1>:
    34806314:	8b 44 24 28          	mov    0x28(%rsp),%eax
    34806318:	89 c1                	mov    %eax,%ecx
    3480631a:	83 c1 ff             	add    $0xffffffff,%ecx
    3480631d:	83 f8 00             	cmp    $0x0,%eax
    34806320:	89 4c 24 24          	mov    %ecx,0x24(%rsp)
    34806324:	0f 84 25 00 00 00    	je     3480634f <.LBB0_4>
    3480632a:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
    3480632f:	8b 08                	mov    (%rax),%ecx
    34806331:	8b 54 24 44          	mov    0x44(%rsp),%edx
    34806335:	39 d1                	cmp    %edx,%ecx
    34806337:	0f 85 a8 00 00 00    	jne    348063e5 <.LBB0_11>
    3480633d:	e8 ee 00 00 00       	callq  34806430 <a_spin>
    34806342:	8b 44 24 24          	mov    0x24(%rsp),%eax
    34806346:	89 44 24 28          	mov    %eax,0x28(%rsp)
    3480634a:	e9 c5 ff ff ff       	jmpq   34806314 <.LBB0_1>

000000003480634f <.LBB0_4>:
    3480634f:	48 8b 44 24 38       	mov    0x38(%rsp),%rax
    34806354:	48 83 f8 00          	cmp    $0x0,%rax
    34806358:	0f 95 c1             	setne  %cl
    3480635b:	f6 c1 01             	test   $0x1,%cl
    3480635e:	88 4c 24 23          	mov    %cl,0x23(%rsp)
    34806362:	0f 85 05 00 00 00    	jne    3480636d <.LBB0_5>
    34806368:	e9 0a 00 00 00       	jmpq   34806377 <.LBB0_6>

000000003480636d <.LBB0_5>:
    3480636d:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
    34806372:	e8 79 00 00 00       	callq  348063f0 <a_inc>

0000000034806377 <.LBB0_6>:
    34806377:	8b 44 24 44          	mov    0x44(%rsp),%eax
    3480637b:	48 63 c8             	movslq %eax,%rcx
    3480637e:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)

0000000034806383 <.LBB0_7>:
    34806383:	48 8b 44 24 30       	mov    0x30(%rsp),%rax
    34806388:	8b 08                	mov    (%rax),%ecx
    3480638a:	8b 54 24 44          	mov    0x44(%rsp),%edx
    3480638e:	39 d1                	cmp    %edx,%ecx
    34806390:	0f 85 34 00 00 00    	jne    348063ca <.LBB0_9>
    34806396:	b8 ca 00 00 00       	mov    $0xca,%eax
    3480639b:	89 c7                	mov    %eax,%edi
    3480639d:	31 c0                	xor    %eax,%eax
    3480639f:	89 c1                	mov    %eax,%ecx
    348063a1:	48 8b 74 24 30       	mov    0x30(%rsp),%rsi
    348063a6:	48 89 ca             	mov    %rcx,%rdx
    348063a9:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
    348063ae:	48 89 4c 24 10       	mov    %rcx,0x10(%rsp)
    348063b3:	4c 89 c1             	mov    %r8,%rcx
    348063b6:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
    348063bb:	e8 40 00 00 00       	callq  34806400 <__syscall4>
    348063c0:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
    348063c5:	e9 b9 ff ff ff       	jmpq   34806383 <.LBB0_7>

00000000348063ca <.LBB0_9>:
    348063ca:	8a 44 24 23          	mov    0x23(%rsp),%al
    348063ce:	a8 01                	test   $0x1,%al
    348063d0:	0f 85 05 00 00 00    	jne    348063db <.LBB0_10>
    348063d6:	e9 0a 00 00 00       	jmpq   348063e5 <.LBB0_11>

00000000348063db <.LBB0_10>:
    348063db:	48 8b 7c 24 38       	mov    0x38(%rsp),%rdi
    348063e0:	e8 3b 00 00 00       	callq  34806420 <a_dec>

00000000348063e5 <.LBB0_11>:
    348063e5:	48 83 c4 48          	add    $0x48,%rsp
    348063e9:	c3                   	retq   
    348063ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000348063f0 <a_inc>:
    348063f0:	f0 ff 07             	lock incl (%rdi)
    348063f3:	c3                   	retq   
    348063f4:	66 66 66 2e 0f 1f 84 	data32 data32 nopw %cs:0x0(%rax,%rax,1)
    348063fb:	00 00 00 00 00 

0000000034806400 <__syscall4>:
    34806400:	48 89 f8             	mov    %rdi,%rax
    34806403:	48 89 f7             	mov    %rsi,%rdi
    34806406:	48 89 d6             	mov    %rdx,%rsi
    34806409:	48 89 ca             	mov    %rcx,%rdx
    3480640c:	4d 89 c2             	mov    %r8,%r10
    3480640f:	0f 05                	syscall 
    34806411:	c3                   	retq   
    34806412:	66 66 66 66 66 2e 0f 	data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
    34806419:	1f 84 00 00 00 00 00 

0000000034806420 <a_dec>:
    34806420:	f0 ff 0f             	lock decl (%rdi)
    34806423:	c3                   	retq   
    34806424:	66 66 66 2e 0f 1f 84 	data32 data32 nopw %cs:0x0(%rax,%rax,1)
    3480642b:	00 00 00 00 00 

0000000034806430 <a_spin>:
    34806430:	f3 90                	pause  
    34806432:	c3                   	retq   
