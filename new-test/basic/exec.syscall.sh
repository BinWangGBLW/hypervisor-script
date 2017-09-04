#!/bin/bash

sh ./syscall.sh > gscsum.txt 
awk '{a[NR]=$0} END{for(i=1;i<NR+1;i++){printf(i%9?a[i]":  ":a[i]"\n") }}' gscsum.txt > data/syscall.txt
rm -rf gsc*

