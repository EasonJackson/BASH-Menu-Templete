#!/bin/bash

cd "$1"

while read branch
do
	echo "`git log $branch --pretty="%h" -1` ($branch)"
done <<< "$(git branch | sed 's/^\*//')"
