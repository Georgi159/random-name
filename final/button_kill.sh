#!/bin/bash

read_buttons () {
sed $1'!d'  $(cat location_of_buton) | sed 's/B[0-9]\s//'
}

while [[ true ]]; do

    but1=$(read_buttons 1 "/tmp/button_values.io")

    but2=$(read_buttons 2 "/tmp/button_values.io")
    if [[ $but2 -eq 1 ]]; then
    	killall -9 play
    	tmux kill-session -t name
        echo daadasdasd
    fi

    but3=$(read_buttons 3 "/tmp/button_values.io")

    but4=$(read_buttons 4 "/tmp/button_values.io")
    if [[ $but4 -eq 1 ]]; then
    	killall -9 play
    fi

    sleep 0.1
done
