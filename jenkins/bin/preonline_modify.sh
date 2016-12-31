#!/bin/bash
# modify configure for preonline platform
# script will be execute only when the JENKINS job's name is preonline.xxx.deploy

cd $(dirname $0)
export BIN_DIR=$(pwd)
cd $BIN_DIR
cd ..
DEPLOY_DIR=`pwd`
MODULE_NAME=$(echo $DEPLOY_DIR | awk -F'/' '{print $NF}')
CONF_DIR=$DEPLOY_DIR/conf

sed -i 's/java_max_heap_size=.*/java_max_heap_size=512M/g' $BIN_DIR/java_env.sh
sed -i 's/java_initail_heap_size=.*/java_initail_heap_size=512M/g' $BIN_DIR/java_env.sh

sed -i 's/value="hcthrift-crm"/value="preonline\/hcthrift-crm"/g' $CONF_DIR/spring-thrift.xml
