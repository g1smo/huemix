#!/bin/bash

echo "predvajam"

while [ true ]; do
  fajl=$(shuf -n1 -e sempl*.wav)

  echo "Predvajam $fajl"
  play $fajl > /dev/null

  #let "spanje = $RANDOM % 3"
  #sleep $spanje
done
