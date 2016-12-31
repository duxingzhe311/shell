#!/bin/bash
cd $(dirname $0)
export BIN_DIR=$(pwd)
cd $BIN_DIR
cd ..
DEPLOY_DIR=`pwd`
MODULE_NAME=$(echo $DEPLOY_DIR | awk -F'/' '{print $NF}')

if [ ${MODULE_NAME}x = erp-webx ]; then
	sed -i 's@thrift\.om\.server\.nodename=hcthrift-om@&\-stage@g' /home/work/erp-web/WEB-INF/classes/thrift-client-om.properties
	sed -i 's@thrift\.crm\.server\.nodename=hcthrift-crm@&\-stage@g' /home/work/erp-web/WEB-INF/classes/thrift-client-crm.properties
elif [ ${MODULE_NAME}x = om-serverx ]; then
	sed -i 's@thrift\.server\.nodename=hcthrift-om@&\-stage@g' /home/work/om-server/conf/thrift.properties
elif [ ${MODULE_NAME}x = crm-serverx ]; then	
	sed -i 's@\<property\ name="nodename"\ value="hcthrift-crm@&\-stage@g' /home/work/crm-server/conf/spring-thrift.xml
elif [ ${MODULE_NAME}x = erp-ifacex ]; then
	sed -i 's@thrift\.om\.server\.nodename=hcthrift-om@&\-stage@g' /home/work/erp-iface/WEB-INF/classes/thrift-client-om.properties
        sed -i 's@thrift\.crm\.server\.nodename=hcthrift-crm@&\-stage@g' /home/work/erp-iface/WEB-INF/classes/thrift-client-crm.properties
else 
	echo "error"
	exit 2
fi


