#!/bin/bash
# delete expired logs
cd $(dirname $0)
export BIN_DIR=$(pwd)
cd $BIN_DIR
cd ..
DEPLOY_DIR=`pwd`
MODULE_NAME=$(echo $DEPLOY_DIR | awk -F'/' '{print $NF}')
LOG_DIR=$DEPLOY_DIR/logs

EXPIRED_TIME=10
if [ -d ${LOG_DIR} ]; then
    cd ${LOG_DIR}
    rm -rf *$(date -d "$EXPIRED_TIME days ago" +%Y.%m.%d)*
    rm -rf *$(date -d "$EXPIRED_TIME days ago" +%Y-%m-%d)*
    rm -rf *$(date -d "$EXPIRED_TIME days ago" +%Y_%m_%d)*
    rm -rf *$(date -d "$EXPIRED_TIME days ago" +%Y%m%d)*

    if [ -f catalina.out ]; then
        > catalina.out
    fi
    if [ -f chicootec.out ]; then
        > chicootec.out
    fi
fi
