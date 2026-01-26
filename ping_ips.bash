#! /bin/bash
for ip in $(seq 2 50);
do
	ping -c 1 10.0.5.$ip | grep "bytes from" | cut -d " " -f 4 | cut -d ":" -f 1 &
done > sweep.txt
