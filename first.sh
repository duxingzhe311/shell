#!/bin/sh

BUILD_DIR=`pwd`
echo $BUILD_DIR

result=$((2 - 100))
echo $result

result=$((2 * 100))
echo $result

result=$((2 ** 5))
echo $result

for x in $(ls $BUILD_DIR)
do
	if [ -f $x ]
	then
		echo `wc -l "$BUILD_DIR/$x"`
		echo "is file : " $x
	elif [ -x $x ]
	then
		echo "can exe : " $x
	elif [ -l $f ]
	then
		echo "is link : " $x
	fi
done



INT_N=5
while [ $INT_N -gt 0 ]
do
	echo $INT_N
	let INT_N-=1
done


INT_M=0
until [ $INT_M -gt 5 ]
do
	echo $INT_M
	let INT_M+=1
done



INT_I=3
case $INT_I in
	1)
	echo 'hello 1'
	;;
	2)
	echo 'hello 2'
	;;
	3)
	echo 'hello 3'
	;;
	*)
	echo 'hello *'
	;;
esac


