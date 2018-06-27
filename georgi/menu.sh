#!/bin/bash

read_butonts () {
sed $1'!d'  $(cat location_of_buton) | sed 's/B[0-9]\s//'
}


pos=1
menu_entry=$(cat menu.txt)
for i in ${menu_entry[@]}; do
    echo $pos
    google_speech -l en $i
    sleep 0.2
    if [[ -f /tmp/killed ]]; then
    	echo "dsadsadasdsadsa"
       case $i in
       	RSS )
			./reproduse.sh

       		;;
       	RSS2 )
			
       		;;
       	RSS3 )
			
       		;;
       esac
    fi
    if [[ -f /tmp/killed ]]; then
    	rm /tmp/killed 
    fi

   

    ((pos++))
done


