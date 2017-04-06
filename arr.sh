#!/bin/sh

ARR=(1 5 3 4 2 6 7 10 9 8)
echo $ARR
echo ${ARR[3]}
echo ${ARR[@]}
echo ${ARR[*]}
echo $(for v in "${ARR[@]}";do echo "$v"; done| sort)
echo $(for v in "${ARR[@]}";do echo "$v"; done| sort -n)
echo $(for v in "${ARR[@]}";do echo "$v"; done| sort -n -r)
	
	
filename=(`ls`)
for var in ${filename[@]};do
	echo $var
done

for v in ${filename[*]};do
	echo $v
done

testArr0=(a b c)
echo "testArr0:${testArr0[@]}"
testArr0[0]=d
echo "testArr0:${testArr0[@]}"

testArr=([a]=0 [b]=2 [c]=3)
echo "testArr:${testArr[@]}"

len=${#testArr[@]}
echo "testArr length : "$len