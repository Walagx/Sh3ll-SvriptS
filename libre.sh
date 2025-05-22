#!/bin/bash

echo "This script deletes ALL libreoffice packages"
sleep 1.5
read -p "Do you wish to continue? (y/n)" ANSWER

if [[ $ANSWER == "y" || $ANSWER == "Y" ]]; then
	echo "Updating package list..."
	sudo apt update > /dev/null 2>&1	
	echo "Remove libreoffice packages..."
	sudo apt-get remove --purge "libreoffice*" > /dev/null 2>&1
	sudo apt-get clean > /dev/null 2>&1
	sudo apt-get autoremove > /dev/null 2>&1
	echo "All libreoffice packages have been removed :D"
else
    echo "Operation Cancelled"
fi
