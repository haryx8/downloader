#!/bin/bash

banner () {
    eval "printf '%0.s~' {1..$2}"
    echo
    echo $1
    eval "printf '%0.s~' {1..$2}"
    echo
}

if [ -z $1 ];then
    echo "Please set url"
    exit 1
fi

if [ -z $2 ];then
    echo "Please set min value"
    exit 2
fi

if [ -z $3 ];then
    echo "Please set max value"
    exit 3
fi

banner "Start Download" 14

x=0

for (( c=$2; c<=$3; c++ ))
do
    url=${1/XX/$c}
    res=$(curl --write-out %{http_code} --silent --output /dev/null $url)
    if [ $res -eq 200 ];then
        ((x=x+1))
        echo "$x. Download file from $url"
        #wget "${1/XX/$c}"
    fi
done

banner "Total $x file downloaded" 24
