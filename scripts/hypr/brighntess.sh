#! /usr/bin/env bash

# Script to control brightness using light utility

increase_brighntess(){

    echo $1
       light -A $1
       notify-send -t 500 "🌞 Increasing brightness to $(light -G)"
}

decrease_brighntess(){
    light -U $1 
    notify-send -t 500 "🌞 Decreasing brightness to $(light -G)"
}

while getopts i:d: flag
do
    case "${flag}" in
        i) value=${OPTARG}; increase_brighntess "$value";;
        d) value=${OPTARG}; decrease_brighntess "$value";;
    esac
done
