#!/bin/bash

sh ./memkernel.sh > gmemsum.txt 
awk '{a[NR]=$0} END{for(i=1;i<NR+1;i++){printf(i%12?a[i]":  ":a[i]"\n") }}' gmemsum.txt > ./data/memkernel.txt
rm -rf gmem*

