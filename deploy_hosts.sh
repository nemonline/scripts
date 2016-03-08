#!/bin/bash
#adding one comment
if [ $# -eq 0 ];
 then
                echo "Script to distribute /etc/hosts"
        echo "Usage:"
        echo "$0 [server list file] [hosts template file]"
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
        echo "hosts template not found"
        exit 1
fi

for server in `cat $1`; do
        echo $1 | cat $2 | ssh -Y root@$server 'export DATE=`date +%Y-%m-%d`;rm -f /etc/hosts-20* ; cp /etc/hosts /etc/hosts-$DATE ; cat - > /etc/hosts'
                echo "Done server: $server"
done
