#!/bin/bash

read_butonts () {
sed $1'!d'  $(cat location_of_buton) | sed 's/B[0-9]\s//'
}


pos=1
menu_entry=$(cat menu.txt)
for i in ${menu_entry[@]}; do
    echo $pos
    # google_speech -l en $i

    pico2wave -w menu.wav -l en-GB $i
	sox menu.wav menu_out.wav pitch -20 gain -6.2 rate 48000 equalizer 60 0.9 -4.8 equalizer 310 0.9 +4 equalizer 600 0.9 +5.6 equalizer 1000 0.9 +5.6 equalizer 3000 0.9 +5.6 equalizer 6000 0.9 +4 equalizer 12000 0.9 +2.4 equalizer 14000 0.9 +2.4 equalizer 16000 0.9 +2.4 bass -2
	echo $sdre
	play menu_out.wav

    sleep 0.3
   #  if [[ -f /tmp/killed ]]; then
   #  	echo "dsadsadasdsadsa"
   #     case $i in
   #     	RSS )
			# ./reproduse.sh

   #     		;;
   #     	RSS2 )
			
   #     		;;
   #     	RSS3 )
			
   #     		;;
   #     esac
   #  fi
   #  if [[ -f /tmp/killed ]]; then
   #  	rm /tmp/killed 
   #  fi

   while [[ condition ]]; do
   	#statements
   done

   

   ((pos++))
done


