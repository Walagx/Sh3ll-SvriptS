#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root."
    exit 1
fi


echo "This script deletes ALL LibreOffice packages"
sleep 1.5
read -p "Do you wish to continue? (y/n)" ANSWER

if [[ $ANSWER == "y" || $ANSWER == "Y" ]]; then
	echo "Updating package list..."
	sudo apt update > /dev/null 2>&1	
	echo "Remove LibreOffice packages..."
	sudo apt-get remove --purge "LibreOffice*" > /dev/null 2>&1
	sudo apt-get clean > /dev/null 2>&1
	sudo apt-get autoremove > /dev/null 2>&1
	echo "All LibreOffice packages have been removed :D"
else
    echo "Operation Canceled"
fi
