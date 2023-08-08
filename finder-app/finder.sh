#!/bin/bash
if [ $# -lt 2 ]; then
	echo "ERROR: Too few arguments"
	exit 1
else
	filesdir=$1
	searchstr=$2
	if [ -d "$filesdir" ]; then
		NUM=$(grep -r "$searchstr" "${filesdir}" | grep -c $searchstr)
		NUM_FILES=$(find $filesdir -type f | wc -l)
		echo "The number of files are $NUM_FILES and the number of matching lines are $NUM"
		exit 0
	else
		echo  "ERROR: Directory does not exist."
		exit 1
	fi
fi
