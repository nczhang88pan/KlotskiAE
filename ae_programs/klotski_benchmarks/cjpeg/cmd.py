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

def runCjpeg(randomPageSwap, cacheSize):
    #make
    #1. make clean
    print("make clean")
    output = subprocess.check_output("make clean", shell=True)
    makeCJPEGProgramCMD = "make SGX_MODE=HW SGX_DEBUG=1 CACHENUM=" + str(cacheSize)
    if randomPageSwap==False:
        makeCJPEGProgramCMD = makeCJPEGProgramCMD + " PSR=OFF"
        outputFile = "../../resultDir/cjpeg/Result.withORAM."+ str(cacheSize)
    else:
        makeCJPEGProgramCMD = makeCJPEGProgramCMD + " PSR=ON"
        outputFile = "../../resultDir/cjpeg/Result.withORAM.RPS." + str(cacheSize)

    #2. make
    #print(makeCJPEGProgramCMD)
    #print("saving to:" + outputFile)
    output = subprocess.check_output(makeCJPEGProgramCMD, shell=True)
    #3. run program nbench
    tdir = "/home/root/klotski/ae_programs/klotski_benchmarks/imgs/"
    input_ppms = tdir + "inputDir/ppm/download"
    output_jpgs = tdir + "outputDir/jpg/download"
    #output = subprocess.check_output("rm /home/root/klotski/libjpeg/testCase/outputDir/jpg/*", shell=True)
    with open(outputFile, "w") as fp:
        cmd = "./app cjpeg " + input_ppms + " " + output_jpgs
        print("make clean")
    	print(makeCJPEGProgramCMD)
        print("exectuing: "+ cmd + ", saving to:" + outputFile)
        exec_program(cmd, fp)

def processingJpeg():
    cacheNumSet = [2,4,8,16,32]

    # if the program crashes, uncomment this and run the scripts again.
    #cacheNumSet = [2]
    print("processing cjpeg")

    randomPageSwap = False 
    for cacheNum in cacheNumSet:
        runCjpeg(randomPageSwap, cacheNum)

    randomPageSwap = True
    for cacheNum in cacheNumSet:
        runCjpeg(randomPageSwap, cacheNum)

def main():
    processingJpeg()
    print("CJPEG processing finished, record have been saved to ../../resultDir/cjpeg/ ")

if __name__=="__main__":
    main()
