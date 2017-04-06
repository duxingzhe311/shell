STR='hello.world.nihao.shijie'

echo $STR | cut -d '.' -f1
echo $STR | cut -d '.' -f2
echo $STR | cut -d '.' -f3
echo $STR | cut -d '.' -f4


echo $STR | cut -c 1-4
echo $STR | cut -c 5-8
echo $STR | cut -c 5-8,10,11



STR2=http://www.aaa.com/123.htm.
echo ${STR2#*//}
echo ${STR2##*/}
echo ${STR2%/*}
echo ${STR2%%/*}
echo ${STR2:0:5}
echo ${STR2:7}
echo ${STR2:0-7:3}
echo ${STR2:0-7}
