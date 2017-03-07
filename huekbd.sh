#!/bin/bash

echo "Pritisni ? za navodila (kadarkoli)"

# Osnova za frekvenco
osnova=300

# Razlika (v Hz) med crkami
razlika=20

# Seznam uporabljenih instrumentov
instrumenti=("triangle" "pluck" "sine" "square" "sawtooth" "trapezium" "exp" "noise" "tpdfnoise" "pinknoise" "brownnoise")

# Zacni pri prvem instrumentu
trenutni_instrument=0

# In ga izpisi
echo "Trenutni instrument: $trenutni_instrument (${instrumenti[$trenutni_instrument]})"

# Ponavljaj skoz
while [ true ]; do
  # Preberi tipko
  read -s -n 1 tipka

  # Znak ? izpise navodila
  if [ $tipka = "?" ]; then
    echo "Pritiskaj na tipkovnico za igranje tonov"
    echo "Frekvence se vrstijo po abecednem redu"
    echo
    echo "Ukazi:"
    echo "\t1\tPrejsnji instrument"
    echo "\t2\tNaslednji instrument"
    continue
  fi

  if [ $tipka = "2" ]; then
    # Izberi naslednji instrument
    trenutni_instrument=$(( ($trenutni_instrument + 1) % ${#instrumenti[@]}))

    # In ga izpisi
    echo "Trenutni instrument: $trenutni_instrument (${instrumenti[$trenutni_instrument]})"
    continue
  fi

  if [ $tipka = "1" ]; then
    # Izberi prejsnji instrument
    trenutni_instrument=$(( (${#instrumenti[@]} + $trenutni_instrument - 1) % ${#instrumenti[@]}))

    # In ga izpisi
    echo "Trenutni instrument: $trenutni_instrument (${instrumenti[$trenutni_instrument]})"
    continue
  fi

  # Pretvori crko v ASCII kodo in pomnozi s 15 za visino frekvence
  koda=$(perl -e "print ord(\"$tipka\") - 97")

  # Izracunaj frekvenco
  frekvenca=$(( $osnova + $koda * $razlika ))

  # Zaigraj ton
  play -n synth 1 ${instrumenti[$trenutni_instrument]} $frekvenca  &>/dev/null &

  # Izpisi frekvenco
  #echo "frekvenca: $koda"
done
