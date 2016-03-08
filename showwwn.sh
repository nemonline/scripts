#!/bin/bash
online() {
hosts=`ls -w1 /sys/class/fc_host/`
for i in $hosts
        do
                wwn=`cat /sys/class/fc_host/$i/port_name`
                state=`cat /sys/class/fc_host/$i/port_state`
                        if [ "$state" = "Online" ]; then
                            echo "$i"
                            echo -e "wwn: $wwn"
                            echo Status: $state
                        fi

done
}
all() {
hosts=`ls -w1 /sys/class/fc_host/`
for i in $hosts
        do
                wwn=`cat /sys/class/fc_host/$i/port_name`
                state=`cat /sys/class/fc_host/$i/port_state`
                            echo "$i"
                            echo -e "wwn: $wwn"
                            echo Status: $state
                            echo

done
}
case $2 in
        a|all)
            typeset -f | ssh -Y2 -l root $1 "$(cat);all"
        ;;
        *)
            typeset -f | ssh -Y2 -l root $1 "$(cat);online"
            ;;
esac
