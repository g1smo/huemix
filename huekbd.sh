#!/bin/bash

while [ true ]; do
  read -n 1 tipka
  echo "tipka: $tipka"
  koda=$(perl -e "print ord(\"$tipka\") * 10")
  play -n synth 4 pluck $koda &
  echo "koda: $koda"
done
