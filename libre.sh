#!/bin/bash

echo "This shell script removes ALL libreoffice packages"
sleep 1
read -p "Do you wish to continue (y/n)" ANSWER

if [[ "$ANSWER" == "y" || "$ANSWER" == "Y" ]]; then
	echo "Updating Package list..."
	sudo apt update > /dev/null 2>&1
	echo "Removing Packages..."
	sudo apt-get remove --purge "libreoffice*" > /dev/null 2>&1
	sudo apt-get clean > /dev/null 2>&1
	sudo apt-get autoremove > /dev/null 2>&1
	echo "All libre packages have been removed :D"
else
	echo "Operation Canceled"
fi
