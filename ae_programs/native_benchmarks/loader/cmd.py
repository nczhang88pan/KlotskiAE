#!/usr/bin/env python
# coding=utf-8
import os
import subprocess
import sys

def runDjpeg():
    #make
    #1. make clean
    print("make clean")
    output = subprocess.check_output("make clean", shell=True)
    outputFile = "../../resultDir/djpeg/Result.original"
    makeDJPEGProgramCMD = "make SGX_MODE=HW SGX_DEBUG=1 TARGET=DJPEG"

    #2. make
    print(makeDJPEGProgramCMD)
    print("saving to:" + outputFile)
    output = subprocess.check_output(makeDJPEGProgramCMD, shell=True)
    #3. run program nbench
    tdir = "/home/root/klotski/ae_programs/klotski_benchmarks/imgs/"
    input_jpegs = tdir + "inputDir/jpg/download"
    output_ppms = tdir + "outputDir/bmp/download"
    with open(outputFile, "w") as fp:
        cmd = "./app djpeg " + input_jpegs + " " + output_ppms
        print("exectuing: "+ cmd + ", saving to:" + outputFile)
    	output = subprocess.check_output(cmd, shell=True)
        fp.write(output)

def runCjpeg():
    #make
    #1. make clean
    print("make clean")
    output = subprocess.check_output("make clean", shell=True)

    outputFile = "../../resultDir/cjpeg/Result.original"
    makeCJPEGProgramCMD = "make SGX_MODE=HW SGX_DEBUG=1 TARGET=CJPEG"

    #2. make
    print(makeCJPEGProgramCMD)
    print("saving to:" + outputFile)
    output = subprocess.check_output(makeCJPEGProgramCMD, shell=True)
    #3. run program nbench
    tdir = "/home/root/klotski/ae_programs/klotski_benchmarks/imgs/"
    input_ppms = tdir + "inputDir/ppm/download"
    output_jpgs = tdir +  "outputDir/jpg/download"
    with open(outputFile, "w") as fp:
        cmd = "./app cjpeg " + input_ppms + " " + output_jpgs
        print("exectuing: "+ cmd + ", saving to:" + outputFile)
    	output = subprocess.check_output(cmd, shell=True)
        fp.write(output)

def processingJpeg():
    print("--------processing Djpeg: it may takes 5-10 mins--------")
    runDjpeg()
    print("--------processing Cjpeg: 5-10 mins--------")
    runCjpeg()

def runTLS():

    print("run the cmds below")

    #2. make
    print("step 1:  make clean")
    makeTLSProgramCMD = "make SGX_MODE=HW SGX_DEBUG=1 TARGET=HTTPS"
    print("step 2:  "+makeTLSProgramCMD)
    #3. run program nbench
    cmd = "step 3:  ./app https"
    print(cmd)
    print("step 4: open another terminal, and enter into the container and type:")
    print("step 4: ab -n50 -f TLS1.1  https://127.0.0.1:4433/")

def processingTLS():
    print("--------processing TLS: copy the commands and execute them in your terminal--------")
    runTLS()

def main():
    processingJpeg()
    processingTLS()

if __name__=="__main__":
    main()
