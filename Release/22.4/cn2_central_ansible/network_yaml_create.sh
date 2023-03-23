#!/bin/bash
#Script to generate network.yaml file for the nodes being configured.
node_list=( centraljumphost centralctrl centralworker1 centralworker2 )

node_gw=$(/sbin/ip route | awk '/default/ { print $3 }')
env_dns=66.129.233.81
for node in ${node_list[@]}; do
node_ip=$( host $node | awk '/has address/ { print $4 }')
cat > $(pwd)/$node.yaml <<FILE
 network:
  ethernets: 
    enp1s0:
      dhcp4: no
      dhcp6: no
      addresses: [$node_ip/26]
      gateway4:  $node_gw
      nameservers: 
        addresses: [$env_dns]
  version: 2
FILE
done
