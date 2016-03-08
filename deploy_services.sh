#!/bin/bash
if [ $# -eq 0 ];
 then
                echo "Script to distribute /etc/services"
        echo "Usage:"
        echo "$0 [server list file] [services template file]"
        exit 1
fi

if [ -z $1 ];
 then
        echo "Server list not specified"
        exit 1
fi

if [ -z $2 ];
 then
        echo "hosts template not specified"
        exit 1
fi

# Test files

if [ ! -f $1 ];
 then
        echo "Server list not found"
        exit 1
fi

if [ ! -f $2 ];
 then
        echo "services template not found"
        exit 1
fi

for server in `cat $1`; do
        echo $1 | cat $2 | ssh -Y root@$server 'export DATE=`date +%Y-%m-%d`;rm -f /etc/services-20* ; cp /etc/services /etc/hosts-$DATE ; cat - > /etc/services'
                echo "Done server: $server"
done
