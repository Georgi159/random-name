#!/bin/bash
read_buttons()
{
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
			#./button_kill.sh
			# tmux new -s name -d ./reproduse.sh $pos
			./reproduse.sh $pos
		fi

		sleep 0.1
	done
}

k=0
sel=0

#declare -a feed_links
# Link filedescriptor 3 with stdin
#exec 3<&0
# stdin replaced with a file supplied as a first argument
#exec < "links.txt"
# Read feed links
#let line_cnt=0
#while read line
#do
#    feed_links[$line_cnt]=$line
#    ((line_cnt++))
#done
#num_of_feeds=${#feed_links[@]}
# restore stdin from filedescriptor 10
# and close filedescriptor 10
#exec 0<&10 10<&-

declare -a feed_titles
for i in $(cat rss_feeds.txt)
do
	((k++))
	curl -s $i > feedd"$k".txt
	feed_titles[$k]=$(echo "cat /rss/channel/title/text()" | xmllint --nocdata --shell feedd"$k".txt | sed '1d;$d' |sed -e ':a;N;$!ba;s/-------\n/ /g' ) #| sed -e 's/ /%/g' | sed -e 's/%-------/ /g');
done
num_of_feeds=${#feed_titles[@]}

((num_of_feeds++))
pos=1
while [[ $pos -lt $num_of_feeds ]];
do
	echo ${feed_titles[$pos]}
	pico2wave -w feed_title.wav -l en-GB "${feed_titles[$pos]}"
	sox feed_title.wav out.wav pitch -20 gain -6.2 rate 48000 equalizer 60 0.9 -4.8 equalizer 310 0.9 +4 equalizer 600 0.9 +5.6 equalizer 1000 0.9 +5.6 equalizer 3000 0.9 +5.6 equalizer 6000 0.9 +4 equalizer 12000 0.9 +2.4 equalizer 14000 0.9 +2.4 equalizer 16000 0.9 +2.4 bass -2
	play out.wav &
	wait_for_button

	#over/underflow protection
	if [ $pos -eq $num_of_feeds ];
	then
		let pos=1
	fi

	if [ $pos -eq 0 ];
	then
		let pos=num_of_feeds-1
	fi
done
