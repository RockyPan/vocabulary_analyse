#! /bin/bash
# usage: word_list <article_file> [word_list_file]
# 将artile_file中的所有英文单词抽出，统计出现次数，过滤掉已熟悉的单词后，输出一个按出现次数排序的列表

if [ -z "$1" ]; then
    echo "usage: word_list <article_file> [word_list_file]"
    exit 
fi

if [ -z "$2" ]; then
    output_file="$1"".wlist"
else
    output_file="$2"
fi

cat $1 |
tr -cs A-Za-z '\n' |	
tr A-Z a-z |		
sort |			
uniq -c |		
awk '
    BEGIN {
        while ("cat ignores.txt" | getline w) { ignores[w]=none;}
    }

    {	
        if (!($2 in ignores)) print
    }'|
sort -k1,1nr -k2 > $output_file  
