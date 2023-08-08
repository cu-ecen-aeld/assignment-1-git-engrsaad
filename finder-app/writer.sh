#!/bin/bash
if [ $# -lt 2 ]; then
	echo "ERROR: Not enough arguments"
	exit 1
#elif [ $# -gt 2 ]; then
#	echo "ERROR: Too many arguments"
#	exit 1
else
	writefile=$1
	writestr=$2

	echo "$writestr" > $writefile
	
	if [ -f "$writefile" ]; then
		exit 0
	else
		echo "ERROR: File could not be created"
		exit 1
	fi
fi
