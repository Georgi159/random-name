#!/bin/bash

find . -name 'feed*' -delete ;

read_butonts () {
sed $1'!d'  butonts | sed 's/B[0-9]\s//'
}


IFS=$'\n'
k=0;
for i in $(cat links.txt); do
	((k++))
	curl -s $i >> feed"$k".txt;

	m=0;
	for l in $(echo "cat /rss/channel/item/title/text()" | xmllint --nocdata --shell feed"$k".txt | sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g' ) #| sed -e 's/ /%/g' | sed -e 's/%-------/ /g');
	do
		((m++))
		for (( i = 0; i < m; i++ )); 
		do
			description=$(echo "cat /rss/channel/item/description/text()" | xmllint --nocdata --shell feed"$k".txt | sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g' );
		done
		#echo "cat /rss/channel/item/link/text()" | xmllint --nocdata --shell test.txt |  sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g' 
		pos=0;
		for sdre in $(echo "cat /rss/channel/item/description/text()" | xmllint --nocdata --shell feed"$k".txt | sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g' ); do
			if [[ pos -gt $m  ]]; then
				break;
			fi
			((pos++))
		done

		google_speech -l en $l 
		google_speech -l en $sdre


		if  [[ $(read_butonts 2) = "1" ]]; then
			linktoarticle=$(echo "cat /rss/channel/item/link/text()" | xmllint --nocdata --shell feed"$k".txt |  sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g'| sed $m'!d')
				
			wget -O article.txt $linktoarticle 
			google_speech $(cat article.txt)

		fi
	done
done




