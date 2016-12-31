#!/bin/bash

BASE_PATH="/home/work/om-server/lib"
#BASE_PATH="/Users/chenxubing/hc"

SB=""
for i in $(ls $BASE_PATH)
do
	SB=$SB"./om-server/lib/$i:"
done

if [ "javac" = "$1" ]
	then
	echo "start compile..."
	~/jdk-1.8/bin/javac -cp $SB./om-server-2.0.3-SNAPSHOT.jar:. Reg.java
	echo "end compile..."
fi

echo "start run..."
~/jdk-1.8/bin/java -cp $SB./om-server-2.0.3-SNAPSHOT.jar:. Reg
echo "end run..."
