#!/bin/bash

read_butonts () {
sed $1'!d'  butonts | sed 's/LED[0-9]\s//'
}


pos=1
for i in $(cat menu.txt); do
    echo $pos
    google_speech -l en $i
    
    if [[ $(read_butonts $pos) = "2" ]]; then
        echo "you win"
    fi

    ((pos++))
done

