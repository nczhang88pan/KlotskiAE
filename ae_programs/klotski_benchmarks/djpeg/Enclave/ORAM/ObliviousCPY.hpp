#pragma once

#define copySrcToYMMX(X)\
__asm__ __volatile__(\
"vmovdqa (%0), %%ymm"#X"\n\t"\
:\
:"r"(src)\
:"memory");

#define copyYMMXToTheMemeory(X)\
__asm__ __volatile__(\
"vmovdqa %%ymm"#X",(%0) \n\t"\
:\
:"r"(target_addr)\
:"memory");

#define intendToRead(srcAddr)\
__asm__ __volatile__(\
"mov %0,%%r14 \n\t"\
:\
:"r"(srcAddr)\
:"r14");

#define intendToAccessRW(addr)\
__asm__ __volatile__(\
"mov %0,%%r14 \n\t"\
"mov %%r14,%0 \n\t"\
:\
:"r"(addr)\
:"r14");

#define intendToAccessSrcAndWriteZeroToDest(src,dest)\
__asm__ __volatile__(\
"mov %0,%%r14 \n\t"\
"mov $0,%1 \n\t"\
:\
:"r"(src),"r"(dest)\
:"r14");

#define WriteZero(dest)\
__asm__ __volatile__(\
"mov $0,%0 \n\t"\
:\
:"r"(dest)\
:);


#define cpySrcToYMM_GROUP(srcAddr)\
__asm__ __volatile__(\
"lea (%0),%%r14 \n\t"\
"vmovntdqa 0x00(%%r14),%%ymm0\n\t"\
"vmovntdqa 0x20(%%r14),%%ymm1\n\t"\
"vmovntdqa 0x40(%%r14),%%ymm2\n\t"\
"vmovntdqa 0x60(%%r14),%%ymm3\n\t"\
"vmovntdqa 0x80(%%r14),%%ymm4\n\t"\
"vmovntdqa 0xa0(%%r14),%%ymm5\n\t"\
"vmovntdqa 0xc0(%%r14),%%ymm6\n\t"\
"vmovntdqa 0xe0(%%r14),%%ymm7\n\t"\
"vmovntdqa 0x100(%%r14),%%ymm8\n\t"\
"vmovntdqa 0x120(%%r14),%%ymm9\n\t"\
"vmovntdqa 0x140(%%r14),%%ymm10\n\t"\
"vmovntdqa 0x160(%%r14),%%ymm11\n\t"\
"vmovntdqa 0x180(%%r14),%%ymm12\n\t"\
"vmovntdqa 0x1a0(%%r14),%%ymm13\n\t"\
"vmovntdqa 0x1c0(%%r14),%%ymm14\n\t"\
"vmovntdqa 0x1e0(%%r14),%%ymm15\n\t"\
:\
:"r"(srcAddr)\
:"xmm0","rsi","r14","rdi","xmm1","xmm2","xmm3","xmm4","xmm5","xmm6","xmm7","xmm8","xmm9","xmm10","xmm11","xmm12","xmm13","xmm14","xmm15");

// "vmovntdq %%ymm0,0x00(%%r14)\n\t"
#define copyYMMXToTheMemeory_GROUP(destAddr)\
__asm__ __volatile__(\
"lea (%0),%%r14 \n\t"\
"vmovdqa %%ymm0,0x00(%%r14)\n\t"\
"vmovdqa %%ymm1,0x20(%%r14)\n\t"\
"vmovdqa %%ymm2,0x40(%%r14)\n\t"\
"vmovdqa %%ymm3,0x60(%%r14)\n\t"\
"vmovdqa %%ymm4,0x80(%%r14)\n\t"\
"vmovdqa %%ymm5,0xa0(%%r14)\n\t"\
"vmovdqa %%ymm6,0xc0(%%r14)\n\t"\
"vmovdqa %%ymm7,0xe0(%%r14)\n\t"\
"vmovdqa %%ymm8,0x100(%%r14)\n\t"\
"vmovdqa %%ymm9,0x120(%%r14)\n\t"\
"vmovdqa %%ymm10,0x140(%%r14)\n\t"\
"vmovdqa %%ymm11,0x160(%%r14)\n\t"\
"vmovdqa %%ymm12,0x180(%%r14)\n\t"\
"vmovdqa %%ymm13,0x1a0(%%r14)\n\t"\
"vmovdqa %%ymm14,0x1c0(%%r14)\n\t"\
"vmovdqa %%ymm15,0x1e0(%%r14)\n\t"\
:\
:"r"(destAddr)\
:"memory","r14");