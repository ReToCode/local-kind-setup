#!/usr/bin/env bash

KIND_IF=$(ip -o link show | awk -F': ' '{print $2}' | grep "br-")
#DST_NET=172.18.0.0/16
#HOST_IF=col0
#SRC_IP=192.168.106.1 # ip of bridge100 in MacOS
sudo iptables -t filter -A FORWARD -4 -p tcp -s 192.168.106.1 -d 172.18.0.0/16 -j ACCEPT -i col0 -o ${KIND_IF}
sudo iptables -L

