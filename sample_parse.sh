#!/bin/bash
#echo "what is the file name>"
#read FILENAME

echo "lower bound>"
read lower
echo "upper bound>"
read upper


sudo cp /home/drl/rohanp/out.txt /home/drl/rohanp/parse_out.txt

#echo `cat /home/drl/rohanp/out.txt`
for i in {-n lower..-n upper}
do
cat /home/drl/rohanp/parse_out.txt | grep exec_host
echo= sudo cat /home/drl/rohanp/parse_out.txt | awk -v FS="(<exec_host>|</exec_host>)" '{print $2}'
sed "g<exec_hos>t.*/<exec_host> /g" /home/drl/rohanp/parse_out.txt
done



