#!/bin/bash


echo "Welcome to the DD multitool"

sleep 1

echo -e "(1) Create Bootable Usb Drive\n(2) Not finished :("
read -p "Select your choice: " choice

if [[ $choice == 1 ]]; then
	echo "Here you can flash a file to a usb drive!"
	sleep 1
	echo "Type the path to your file (ex:usb.img)"
	read flashfile
	if [[ ! -f $flashfile ]]; then
		echo "The file does not exist!"
		exit 1
	fi

	sleep 1
	echo "Plug in your flash drive If you haven't already"
	sleep 2
	echo "To confirm the drive is pluged in type y to continue"
	read y

	if [[ $y == "y" ]]; then
		lsblk
		sleep 1
		echo -e "Find your flash drive\nIt will be sdX\nOnce you've located your flash drive (sdX) type it in (ex:sdb etc)"
		read flashdrive
		echo -e "DD is a very descructive process\nIT WILL ERASE ALL OF YOUR FLASH DRIVE"
		read -p "Do you want to continue (y/n): " confirmflash
		if [[ $confirmflash == "y" || $confirmflash == "Y" ]]; then
			umount /dev/$flashdrive
			echo "Flashing ..."
			sudo dd bs=4M if=$flashfile of=/dev/$flashdrive status=progress
			echo "The file has been flashed!"
			sleep 0.5
			echo "You can now remove your drive!"
			exit 1
		else
			echo "Operation Cancelled"
			exit 1

		fi
	fi
fi	
