#!/bin/bash

# Accepts the following runtime arguments: the first argument is a path to a directory on the filesystem,
# referred to below as filesdir;
# the second argument is a text string which will be searched within these files, referred to below as searchstr
filesdir=$1
searchstr=$2

#Exits with return value 1 error and print statements if any of the parameters above were not specified
if ! [ $# -eq 2 ]
then
	echo "Incorrect number of Arguments"
	exit 1
fi

#Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem
if ! [ -d $filesdir ]
then
	echo "$filesdir doesn't represent a directory on the filesystem"
	exit 1
fi

# Prints a message "The number of files are X and the number of matching lines are Y" 
# where X is the number of files in the directory and all subdirectories 
# and Y is the number of matching lines found in respective files, 
# where a matching line refers to a line which contains searchstr (and may also contain additional content).


X=$(grep -r -l  $searchstr $filesdir/* | wc -l)
Y=$(grep -r $searchstr $filesdir/* | wc -l)

echo "The number of files are $X and the number of matching lines are $Y"
exit 0

