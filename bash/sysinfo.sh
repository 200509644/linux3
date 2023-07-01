#!/bin/bash

fqdn=$(hostname --fqdn)
os_info=$(hostnamectl | awk '/Operating System/ {print $3,$4,$5,$6,$7,$8,$9}')
ip_addresses=$(hostname -I)
root_space=$(df -h --output=avail /| grep " ")

# Print the information
echo "FQDN: $fqdn"
echo "OS: $os_info"
echo "IP Addresses: $ip_addresses"
echo "Avail Space in Root FS: $root_space"
