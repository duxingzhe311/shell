#!/bin/sh

key=(`sort -u -k7,7 "/Users/chenxubing/Downloads/tz.txt" | cut -d ' ' -f7`)

echo "=================================="
for s in "${key[@]}"
do
	echo $s
done
echo "=================================="


arr=(`cut -d ' ' -f7,15 "/Users/chenxubing/Downloads/tz.txt"`)
len=${#arr[@]}
echo "arr length : "$len
i=0

while [ $i -lt $len ]
do
echo "${arr[$i]} : \c"
	let i+=1
echo ${arr[$i]}
	let i+=1
done