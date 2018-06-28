#!/bin/bash

find . -name 'feed*' -delete ;

read_buttons () {
sed $1'!d'  $(cat location_of_buton) | sed 's/B[0-9]\s//'
}

wait_for_button()
{
	but_pressed=0
	while [[ $but_pressed -eq 0 ]];
	do
		but1=$(read_buttons 1 "/tmp/button_values.io")
		if [[ $but1 -eq 1 ]]; then
			killall play
			echo "killed" > /tmp/killed
			echo "Next"
			((pos++))
			let but_pressed=1
		fi

		but2=$(read_buttons 2 "/tmp/button_values.io")
		if [[ $but2 -eq 1 ]]; then
			killall play
			echo "killed" > /tmp/killed
			echo "Back"
			((pos=0))
			let but_pressed=1
			exit 0
		fi

		but3=$(read_buttons 3 "/tmp/button_values.io")
		if [[ $but3 -eq 1 ]]; then
			killall play
			echo "killed" > /tmp/killed
			echo "Prev"
			((pos--))
			let but_pressed=1
		fi

		but4=$(read_buttons 4 "/tmp/button_values.io")
		if [[ $but4 -eq 1 ]]; then
			killall play
			echo "killed" > /tmp/killed
			echo "Enter"
			let but_pressed=1
		fi

		sleep 0.1
	done
}


IFS=$'\n'
k=0;
pos=1

#for i in $(cat links.txt); do
for i in $(sed $1'!d' /home/pi/random-name/final/rss_feeds.txt); do
	((k++))
	curl -s $i > feed"$k".txt;
	cp feed"$k".txt test.txt
	./desc_check.sh test.txt
	m=0;
	for l in $(echo "cat /rss/channel/item/title/text()" | xmllint --nocdata --shell feed"$k".txt | sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g' ) #| sed -e 's/ /%/g' | sed -e 's/%-------/ /g');
	do
		pwd
		((m++))
		echo "======================="
		# for (( i = 0; i < m; i++ )); 
		# do
		# 	description=$(echo "cat /rss/channel/item/description/text()" | xmllint --nocdata --shell feed"$k".txt | sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g' );
		# done
		#echo "cat /rss/channel/item/link/text()" | xmllint --nocdata --shell test.txt |  sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g' 
		
		# for sdre in $(echo "cat /rss/channel/item/description/text()" | xmllint --nocdata --shell feed"$k".txt | sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g' ); do
			

		# 	if [[ pos -gt $m  ]]; then
		# 		break;
		# 	fi
		# 	((pos++))
		# done



		#google_speech -l en $l 

		pico2wave -w testTITLE.wav -l en-GB $l
		sox testTITLE.wav TITLE.wav pitch -20 gain -6.2 rate 48000 equalizer 60 0.9 -4.8 equalizer 310 0.9 +4 equalizer 600 0.9 +5.6 equalizer 1000 0.9 +5.6 equalizer 3000 0.9 +5.6 equalizer 6000 0.9 +4 equalizer 12000 0.9 +2.4 equalizer 14000 0.9 +2.4 equalizer 16000 0.9 +2.4 bass -2
		echo $l

		if [[ $(sed $m'!d'  result.txt) = "1" ]]; then
			
			echo "iva description \n\n\n\n\n"
			for sdre in $(echo "cat /rss/channel/item/description/text()" | xmllint --nocdata --shell feed"$k".txt | sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g' ); do
				if [[ $e -gt $pos ]]; then
					break;
				fi
				
			done

			pico2wave -w testDES.wav -l en-GB $sdre
			sox testDES.wav DES.wav pitch -20 gain -6.2 rate 48000 equalizer 60 0.9 -4.8 equalizer 310 0.9 +4 equalizer 600 0.9 +5.6 equalizer 1000 0.9 +5.6 equalizer 3000 0.9 +5.6 equalizer 6000 0.9 +4 equalizer 12000 0.9 +2.4 equalizer 14000 0.9 +2.4 equalizer 16000 0.9 +2.4 bass -2
			echo $sdre
			catwav TITLE.wav DES.wav TITLE_and_DES.wav
			play TITLE_and_DES.wav &
		else
			play TITLE.wav &
		fi
		
		wait_for_button

		#cat world-us-canada-44634176 | tr -d "\n\r" | grep '<h1.*' -o | html2text  | strings 

			
			#google_speech -l en $sdre
		# fi

		# if [[ -f  /tmp/killed1  ]]; then
		# 	echo XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx

		# 	if  [[ $(sed '4!d'  $(cat /tmp/killed1)) = "1" ]]; then
		# 	linktoarticle=$(echo "cat /rss/channel/item/link/text()" | xmllint --nocdata --shell feed"$k".txt |  sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g'| sed $m'!d')
				
		# 	wget -O article.txt $linktoarticle 
		# 	#sed '/<script type="text\/javascript"/,/<\/script>/d' $INF > $OUTF
		# 	#sed '/<script type="text\/javascript"/,/<\/script>/d' article.txt | sed '/<script type="text\/javascript"/,/<\/script>/d' | html2text 
		# 	html2text article.txt
		# 	#google_speech $(cat article.txt)

		# 	echo LLLLLLLLLLLLLLLLLLLLLLLLLLLL
		# 	pico2wave -w testAR.wav  -l en-GB $(cat  article.txt | tr -d "\n\r" | grep '<h1.*' -o | html2text  | strings )
		# 	sox testAR.wav AR.wav pitch -20 gain -6.2 rate 48000 equalizer 60 0.9 -4.8 equalizer 310 0.9 +4 equalizer 600 0.9 +5.6 equalizer 1000 0.9 +5.6 equalizer 3000 0.9 +5.6 equalizer 6000 0.9 +4 equalizer 12000 0.9 +2.4 equalizer 14000 0.9 +2.4 equalizer 16000 0.9 +2.4 bass -2
		# 	play AR.wav

		# 	fi
		# 	rm  /tmp/killed1
		# fi

		



	done
done




