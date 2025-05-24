#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo -e "\e[31mThis script must be run as root\e[0m"
    exit 1
fi

echo -e "\e[36mWelcome to the DD multitool\e[0m"

sleep 1

echo -e "\e[36m(1) Create Bootable Usb Drive\n(2) Wipe USB drive\e[0m"
read -p "Select your choice: " choice

if [[ $choice == 1 ]]; then
	echo "Here you can flash a file to a usb drive!"
	sleep 1
	echo "Type the path to your file (ex:usb.img)"
	read flashfile
	if [[ ! -f $flashfile ]]; then
		echo -e "\e[31mThe file does not exist!\e[0m"
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
		echo -e "\e[31mNOTE: THIS  WILL ERASE ALL OF YOUR FLASH DRIVE\e[0m"
		read -p "Do you want to continue (y/n): " confirmflash
		if [[ $confirmflash == "y" || $confirmflash == "Y" ]]; then
			echo -e "\e[36mFlashing ...\e[0m"
			umount /dev/$flashdrive
			sudo dd bs=4M if=$flashfile of=/dev/$flashdrive status=progress
			echo -e "\e[32mThe file has been flashed!\e[0m"
			sleep 0.5
			echo -e "\e[32mYou can now remove your drive!\e[0m"
			exit 1
		else
			echo -e "\e[31mOperation Cancelled\e[0m"
			exit 1
		fi
	fi
fi	

if [[ $choice == 2 ]]; then
	echo "Here you can completly erase your USB drive!"
	echo -e "\e[33mNOTE: This will take a while\e[0m"
	sleep 1
	echo "Plug in your USB if you haven't already"
	sleep 2 
	echo "Type y once you've pluged in your USB drive" 
	read y
	if [[ $y ==  "y" || $y == "Y" ]]; then
		sleep 0.5
		lsblk
		sleep 1
		echo "Find your USB (sdX) and type it in (ex:sdc)"
		read flashdrive
		sleep 1
		echo -e "\e[31mNOTE: THIS WILL COMPLETLY ERASE YOUR USB\e[0m"
		sleep 1.5
		read -p "Do you want to continue (y/n): " confirm
		if [[ $confirm == "y" || $confirm == "Y" ]]; then
			echo -e "\e[36mWiping drive ...\e[0m"
			umount /dev/$flashdrive
			sudo dd bs=4M if=/dev/zero of=/dev/$flashdrive status=progress
		else 
			echo -e "\e[31mOperation Cancelled\e[0m"
			exit 1
		fi
	fi
fi		

	

