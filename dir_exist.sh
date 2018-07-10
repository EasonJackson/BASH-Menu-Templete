#!/bin/bash


# "-z" check if a string is null
# "-n" check if a string is not null
# "-f" check if a filename exists
if [[ -z $1  ]] && [[ -f $1 ]];then
	echo "Yes"
else
	echo "No"
fi

