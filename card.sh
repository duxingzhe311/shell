#!/bin/sh

n=500
#echo "update member_card set restaurant_id = 11 where org_node_pid=15 and card_num in ("
echo "select * from member_card where org_node_pid=15 and card_num in ("
while [ $n -le 611 ]
do
	echo "3000000000000$n,"
	let n=n+1
done
echo ");"