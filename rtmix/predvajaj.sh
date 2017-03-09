#!/bin/bash

echo "predvajam"

while [ true ]; do
  fajl=$(shuf -n1 -e sempl*.wav)

  echo "Predvajam $fajl"
  play $fajl &>2 &

  let "spanje = $RANDOM % 3"
  sleep $spanje
done
