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


def runTLS(randomPageSwap, cacheSize):
    makeTLSProgramCMD = "make SGX_MODE=HW SGX_DEBUG=1 CACHENUM=" + str(cacheSize)
    if randomPageSwap==True:
        makeTLSProgramCMD = "make SGX_MODE=HW SGX_DEBUG=1 CACHENUM=" + str(cacheSize) + " PSR=ON"
    else:
        makeTLSProgramCMD = "make SGX_MODE=HW SGX_DEBUG=1 CACHENUM=" + str(cacheSize) + " PSR=OFF"

    makeTLSProgramCMD = makeTLSProgramCMD + " TARGET=HTTPS"

    #2. make
    print("------------set cache =" + str(cacheSize) + "--------------")
    print(" IN Terminator 1--------------")
    print("make clean")
    print(makeTLSProgramCMD)
    #3. run program nbench
    cmd = "./app https"
    print(cmd)
    print(" IN Terminator 2--------------")
    print("----open another terminal and type the cmd below:")
    print("$ ab -n1000 -f TLS1.1  https://127.0.0.1:4433/")
    print("")
    print("")

def processingTLS():
    cacheNumSet = [2,4,8,16,32]
    print("TLS can only be tested manually, plz follow the instructions blew")
    randomPageSwap = False 
    for cacheNum in cacheNumSet:
        runTLS(randomPageSwap, cacheNum)

    print("===================with random page swap==================================")
    randomPageSwap = True
    for cacheNum in cacheNumSet:
        runTLS(randomPageSwap, cacheNum)

def main():
    processingTLS()

if __name__=="__main__":
    main()
