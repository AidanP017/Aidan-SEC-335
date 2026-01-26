#! /bin/bash
Base_IP="10.0.5"
IP_Range="$Base_IP.2-50"
nmap -sn $IP_Range -oG - | awk '/Up$/{print $2}' > sweep3.txt
