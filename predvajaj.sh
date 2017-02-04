#!/bin/bash

echo "predvajaj"

while [ true ]; do
  fajl=$(shuf -n1 -e sempl*.wav)
  aplay $fajl &

  let "spanje = $RANDOM % 3"
  sleep $spanje
done
