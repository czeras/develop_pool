#!/bin/sh
# https://tinypng.com/  单个api压缩数量有限制，可以自己申请账号

chmod +x ./tinify.sh

# api
api=Vd6pdZ7Llk6XbcLp6bghFJx1wzGptFN0
# 待压缩path
dir=images

path=$(pwd)

for file in `find $dir|egrep '\.(jpg|png|PNG|JPG|jpeg|JPEG)'`
do
    echo 上传：$file
    output=$(curl https://api.tinify.com/shrink --user api:$api --data-binary @$file --dump-header /dev/stdout | sed 's/"//g')
    url=$(echo $output | sed 's/.*url:\(.*\)}}.*/\1/g')
    echo 下载: $url $file
    curl $url \
        --user api:$api \
        --output $file
done
echo 结束
