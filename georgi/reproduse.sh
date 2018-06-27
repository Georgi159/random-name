#!/bin/bash

find . -name 'feed*' -delete ;

read_butonts () {
sed $1'!d'  $(cat location_of_buton) | sed 's/B[0-9]\s//'
}


IFS=$'\n'
k=0;
for i in $(cat links.txt); do
	((k++))
	curl -s $i > feed"$k".txt;
	cp feed"$k".txt test.txt
	./desc_check.sh test.txt
	m=0;
	for l in $(echo "cat /rss/channel/item/title/text()" | xmllint --nocdata --shell feed"$k".txt | sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g' ) #| sed -e 's/ /%/g' | sed -e 's/%-------/ /g');
	do
		((m++))

		# for (( i = 0; i < m; i++ )); 
		# do
		# 	description=$(echo "cat /rss/channel/item/description/text()" | xmllint --nocdata --shell feed"$k".txt | sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g' );
		# done
		#echo "cat /rss/channel/item/link/text()" | xmllint --nocdata --shell test.txt |  sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g' 
		pos=0;
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

		play TITLE.wav


		if [[ $(sed $m'!d'  result.txt) = "1" ]]; then
			((pos++))
			echo "iva description \n\n\n\n\n"
			for sdre in $(echo "cat /rss/channel/item/description/text()" | xmllint --nocdata --shell feed"$k".txt | sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g' ); do
				if [[ $e -gt $pos ]]; then
					break;
				fi
				
			done

			pico2wave -w testDES.wav -l en-GB $sdre
			sox testDES.wav DES.wav pitch -20 gain -6.2 rate 48000 equalizer 60 0.9 -4.8 equalizer 310 0.9 +4 equalizer 600 0.9 +5.6 equalizer 1000 0.9 +5.6 equalizer 3000 0.9 +5.6 equalizer 6000 0.9 +4 equalizer 12000 0.9 +2.4 equalizer 14000 0.9 +2.4 equalizer 16000 0.9 +2.4 bass -2
			echo $sdre
			play DES.wav
		fi

			
			
			#google_speech -l en $sdre
		# fi

		if [[ -f  /tmp/killed  ]]; then
			rm  /tmp/killed
		fi

		


		if  [[ $(read_butonts 1) = "1" ]]; then
			linktoarticle=$(echo "cat /rss/channel/item/link/text()" | xmllint --nocdata --shell feed"$k".txt |  sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g'| sed $m'!d')
				
			wget -O article.txt $linktoarticle 
			#sed '/<script type="text\/javascript"/,/<\/script>/d' $INF > $OUTF
			#sed '/<script type="text\/javascript"/,/<\/script>/d' article.txt | sed '/<script type="text\/javascript"/,/<\/script>/d' | html2text 
			html2text article.txt
			google_speech $(cat article.txt)

		fi
	done
done




