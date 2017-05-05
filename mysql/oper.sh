#!bin/bash
#
#CREATE TABLE `test`.`test_user` (
#`id` INT NOT NULL AUTO_INCREMENT COMMENT 'id',
#`name` VARCHAR(45) NOT NULL COMMENT '姓名',
#`password` VARCHAR(45) NOT NULL COMMENT '密码',
#PRIMARY KEY (`id`));
#

#注意下面的账号密码
conn="/usr/local/mysql/bin/mysql -uroot -pcloud_angel"

echo "欢迎光临！"
function loop(){
	echo "请按照以下提示进行操作："
	echo "查询请输入'1'，插入请输入'2'，修改请输入'3'，删除请输入'4'，清空请输入'5'，退出请输入'0'"
	
	read -s op
	
	case $op in
	0)
	    exit 0;;
	1)
	    do_select
	    loop;;
	2)
	    do_insert
	    loop;;
	3)
	    do_update
	    loop;;
	4)
	    do_delete
	    loop;;
    5)
	    do_truncate
	    loop;;
	*)
	    echo "Usage: error"
	    exit 1
	    ;;
	esac
}

function do_select(){
	$conn -e "select id,name,password from test.test_user";
}

function do_insert(){
	echo "请输入用户名：" 
	read -s username
	echo "请输入密码："
	read -s  password
	
	sql="insert into test.test_user(name,password) values ('$username','$password')";
	$conn -e "$sql"
	echo "OK"
}

function do_update(){
	echo "请输入要修改的数据的id："
	read -s uid
	echo "请输入新用户名：" 
	read -s username
	echo "请输入新密码："
	read -s  password
	sql="update test.test_user set name = '$username',password = '$password' where id = $uid";
	$conn -e "$sql"
	echo "OK"
}

function do_delete(){
	echo "请输入要删除的数据的id："
	read -s uid
	sql="delete from test.test_user where id = $uid";
	$conn -e "$sql"
	echo "OK"
}

function do_truncate(){
	$conn -e "truncate table test.test_user"
	echo "OK"
}

loop
