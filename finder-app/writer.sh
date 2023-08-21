#!/bin/bash

#the first argument is a full path to a file (including filename) on the filesystem
writefile=$1
#the second argument is a text string which will be written within this file
writestr=$2

#Exits with return value 1 error and print statements if any of the parameters above were not specified
if ! [ $# -eq 2 ]
then
	echo "Incorrect number of Arguments"
	exit 1
fi

#Creates a new file with name and path writefile with content writestr, overwriting any existing file and creating the path if not exists
# > is used for redirecting rather than >> to avoid appending
echo $writestr > "$writefile"

if ! [ $? -eq 0 ]
then
       	echo "File can't be creataed"
	exit 1
fi

