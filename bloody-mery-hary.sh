#!/bin/bash

# $1 argument je url pejdza
# $2 argument je identifikator oddaje

mkdir $2 && cd $2
touch out.txt linki.txt

# dobim ven linke od oddaj (sedaj bi moral ven izvleci linke mp3jev)
wget -w5 -k $1 -O out.txt
cat out.txt | tr "\t\r\n'" '   "' | \
    grep -i -o '<a[^>]\+href[ ]*=[ \t]*"\(ht\|f\)tps\?:[^"]\+"' | \
    sed -e 's/^.*"\([^"]\+\)".*$/\1/g' | uniq | sort | uniq | grep $2 > linki.txt

echo "Dobili smo naslednje url naslove"
cat linki.txt
rm out.txt
stlinkov=$(wc -l linki.txt)
st=1

while read link; do
	echo "ISCEMO MP3 $st od $stlinkov ::: $link"
	curl $link | \
	grep -i -o '<a[^>]\+href[ ]*=[ \t]*"\(ht\|f\)tps\?:[^"]\+*mp3"' | \
  sed -e 's/^.*"\([^"]\+\)".*$/\1/g' | uniq | sort | uniq | grep $2 >> linki-mp3.txt
	st =$(( $st + 1 ))
done < linki.txt

echo
echo "Dobili smo povezave do nasldenjih mp3jev"
cat linki-mp3.txt

while read link; do
	echo "ZARES LOADAMO $link"
	wget $link
done < linki-mp3.txt

rm linki.txt linki-mp3.txt

