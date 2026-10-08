#!/bin/bash

Hostname=$(hostname)
Os=$(grep '^PRETTY_NAME=' /etc/os-release)
Kernal=$(uname -r)
CPU=$(nproc)
Date=$(date)
Memory=$(free -h)
Disk=$(df -h)
Uptime=$(uptime -p)
IP=$(hostname -I)


echo "====== SERVER INFORMATION ======"
echo "Hostname	: $Hostname"
echo "Os	: $Os"
echo "Kernal	: $Kernal"
echo "CPU Usage	: $CPU"
echo "Date	: $Date"
echo "Memory	: $Memory"
echo "Disk	: $Disk"
echo "Uptime	: $Uptime"
echo "IP Address: $IP"
echo "================================"
