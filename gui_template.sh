#!/bin/bash
# Bash Menu Script Example

SEPERATOR="================================================================"

function display_menu {
	    local options=("$@")
	    echo
	    echo "$1"
    	    for index in `seq 1 $((${#options[@]}-1))`;
    	    do
    		echo "$((index))) ${options[$index]}"
            done
}

function sub_menu {
    echo $SEPERATOR
    echo "Menu 1_1 option list: "
    local PS3='Please select one choice: '
    local subs=("Option 1_1" "Option 1_2" "Back")
    select sub in "${subs[@]}"
    do
	case $sub in
	    "Option 1_1") 
		echo "Sub 1_1"
    	    	echo $SEPERATOR
		display_menu "Menu 1_1 option list: " "${subs[@]}" 
		;;
	    "Option 1_2") 
		echo "Sub 1_2"
    	    	echo $SEPERATOR
		display_menu "Menu 1_1 option list: " "${subs[@]}"
		;;
	    "Back") 
		echo "Back to previous menu..."
		echo $SEPERATOR 
		break;;
	    *) echo 
		"Invalid option $REPLY"
		;;
	esac
    done
}

function main_menu {
    local PS3='Please enter your choice: '
    local options=("Submenu 1" "Option 2"  "Quit")
    echo "Menu 1 option list: "
    select opt in "${options[@]}"
    do
        case $opt in
            "Submenu 1")
    	    	sub_menu
    	    	echo $SEPERATOR
	    	display_menu "Menu 1 option list: " "${options[@]}"
		;;
            "Option 2")
                echo "you chose choice 2"
    	    	echo $SEPERATOR
		display_menu "Menu 1 option list: " "${options[@]}"
                ;; 
            "Quit")
    	    	echo "Are you sure to quit? Y/N?"
    	    	read ANSWER
    	    	until [ "$ANSWER" = "Y" ] || [ "$ANSWER" = "N" ]; 
    	    	do
    	    	    echo "Only Y or N, please re-enter your choice:"
    	    	    read ANSWER
    	    	done
    	    	if [ $ANSWER = "Y" ]; then
    	    	    echo "Quiting..."
    	    	    exit
    	    	fi
    	    	echo $SEPERATOR
		display_menu "Menu 1 option list: " "${options[@]}"
            	;;
            *) 
		echo "invalid option $REPLY"
		;;
        esac
    done
}

echo
main_menu
