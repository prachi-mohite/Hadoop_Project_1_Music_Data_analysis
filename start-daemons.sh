#!/bin/bash

rm -r /home/acadgild/example/music/logs
mkdir -p /home/acadgild/example/music/logs

if [ -f "/home/acadgild/example/music/logs/current-batch.txt" ]
then
 echo "Batch File Found!"
else
 echo -n "1" > "/home/acadgild/example/music/logs/current-batch.txt"
fi

chmod 775 /home/acadgild/example/music/logs/current-batch.txt
echo "After chmod"
batchid=`cat /home/acadgild/example/music/logs/current-batch.txt`
echo "After batchid-->> "$batchid
LOGFILE=/home/acadgild/example/music/logs/log_batch_$batchid

echo "Starting daemons" >> $LOGFILE

start-all.sh
start-hbase.sh
mr-jobhistory-daemon.sh start historyserver

cat /home/acadgild/example/music/logs/current-batch.txt

