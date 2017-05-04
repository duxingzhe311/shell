#!/bin/sh
conn="/usr/local/mysql/bin/mysql -uroot -pcloud_angel"

sql="select id,create_time,phone,nick_name from hcc.system_user"

$conn -e "$sql"

$conn -e "quit"