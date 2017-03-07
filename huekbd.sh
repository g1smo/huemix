#!/bin/bash

instrumenti=("sine" "square" "triangle" "sawtooth" "trapezium" "exp" "noise" "tpdfnoise" "pinknoise" "brownnoise" "pluck")

trenutni_instrument=0

while [ true ]; do
  read -n 1 tipka
  echo "tipka: $tipka"

  # Naslednji instrument ?
  if [ $tipka = "1" ]; then
    trenutni_instrument=$(perl -e "$trenutni_instrument + 1 % ${#instrumenti[@]}")
  fi

  echo "instrument: $trenutni_instrument (${instrumenti[$trenutni_instrument]})"

  koda=$(perl -e "print ord(\"$tipka\") * 10")
  play -n synth 1 ${instrumenti[$trenutni_instrument]} $koda &
  echo "koda: $koda"
done
