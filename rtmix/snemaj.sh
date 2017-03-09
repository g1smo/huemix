#!/bin/bash

echo "snemam"

num=0
while [ true ]; do
  rec sempl$num.wav &>2 &
  pid=$!
  dolzina=$(( $RANDOM % 4 + 1))
  echo "sempl $num: dolzina: $dolzina sekund"
  sleep $dolzina
  kill $pid
  num=$((num+1))
done
