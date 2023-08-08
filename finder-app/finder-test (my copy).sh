#!/bin/bash
# Tester script for assignment 1
# Author: Saad Qayyum

clear

NUMFILES=10
WRITESTR=AELD_IS_FUN
WRITEDIR=/tmp/aeld-data
username=$(cat conf/username.txt)

if [ $# -lt 2 ]
then
	echo "Using default string ${WRITESTR} to write"
	if [ $# -lt 1 ]
	then
		echo "Using default number of files (${NUMFILES}) to write"
	else
		NUMFILES=$1
	fi	
#elif [ $# -gt 2 ]; then
#s	echo "Too many arguments"
else
	NUMFILES=$1
	WRITESTR=$2
#	WRITEDIR=/tmp/aeld-data/$3
fi

mkdir $WRITEDIR

for (( i=1; i <= $NUMFILES; i++))
do 
	./writer.sh "$WRITEDIR/${username}$i.txt" "$WRITESTR"
done

MYSTR=$(./finder.sh $WRITEDIR $WRITESTR)
MATCHSTR="The number of files are ${NUMFILES} and the number of matching lines are ${NUMFILES}"

echo ${MYSTR} | grep "${MATCHSTR}"

if [ $? -eq 0 ]; then
	echo "success"
	exit 0
else
	echo "error"
	exit 1
fi

rm -r $WRITEDIR
