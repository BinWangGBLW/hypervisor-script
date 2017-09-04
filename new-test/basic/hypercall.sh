#!/bin/bash


ps -eo pid,cmd | grep qemu | grep -v grep > process
echo "time(s)"
echo "entry"
echo "apic"
echo "exit"
echo "page_fault"
echo "mmio"
echo "userspace_exit"
echo "pio"
echo "fpu"
for((i=5;i<=60;i+=5));do
	perf stat -e 'kvm:*' -p `awk 'NR==1{print $1}' process` -o gh.txt sleep 5 
	echo $i
	awk 'NR==6{print $1}' gh.txt
	awk 'NR==11{print $1}' gh.txt
	awk 'NR==12{print $1}' gh.txt
	awk 'NR==15{print $1}' gh.txt
	awk 'NR==47{print $1}' gh.txt
	awk 'NR==40{print $1}' gh.txt
	awk 'NR==9{print $1}' gh.txt
	awk 'NR==48{print $1}' gh.txt
	sleep 0.001
done

 


