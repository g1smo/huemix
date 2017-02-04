#!/bin/bash

echo "snemam"

num=0
while [ true ]; do
  arecord sempl$num.wav &
  pid=$!
  let "dolzina = $RANDOM % 4 + 1"
  echo "dolzina: $dolzina sekund"
  sleep $dolzina
  kill $pid
  num=$((num+1))
done
