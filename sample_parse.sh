#!/bin/bash

#Ask the user for the file name
echo "what is the file name> (include the full file path)"
read FILENAME

#ask the user for the lower bound
echo "lower bound>"
read lower

#ask the user for the upper bound
echo "upper bound>"
read upper



#For loop - each iteration prints a new host id to the termianl
for i in {-n lower..-n upper}
do

	# print the value between the two tags
	JOB= sudo cat $FILENAME | awk -v FS="(<exec_host>|</exec_host>)" '{print $2}'

	echo $JOB

	# replace the first tag with nothing
	sudo sed -i  's/<exec_host>//' $FILENAME

	# replace the second tag with nothing
	sudo sed -i 's/exec_host>//' $FILENAME


#END For loop
done

