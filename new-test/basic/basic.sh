#!/bin/bash

ps -eo pid,cmd | grep qemu | grep -v grep > process
echo "time(s)"
echo "CPU cycles"
echo "instructions (per cycle)"
echo "cache-misses (M/sec)"
echo "branch-misses (M/sec)"
echo "page-faults"
echo "L1-dcache-load-misses"
echo "L1-dcache-load (M/sec)"
echo "dTLB-load-misses"
echo "context-switches"
echo "CPU utilization (%)"
echo "Task-clock"
for((i=5;i<=300;i+=5));do
	perf stat -e cycles,instructions,cache-misses,branch-misses,page-faults,L1-dcache-load-misses,L1-dcache-load,dTLB-load-misses,context-switches,task-clock -p `awk 'NR==1{print $1}' process` -o gbt.txt sleep 5
	echo $i
	awk 'NR==6{print $1}' gbt.txt
	awk 'NR==7{print $4}' gbt.txt
	awk 'NR==8{print $4}' gbt.txt
	awk 'NR==9{print $4}' gbt.txt
	awk 'NR==10{print $1}' gbt.txt
	awk 'NR==11{print $4}' gbt.txt
	awk 'NR==12{print $4}' gbt.txt
	awk 'NR==13{print $1}' gbt.txt
	awk 'NR==14{print $1}' gbt.txt
	awk 'NR==15{print $5}' gbt.txt
	awk 'NR==15{print $1}' gbt.txt
	sleep 0.001
done

 


