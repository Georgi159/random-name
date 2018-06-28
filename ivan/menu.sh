#!/bin/bash

menu_entry=$(cat menu.txt)
# for i in ${menu_entry[@]}; do
while [[ true ]]; do
    
    current_pos=$(cat /tmp/menu_pos)
    kill_check=$(cat /tmp/killed)
    if [[ "$kill_check" == "killed" ]]; then
    	echo "Killed"
    fi

 #    pico2wave -w menu.wav -l en-GB $i
	# sox menu.wav menu_out.wav pitch -20 gain -6.2 rate 48000 equalizer 60 0.9 -4.8 equalizer 310 0.9 +4 equalizer 600 0.9 +5.6 equalizer 1000 0.9 +5.6 equalizer 3000 0.9 +5.6 equalizer 6000 0.9 +4 equalizer 12000 0.9 +2.4 equalizer 14000 0.9 +2.4 equalizer 16000 0.9 +2.4 bass -2
	# play menu_out.wav

 #   ((pos++))
done 