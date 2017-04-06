#!/bin/sh

ARR=(
3000000000000505
3000000000000506
3000000000000507
3000000000000508
3000000000000509
3000000000000510
3000000000000613
3000000000000615
3000000000000636
3000000000000668
3000000000000680
3000000000000681
3000000000000682

3000000000003965  
3000000000003993
3000000000003995
3000000000003996
3000000000003998
3000000000003999
3000000000005001
3000000000005002
3000000000005003
3000000000005004
3000000000005005
3000000000005006
3000000000005007
3000000000005008
3000000000005033
3000000000005035
3000000000005066
3000000000005096
3000000000005098
)

function check(){
	n=$1
	for var in ${ARR[@]};do
		if [ $var -eq $n ];then
			return 1
		fi
	done
	return 0
}

function pri(){
	pre="300000000000"
	if [ $1 -le 1000 ];then
		pre="3000000000000"
	fi
	
	if [ 1 -eq $# ];then
		n=$1
		str=$pre$n
		check $str
		#if [ $? -eq 0 ];then
			echo "$str,"
		fi
	else
		n=$1
		while [ $n -le $2 ]
		do
			str=$pre$n
			check $str
			if [ $? -eq 0 ];then
				echo "$str,"
			fi
			let n=n+1
		done
	fi
}


pri 612 816
pri 335 399
pri 311 366
pri 505 509
pri 510

pri 5000 5008
pri 5033
pri 5035
pri 5066
pri 5096
pri 5098
pri 3999
pri 3998
pri 3996
pri 3995
pri 3993
pri 3965