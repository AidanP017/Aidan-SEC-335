#!/bin/bash

prefix="$1"
dns_server="$2"

echo "DNS Resolution for ${prefix}:"

for ip in {1..254};
do
	IP="${prefix}.${ip}"
	nslookup "${IP}" "${dns_server}" 2>/dev/null | grep "in-addr.arpa" | grep "name ="
done
