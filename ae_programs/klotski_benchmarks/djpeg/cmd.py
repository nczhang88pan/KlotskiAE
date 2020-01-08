#!/usr/bin/env python
# coding=utf-8
import os
import subprocess
import sys

GBK = 'gbk'
UTF8 = 'utf-8'
current_encoding = GBK

def exec_program(cmd, output_fp):
	current_encoding = GBK

	popen = subprocess.Popen( cmd.split(" "),
                         stdout = subprocess.PIPE,
                         stderr = subprocess.PIPE,
                         bufsize=1)

	while popen.poll() is None:
    		r = popen.stdout.readline().decode(current_encoding)
		output_fp.write(r)

	if popen.poll() != 0: 
    		err = popen.stderr.read().decode(current_encoding)
    		sys.stdout.write(err)             


def runDjpeg(randomPageSwap, cacheSize):
    #make
    #1. make clean
    output = subprocess.check_output("make clean", shell=True)
    makeDJPEGProgramCMD = "make SGX_MODE=HW SGX_DEBUG=1 CACHENUM=" + str(cacheSize)

    if randomPageSwap==False:
        makeDJPEGProgramCMD = makeDJPEGProgramCMD + " PSR=OFF"
        outputFile = "../../resultDir/djpeg/Result.withORAM."+ str(cacheSize)
    else:
        makeDJPEGProgramCMD = makeDJPEGProgramCMD + " PSR=ON"
        outputFile = "../../resultDir/djpeg/Result.withORAM.RPS."+ str(cacheSize)

    #2. make
    print("saving to:" + outputFile)
    output = subprocess.check_output(makeDJPEGProgramCMD, shell=True)
    
    #3. run program nbench
    tdir = "/home/root/klotski/ae_programs/klotski_benchmarks/imgs/"
    input_jpegs = tdir + "inputDir/jpg/download"
    output_ppms = tdir + "outputDir/bmp/download"

    #output = subprocess.check_output("rm /home/root/klotski/libjpeg/testCase/outputDir/bmp/*", shell=True)
    with open(outputFile, "w") as fp:
        cmd = "./app djpeg " + input_jpegs + " " + output_ppms
    	print("make clean")
    	print(makeDJPEGProgramCMD)
        if randomPageSwap:
	   print("the program will swap all mini-pages out after every 0x500 code dereferences.")
        print("exectuing: "+ cmd + ", results are saving to:" + outputFile)
        exec_program(cmd, fp)

def processingJpeg():
    cacheNumSet = [2,4,8,16,32]

    # if the program crashes, uncomment this and run the scripts again.
    #cacheNumSet = [4]
    print("processingDjpeg")

    randomPageSwap = False 
    for cacheNum in cacheNumSet:
        runDjpeg(randomPageSwap, cacheNum)

    randomPageSwap = True
    for cacheNum in cacheNumSet:
        runDjpeg(randomPageSwap, cacheNum)

def main():
    processingJpeg()

if __name__=="__main__":
    main()
