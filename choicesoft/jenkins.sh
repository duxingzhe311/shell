#!/bin/sh
BUILD_ID=dontKillMe
ps -ef |grep micro_xxx_web|grep -v grep|awk '{print$2}'|xargs kill -9 >/dev/null 2>1 
mkdir -p /opt/ipos_micro/
rm -f /opt/micro/micro_xxx_web.jar
mv /tmp/micro-xxxy-web-*.jar /opt/micro/micro_xxx_web.jar
chmod  755 /opt/micro/micro_xxx_web.jar
source /etc/profile

nohup nice java  -Xdebug -Xrunjdwp:transport=dt_socket,address=9527,server=y,suspend=n  -jar /opt/ipos_micro/micro_xxx_web.jar --spring.profiles.active=test > /tmp/nohup.log 2>&1 &

