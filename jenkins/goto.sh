#!/bin/bash

function print_usage() {
    echo "Usage: $0 [index.]platform.module 
default index=0 
e.g. $0 online.irs-web "
    exit
}

function get_index() {
    local input=$1
    local index=

    index=$(echo "$input" | awk -F'.' '{print $1}')
    # if $index isn't a number; then index=0; fi
    echo $index | grep -P "[^0-9]" &> /dev/null
    if [ $? -eq 0 ]; then
        index=0
    fi

    echo $index
}

function get_service() {
    local input=$1
    local index=
    local service=

    index=$(echo "$input" | awk -F'.' '{print $1}')
    # if $index isn't a number; then index=0; fi
    echo $index | grep -P "[^0-9]"  &> /dev/null
    if [ $? -eq 0 ]; then
        service=$input
    else
        service=$(echo $input | awk -F'.' '{print $2"."$3}')
    fi

    # service is empty; input error
    if [ ${service}x = x ]; then
        echo "service is null"
        exit 1
    fi
    echo $service
}

function get_server() {
    local server_list=$1
    local index=$2
    local service=$3

    ((real_index = index + 1))
    local line=$(grep -A $real_index "\[$service\]" $server_list | grep -vP "[a-zA-z]")
    local ip=$(echo $line | xargs | awk "{print \$$real_index}" 2>/dev/null)
    checkIPAddr $ip
    if [ $? -ne 1 ]; then
        echo $ip
    else
        echo "no such instance: " $index.$service
        exit 1
    fi
}

function checkIPAddr()
{
    echo $1|grep "^[0-9]\{1,3\}\.\([0-9]\{1,3\}\.\)\{2\}[0-9]\{1,3\}$" > /dev/null;
    if [ $? -ne 0 ]; then
       return 1
    fi
    ipaddr=$1
    a=`echo $ipaddr|awk -F . '{print $1}'`
    b=`echo $ipaddr|awk -F . '{print $2}'`
    c=`echo $ipaddr|awk -F . '{print $3}'`
    d=`echo $ipaddr|awk -F . '{print $4}'`
    for num in $a $b $c $d
    do
        if [ $num -gt 255 ] || [ $num -lt 0 ]
        then
            return 1
        fi
    done
    return 0
}


if [ $# -lt 1 ]; then
    print_usage
fi

SERVER_LIST="/home/rd/hosts"
SERVER_TYPE="ecs"
IDC="bj"
USER="rd"

checkIPAddr $1
if [ $? -ne 1 ];then
    /usr/bin/sshpass -p "TJb6ZdGERP1MzNUijfjfvaewKs4bkEmi" ssh $USER@$1 -o StrictHostKeyChecking=no
else
    echo "-----------------"
    index=$(get_index $1)
    service=$(get_service $1)
    if [ $(echo $1 | awk -F'.' '{print $NF}') = qd ] ;then
          echo $1  | awk -F'.' '{print $1}'| grep -P "[^0-9]"  &> /dev/null
          if [ $? -eq 0 ]; then
              service=$service
          else
              service=$service".ecs.qd"
          fi
          server=$(get_server $SERVER_LIST $index $service)
    else
    service=$service".$SERVER_TYPE.$IDC"
    server=$(get_server $SERVER_LIST $index $service)
    fi
#    server=$(get_server $SERVER_LIST $index $service)

    echo $server
    echo $server | grep "no" &> /dev/null
    if [ $? -ne 0 ]; then
        /usr/bin/sshpass -p "TJb6ZdGERP1MzNUijfjfvaewKs4bkEmi" ssh $USER@$server -o StrictHostKeyChecking=no
    fi
fi
