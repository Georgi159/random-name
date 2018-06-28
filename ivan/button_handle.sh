#!/bin/bash

read_buttons () {
sed $1'!d'  $(cat location_of_buton) | sed 's/B[0-9]\s//'
}

pos=1
Str=$(wc -l menu.txt)
max=$(expr substr "${Str}" 1 1)
((max++))
echo $max

while [[ true ]]; do
	but1=$(read_buttons 1 "/tmp/button_values.io")
    if [[ $but1 -eq 1 ]]; then
    	sudo killall -9 play sox
    	rm -f menu.wav
    	rm -f menu_out.wav
		echo "killed" > /tmp/killed
    	# echo "Next"
    	((pos++))
    	if [[ $pos -gt $max ]]; then
    		((pos=max))
    	fi
    fi

    but2=$(read_buttons 2 "/tmp/button_values.io")
    if [[ $but2 -eq 1 ]]; then
    	killall -9 play sox
    	rm -f menu.wav
    	rm -f menu_out.wav
		echo "killed" > /tmp/killed
    	# echo "Back"
    	((pos=1))
    fi

    but3=$(read_buttons 3 "/tmp/button_values.io")
    if [[ $but3 -eq 1 ]]; then
    	killall -9 play sox
    	rm -f menu.wav
    	rm -f menu_out.wav
		echo "killed" > /tmp/killed
    	# echo "Prev"
    	((pos--))
    	if [[ $pos -lt 1 ]]; then
    		((pos=1))
    	fi
    fi

    but4=$(read_buttons 4 "/tmp/button_values.io")
    if [[ $but4 -eq 1 ]]; then
    	killall -9 play sox
    	rm -f menu.wav
    	rm -f menu_out.wav
		echo "killed" > /tmp/killed
    	# echo "Enter"
    	# ((pos=pos))
    	./vlado/select_feed.sh
    fi

    # echo $pos
    echo $pos > /tmp/menu_pos

    sleep 0.1
done




# while [[ true ]]; do
# 	#./sleep_until_modified.sh $(cat location_of_buton)

# 	inotifywait -q -m -e close /tmp/button_values.io | while  read path action ; do
# 	echo $action
# 		if [[ $action = "CLOSE_WRITE,CLOSE" ]]; then
# 			break;
# 		fi
	
# 	done

# 	if [[ $(read_butonts 1) = "1" ]]; then
       	
#        	#killall google_speech
# 		killall play sox
# 		echo "kiled" >> /tmp/killed
#     fi

# 	#clear    
# 	echo "buton read" >> logfile.log

# 	#cat  $(cat location_of_buton)
	

	
# done
