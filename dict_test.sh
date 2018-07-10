#!/bin/bash

declare -A animals

animals=( ["moo"]="cow" ["woof"]="dog" )

echo ${animals["moo"]}
echo ${animals[@]} # Print all contents
echo ${#animals[@]} # Print total numbers of key:value pairs
echo ${!animals[@]} # Print all keys
