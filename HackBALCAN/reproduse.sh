#!/bin/bash

find . -name 'feed*' -delete ;


IFS=$'\n'
k=0;
for i in $(cat links.txt); do
	((k++))
	curl -s $i >> feed"$k".txt;

	m=0;
	for l in $(echo "cat /rss/channel/item/title/text()" | xmllint --nocdata --shell feed"$k".txt | sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g' ) #| sed -e 's/ /%/g' | sed -e 's/%-------/ /g');
	do
		((m++))
		for (( i = 0; i < m; i++ )); do
			description=$(echo "cat /rss/channel/item/description/text()" | xmllint --nocdata --shell feed"$k".txt | sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g' );
		done

		pos=0;
		for sdre in $(echo "cat /rss/channel/item/description/text()" | xmllint --nocdata --shell feed"$k".txt | sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g' ); do
			if [[ pos -gt $m  ]]; then
				break;
			fi
			((pos++))
		done

		google_speech -l en $l 
		#pgrep 'google_speech'
		google_speech -l en $sdre

		# while pgrep 'google_speech' ; do
		# 	 read -rsn1 	input;
		# 	 echo $input
		# 	 if [[ -z $input ]]; then
		# 	 	killall google_speech;
		# 	 	killall google_speech
		# 	 fi
		# done
	done
done




