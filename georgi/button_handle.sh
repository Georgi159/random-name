#!/bin/bash


read_butonts () {
sed $1'!d'  $(cat location_of_buton) | sed 's/B[0-9]\s//'
}

chmod 777 $(cat location_of_buton)

while [[ true ]]; do
	./sleep_until_modified.sh $(cat location_of_buton)
	echo "buton read" >> logfile.log

	if [[ $(read_butonts 1) = "1" ]]; then
       	
       	killall google_speech
		killall sox
		echo "kiled" >> /tmp/killed
    fi
    sleep 0.5

	
done
