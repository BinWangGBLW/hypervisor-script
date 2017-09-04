#!/bin/bash

echo "Begin Testing"
echo "Please Wait ......"
./exec.hypercall.sh &
./exec.basic.sh &
./exec.syscall.sh &
./exec.memkernel.sh &
wait
echo "Finish Testing"

