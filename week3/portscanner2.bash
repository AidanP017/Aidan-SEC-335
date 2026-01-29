#!/bin/bash

prefix="$1"
port="$2"

echo "ip, port"
for host in $(seq 1 254);
do
        IP="${prefix}.${host}"
        timeout .1 bash -c "echo >/dev/tcp/$IP/$port" 2>/dev/null && echo "${IP}, ${port}"
done
