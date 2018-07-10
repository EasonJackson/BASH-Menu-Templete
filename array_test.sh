#!/bin/bash

declare -a array=(1,3,5,7,9)

echo ${array[@]}

function change_array {
	local array=$@
	echo ${array[0]}
}

change_array $array
