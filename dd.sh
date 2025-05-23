#!/bin/bash

echo "Welcome to the DD multitool"

sleep 1

echo -e "(1) Create Bootable Usb Drive\n(2) Not finished :("
read -p "Select your choice: " choice

if [ $choice == 1 ]; then
	echo "Here you can flash a file to a usb drive!"
	sleep 1
	echo "Type the path to your file (ex:usb.img)"
	read flashfile
	if [ ! -f $flashfile ]; then
		echo "The file does not exist!"
		exit 1
	fi

	sleep 1
	echo "Plug in your flash drive If you haven't already"
	sleep 2
	echo "To confirm the drive is pluged in type y to continue"
	read y

	if [ y == "y" ]; then
		lsblk
		sleep 1
		echo "Find your flash drive"
		exit 1
	fi	
fi
