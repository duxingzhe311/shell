#!/bin/sh
arr=(`cat "/Users/chenxubing/Downloads/tz.txt"`)

i=0
j=0
for s in "${arr[@]}"
do
	let i+=1
	let j+=1
	if [ 0 -eq $((i%7)) ]
	then
		let i=0
		echo $s
	elif [ 0 -eq $((j%8)) ]
	then
		let j=0
		echo $s
	fi
	#url=$s | cut -d ' ' -f6
	#echo $url
done