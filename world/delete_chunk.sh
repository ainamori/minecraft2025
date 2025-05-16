#!/bin/bash
set -e

# 削除対象のフォルダ
folders=("region" "entities" "poi")

# 除外するファイルを含むファイル
excluded_file_list="remain.txt"

# フォルダごとに処理
for folder in "${folders[@]}"; do
    echo "Processing folder: $folder"
    mkdir ${folder}.tmp
    # フォルダ内のファイルを削除
    for file in `cat ${excluded_file_list}`; do
        mv -v ${folder}/$file ${folder}.tmp/$file
    done
    rm -v $folder/*
    mv -v ${folder}.tmp/* $folder/
    rmdir ${folder}.tmp

done

for folder in "${folders[@]}"; do
  echo "Display diff"
  diff <(ls -1 ${folder}/) ${excluded_file_list}
done
echo "Deletion process complete."

