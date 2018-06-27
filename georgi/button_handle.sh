#!/bin/bash


read_butonts () {
sed $1'!d'  $(cat location_of_buton) | sed 's/B[0-9]\s//'
}

./button.out &

chmod 777 $(cat location_of_buton)




while [[ true ]]; do
	#./sleep_until_modified.sh $(cat location_of_buton)

	inotifywait -q -m -e close /tmp/button_values.io | while  read path action ; do
		if [[ $action = "CLOSE_WRITE,CLOSE" ]]; then
			break;
		fi
		#echo $action
	done

	if [[ $(read_butonts 1) = "1" ]]; then
       	
       	killall google_speech
		killall sox
		echo "kiled" >> /tmp/killed
    fi

	clear    
	echo "buton read" >> logfile.log

	cat  $(cat location_of_buton)
	

	
done
