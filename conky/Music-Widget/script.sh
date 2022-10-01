#! /bin/bash

command="playerctl status"

exit_code=$?

$command > /dev/null 2>&1

exit_code=$?
#echo $exit_code
check(){
    if [ "$exit_code" -eq 0 ]
    then
        echo 0
    else
        echo 1
    fi
}
check
