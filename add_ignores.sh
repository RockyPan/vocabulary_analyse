#! /bin/bash
# usage: add_ignores [word ...]
# 将参数中的所有单词依次加入忽略单词库，并进行去重和排序

for word in "$@" 	#遍历单词参数列表
do
    echo "$word" >> ignores.txt
done

cp ignores.txt ignores.txt.bak
sort ignores.txt.bak | uniq > ignores.txt
rm ignores.txt.bak
