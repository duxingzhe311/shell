#!/bin/sh
conn="/usr/local/mysql/bin/mysql -uroot -pcloud_angel"

sql="select id,create_time,phone,nick_name from hcc.system_user"

#$conn -e "$sql" > "a.txt"

awk '{print $1}' a.txt
awk '{print $1,$2}' a.txt
awk '{print $1 $2}' a.txt
awk 'END{print NR}' a.txt
awk 'NR==1{print}' a.txt

#sed -n "2, 1p" a.txt | awk 'print $1'

#1、打印文件的第一列(域)			：	awk '{print $1}' filename
#2、打印文件的前两列(域)			：	awk '{print $1,$2}' filename
#3、打印完第一列，然后打印第二列	：	awk '{print $1 $2}' filename
#4、打印文本文件的总行数			：	awk 'END{print NR}' filename
#5、打印文本第一行				：	awk 'NR==1{print}' filename
#6、打印文本第二行第一列			：	sed -n "2, 1p" filename | awk 'print $1'


