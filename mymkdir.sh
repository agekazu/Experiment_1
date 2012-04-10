#!/bin/sh

#引数チェック
if [ $# -eq 3 ] ; then
	path=$1
	common_name=$2
	declare -i num  
	num=$3
	i=1
else
	echo "Usage: prompt> $0 ディレクトリパス ディレクトリの共通名 ディレクトリの個数 " 
	exit
fi

#指定されたディレクトリがあるか確認する
`cd ${path}` ||{ echo "該当するディレクトリはありません。新規作成します" 
`mkdir ${path}`;}

# #i <= #numの間繰り返す
while [ $i -le $num ]
do
	dir_name=${common_name}_${i}
	`cd ${path} && mkdir $dir_name`
	i=`expr $i + 1` #iをインクリメント
done	
echo "${path}に共通名${common_name}で${num}個のディレクトリを作成しました。"
exit

