#!/bin/bash
if [ $# -ne 2 ];then
    echo "usage:$0 trash_dir max_size[M]"
    exit 1
fi
trash_dir=$1
max_size_M=$2
cur_size=`du -sh -B 1M  $trash_dir | awk '{print $1}'`
while [ $cur_size -gt $max_size_M ]
do
    oldest_file=`ls -tr $trash_dir | head -1`
    if [ x$oldest_file = x ];then
        break
    fi
    if [ -f $trash_dir/$oldest_file ] || [ -d $trash_dir/$oldest_file ];then
        rm -rf $trash_dir/$oldest_file
        echo "rm -rf $trash_dir/$oldest_file"
    fi
    cur_size=`du -sh -B 1M  $trash_dir | awk '{print $1}'`
done
