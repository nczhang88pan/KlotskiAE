default: cjpeg djpeg

CC = /home/alax/Desktop/llvmProgram/llvm/cmake-build-release/bin/clang
JPEG_SDK= ../.libs/libjpeg.a
ASM_OBJS = ../../program/lib/memset.o ../../program/lib/memcpy.o

BASE_CFLAGS = -Wall -pedantic -Wno-unused-function -std=gnu11 -O2 -fno-asynchronous-unwind-tables -fno-jump-tables -fno-inline

CFLAGS= $(BASE_CFLAGS) -I../  -fno-stack-protector -fvisibility=hidden -fomit-frame-pointer

decom.o: jpeg_decom_example.c
	$(CC) $(CFLAGS) -c jpeg_decom_example.c -o decom.o
cjpeg.o: cjpeg_my.c
	$(CC) $(CFLAGS) -c cjpeg_my.c -o cjpeg.o

rdppm.o: ../rdppm.c
	$(CC) $(CFLAGS) -c ../rdppm.c 

rdgif.o: ../rdgif.c
	$(CC) $(CFLAGS) -c ../rdgif.c 

rdbmp.o: ../rdbmp.c
	$(CC) $(CFLAGS) -c ../rdbmp.c 

rdrle.o: ../rdrle.c
	$(CC) $(CFLAGS) -c ../rdrle.c 

rdtarga.o: ../rdtarga.c
	$(CC) $(CFLAGS) -c ../rdtarga.c 

jpegTestCase: decom.o $(JPEG_SDK)
	$(CC) $(CFLAGS) decom.o -L../.libs/ -ljpeg -o main

malloc.o: ../../program/malloc/malloc.c ../../program/malloc/dlmalloc.inc
	$(CC) $(CFLAGS) -c -o $@ $<

../../program/lib/%.o: ../../program/lib/%.s
	$(CC) -c -o $@ $<

djpeg.o: djpeg.c
	$(CC) $(CFLAGS) -c djpeg.c -o djpeg.o

rdcolmap.o: ../rdcolmap.c
	$(CC) $(CFLAGS) -c ../rdcolmap.c 

wrppm.o: ../wrppm.c
	$(CC) $(CFLAGS) -c ../wrppm.c 

wrgif.o: ../wrgif.c
	$(CC) $(CFLAGS) -c ../wrgif.c 
	
wrbmp.o: ../wrbmp.c
	$(CC) $(CFLAGS) -c ../wrbmp.c 

wrrle.o: ../wrrle.c
	$(CC) $(CFLAGS) -c ../wrrle.c 

wrtarga.o: ../wrtarga.c
	$(CC) $(CFLAGS) -c ../wrtarga.c 

cdjpeg.o:../cdjpeg.c
	$(CC) $(CFLAGS) -c cdjpeg.c 


#cjpeg: cjpeg.o $(JPEG_SDK) rdppm.o rdgif.o rdbmp.o rdrle.o rdtarga.o malloc.o
#	$(CC) $(CFLAGS) cjpeg.o rdppm.o rdgif.o rdbmp.o rdrle.o rdtarga.o malloc.o -L../.libs/ -ljpeg -o cjpeg

cjpeg: cjpeg.o $(JPEG_SDK) rdppm.o malloc.o $(ASM_OBJS)
	$(CC) cjpeg.o -Wl,-T,program.ld rdppm.o -L../.libs/ -ljpeg -L../../program -lFakeC -nostartfiles -nostdlib -o cjpeg
#	$(CC) cjpeg.o rdppm.o malloc.o $(ASM_OBJS) -L../.libs/ -nostartfiles -ljpeg -o cjpeg
#	$(CC) cjpeg.o rdppm.o malloc.o -L../.libs/ -ljpeg -o cjpeg

djpeg: djpeg.o $(JPEG_SDK) wrbmp.o malloc.o  $(ASM_OBJS)
	$(CC) djpeg.o wrbmp.o -Wl,-T,program.ld -L../.libs/ -ljpeg -L../../program -lFakeC -nostartfiles -nostdlib -o djpeg

test: cjpeg
	#rm -f testout*
	#./cjpeg
	cmp ./testout.jpg ./testimg.jpg

clean:
	rm *.o cjpeg djpeg 
