#!/bin/bash
trash_dir="/home/zhangmenghan/.Trash"
rm_files=`echo "$*" | tr ' ' '\n' | grep -v "^-" | tr '\n' ' '`
if [ x"$rm_files" = x ];then
    echo "arg error!"
    exit 1
fi
date=`date +"%y-%m-%d_%H:%M:%S:%N"`
mkdir -p $trash_dir/$date
for file in $rm_files
do
    file_name=${file##*/}
    mv -f $file $trash_dir/$date/$file_name.`date +%N`
done
