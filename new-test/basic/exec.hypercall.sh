#!/bin/bash

sh ./hypercall.sh > ghsum.txt 
awk '{a[NR]=$0} END{for(i=1;i<NR+1;i++){printf(i%9?a[i]":  ":a[i]"\n") }}' ghsum.txt > ./data/hypercall.txt
rm -rf gh*

