#!/bin/bash

ps -eo pid,cmd | grep qemu | grep -v grep > process
echo "time(s)"
echo "recvmsg"
echo "select"
echo "poll"
echo "ioctl"
echo "read"
echo "write"
echo "close"
echo "mmap"
for((i=5;i<=300;i+=5));do
	perf stat -e 'syscalls:sys_enter_*' -p `awk 'NR==1{print $1}' process` -o gsc.txt sleep 5
	echo $i
	awk 'NR==22{print $1}' gsc.txt
	awk 'NR==111{print $1}' gsc.txt
	awk 'NR==113{print $1}' gsc.txt
	awk 'NR==117{print $1}' gsc.txt
	awk 'NR==142{print $1}' gsc.txt
	awk 'NR==143{print $1}' gsc.txt
	awk 'NR==169{print $1}' gsc.txt
	awk 'NR==299{print $1}' gsc.txt
	sleep 0.001
done

 


