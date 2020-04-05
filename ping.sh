#!/bin/bash
getIp=$(ifconfig | grep "192" | sed -e 's/^[[:space:]]*//'| cut -d " " -f 2 |  awk -F'/' '{print $1}')
packetLoss=$(ping $getIp -c 1 | grep "packet"| cut -d "," -f 3|  awk -F 'packet' '{print $1}')
time=$(ping $getIp -c 1 | grep "time"| cut -d " " -f 7| tr -d [:alpha:])
echo "your local ip: "$getIp
echo "Packet loss:"$packetLoss
echo "time= "$time
if [ packetLoss==100% ]
then
echo "your ip is down"
else echo "your ip is up"
fi
