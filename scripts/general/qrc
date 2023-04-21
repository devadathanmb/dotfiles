#! /usr/bin/env bash

function qrc(){
  if [[ $# -eq 1 ]]
  then
    qrencode -t ansiutf8 $1
  else
    qrencode -t ansiutf8 $(wl-paste)
  fi
}

qrc
