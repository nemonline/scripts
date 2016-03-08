#!/bin/bash
date=`date`
load=`cat /proc/loadavg | awk '{print $1}'`
root_usage=`df -h / | awk '/\// {print $(NF-1)}'`
memory_usage=`free -m | awk '/Mem/ { printf("%3.1f%%", $3/$2*100) }'`
swap_usage=`free -m | awk '/Swap/ { printf("%3.1f%%", $3/$2*100) }'`
users=`users | wc -w`

echo "System information as of: $date"
echo
printf "System load:\t%s\tMemory usage:\t%s\n" $load $memory_usage
printf "Usage on /:\t%s\tSwap usage:\t%s\n" $root_usage $swap_usage
printf "Local users:\t%s\n" $users
echo
