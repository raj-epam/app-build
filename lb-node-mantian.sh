#!/bin/sh
# https://my.f5.com/manage/s/article/K13310 for refernece turning node offline and online

if [ $2 == "disable" ]
then

    tmsh
    modify /ltm node $3 session user-disabled
    echo "$3 node has been disabled"
    save /sys config
elif [ $2 == "enable" ]
then
    tmsh
    modify /ltm node $3 session user-disabled
    echo "$3 node has been enabled"
    save /sys config
fi

