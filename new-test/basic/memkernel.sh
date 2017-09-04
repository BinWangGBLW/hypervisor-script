#!/bin/bash

ps -eo pid,cmd | grep qemu | grep -v grep > process
echo "time(s)"
echo "kmalloc"
echo "kmem_cache_alloc"
echo "kmalloc_node"
echo "kmem_cache_alloc_nodek"
echo "kfree"
echo "mm_page_free"
echo "mm_page_free_batched"
echo "mm_page_alloc"
echo "mm_page_alloc_zone_locked"
echo "mm_page_pcpu_drain"
echo "mm_page_alloc_extfrag"
for((i=5;i<=300;i+=5));do
	perf stat -e 'kmem:*' -p `awk 'NR==1{print $1}' process` -o gmem.txt sleep 5 
	echo $i
	awk 'NR>5 && NR<11{print $1}' gmem.txt
	awk 'NR>11 && NR<18{print $1}' gmem.txt
	sleep 0.001
done

 

 
