#!/bin/bash

sh ./basic.sh > gbtsum.txt 
awk '{a[NR]=$0} END{for(i=1;i<NR+1;i++){printf(i%12?a[i]":  ":a[i]"\n") }}' gbtsum.txt > data/basic.txt
rm -rf gbt* data.txt

