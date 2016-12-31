#!/bin/bash

echo 'hello'
sed -i '' 's/\r//' "/Users/chenxubing/hc/build.sh"

:<<!
BASE_DIR="/Users/chenxubing/workspace/taozi/crm-server/src/main/bin"

for f in $(ls $BASE_DIR)
do
	shf="$BASE_DIR/$f"
	if [ -f $shf ]
	then
		#sed -i '' 's/\r//' $shf
		echo $shf
	fi
done
!

echo 'hello'
