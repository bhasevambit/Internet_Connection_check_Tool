#!/bin/bash

while true
do
	while read line
	do
		echo "====="
		sleep 1
		echo $line
		ping -c1 $line
		if [ $? -ne 0 ]; then
			DATE=`date '+%Y/%m/%d %H:%M:%S'`
			osascript -e "display notification \"Internet Connection途絶(IPv4)の可能性高。注意確認の事！\" with title \"$DATE\""
		fi
	done < ./IPv4-list.txt

	while read line
	do
		echo "====="
		sleep 1
    	echo $line
    	ping6 -c1 $line
    	if [ $? -ne 0 ]; then
			DATE=`date '+%Y/%m/%d %H:%M:%S'`
			osascript -e "display notification \"Internet Connection途絶(IPv6)の可能性高。注意確認の事！\" with title \"$DATE\""
		fi
	done < ./IPv6-list.txt

	sleep 5

done

