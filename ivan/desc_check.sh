#!/bin/bash

sed -e "s/</\n</g" -i $1
egrep '<item|<description' $1 > new.xml
rpl -e '>\n' '>' new.xml
rpl '<item><description>' '1' new.xml
rpl '<item>' '0' new.xml
sed -e "s/<description>//g" -i new.xml
cat new.xml | fold -w 1 > result.txt
rm new.xml
# cat result.txt