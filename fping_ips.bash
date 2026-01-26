#! /bin/bash
Base_IP="10.0.5"
IP_List=$(seq 2 50 | sed "s/^/$Base_IP./")
fping -a -q $IP_List 2>/dev/null > sweep2.txt
