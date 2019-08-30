#!/bin/bash
#echo "what is the file name>"
#read FILENAME

echo "lower bound>"
read lower
echo "upper bound>"
read upper


sudo cp /home/rohan/Downloads/out.txt /home/rohan/Downloads/parse_out.txt

#echo `cat /home/drl/rohanp/out.txt`
#for i in {-n lower..-n upper}
#do
#cat /home/rohan/Downloads/parse_out.txt | grep exec_host
echo= sudo cat /home/rohan/Downloads/parse_out.txt | awk -v FS="(<exec_host>|</exec_host>)" '{print $2}'
sed 's/exec_host/nothing/' /home/rohan/Downloads/parse_out.txt
echo= sudo cat /home/rohan/Downloads/parse_out.txt | awk -v FS="(<exec_host>|</exec_host>)" '{print $2}'
sed 's/exec_host/nothing/' /home/rohan/Downloads/parse_out.txt

#sed -n 's/</exec_host>/nothing/' /home/rohan/Downloads/parse_out.txt
#done

