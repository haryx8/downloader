#!/bin/bash

banner () {
    eval "printf '%0.s~' {1..$2}"
    echo
    echo $1
    eval "printf '%0.s~' {1..$2}"
    echo
}

test () {
    if [ $1 == "empty" ];then
        echo $2
        exit 0
    fi
}

test ${1:-empty} "Please set url"
test ${2:-empty} "Please set min value"
test ${3:-empty} "Please set max value"

banner "Start Download" 14

x=0

for (( c=$2; c<=$3; c++ ))
do
    url=${1/XX/$c}
    res=$(curl --write-out %{http_code} --silent --output /dev/null $url)
    if [ $res -eq 200 ];then
        ((x=x+1))
        echo "$x. Download file from $url"
        wget "${1/XX/$c}"
    fi
done

banner "Total $x file downloaded" 24
