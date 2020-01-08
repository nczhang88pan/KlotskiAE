/*************************************************************************
	> File Name: securityCPY.h
	> Author: 
	> Mail: 
	> Created Time: Wed 16 Aug 2017 01:24:58 PM PDT
 ************************************************************************/

#ifndef _SECURITYCPY_H
#define _SECURITYCPY_H
void secureCopy();

struct ContinuousPages{
	
	public :
	Elf64_Xword addr;
	int    num;
	
	ContinuousPages(Elf64_Xword x,int y){
		addr= x;
		num = y;
	}
};

#define SHUFFLE_NUMBER 16
//pageCopyRandomSequence
long pageSequence[16]={0,0x1,0x2,0x3,0x4,0x5,0x6,0x7,0x8,0x9,0xa,0xb,0xc,0xd,0xe,0xf};
long stackPageSequence[16]={0,0x1,0x2,0x3,0x4,0x5,0x6,0x7,0x8,0x9,0xa,0xb,0xc,0xd,0xe,0xf};
long heapPageSequence[16]={0,0x1,0x2,0x3,0x4,0x5,0x6,0x7,0x8,0x9,0xa,0xb,0xc,0xd,0xe,0xf};
//pageShuffSequence
char YmmCopySequence[16]={0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15};

//extern unsigned long pagetable[0x400*4*4+1];
int CopyPages(uint64_t physical_base_address,int shuffleNum,long int *shuffleSequence);
#endif
