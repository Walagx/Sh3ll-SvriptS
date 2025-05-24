#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo -e "\e[31mThis script must be run as root\e[0m"
    exit 1
fi

# Resizes the window for the ASCII characters
printf '\e[8;23;91t'


echo -e "\e[35m
██████╗░██████╗░  ███╗░░░███╗██╗░░░██╗██╗░░░░░████████╗██╗████████╗░█████╗░░█████╗░██╗░░░░░
██╔══██╗██╔══██╗  ████╗░████║██║░░░██║██║░░░░░╚══██╔══╝██║╚══██╔══╝██╔══██╗██╔══██╗██║░░░░░
██║░░██║██║░░██║  ██╔████╔██║██║░░░██║██║░░░░░░░░██║░░░██║░░░██║░░░██║░░██║██║░░██║██║░░░░░
██║░░██║██║░░██║  ██║╚██╔╝██║██║░░░██║██║░░░░░░░░██║░░░██║░░░██║░░░██║░░██║██║░░██║██║░░░░░
██████╔╝██████╔╝  ██║░╚═╝░██║╚██████╔╝███████╗░░░██║░░░██║░░░██║░░░╚█████╔╝╚█████╔╝███████╗
╚═════╝░╚═════╝░  ╚═╝░░░░░╚═╝░╚═════╝░╚══════╝░░░╚═╝░░░╚═╝░░░╚═╝░░░░╚════╝░░╚════╝░╚══════╝
\e[0m"

echo -e "\e[36mWelcome to the DD multitool\e[0m"

sleep 1

echo -e "\e[32m[1] \e[36mCreate Bootable Usb Drive\n\e[32m[2] \e[36mWipe USB drive\e[0m"
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
	echo -e "\e[33mTo confirm the drive is pluged in hit ENTER/RETURN to continue\e[0m"
	read enter

	if [[ -z $enter ]]; then
		lsblk
		sleep 1
		echo -e "Find your flash drive\nIt will be sdX\nOnce you've located your flash drive (sdX) type it in (ex:sdb etc)"
		read flashdrive
		echo -e "\e[31mNOTE: THIS  WILL ERASE ALL OF YOUR FLASH DRIVE\e[0m"
		read -p "Do you want to continue (y/n): " confirmflash
		if [[ $confirmflash == "y" || $confirmflash == "Y" ]]; then
			echo -e "\e[36mFlashing...\e[0m"
			umount /dev/$flashdrive >> /dev/null 2>&1
			sudo dd bs=4M if=$flashfile of=/dev/$flashdrive status=progress
			echo -e "\e[32mThe file has been flashed!\e[0m"
			sleep 0.5
			echo -e "\e[36mEjecting Drive...\e[0m"
			sudo eject /dev/$flashdrive
			exit 1
		else
			echo -e "\e[31mOperation Cancelled\e[0m"
		fi
	fi
fi	

if [[ $choice == 2 ]]; then
	echo "Here you can completly erase your USB drive!"
	echo -e "\e[33mNOTE: This will take a while\e[0m"
	sleep 1
	echo "Plug in your USB if you haven't already"
	sleep 2 
	echo -e "\e[33mHit ENTER/RETURN once you've pluged in your USB drive\e[0m" 
	read y
	if [[ -z  $y ]]; then
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
			echo -e "\e[36mWiping drive...\e[0m"
			umount /dev/$flashdrive
			sudo dd bs=4M if=/dev/zero of=/dev/$flashdrive status=progress
		else 
			echo -e "\e[31mOperation Cancelled\e[0m"
			exit 1
		fi
	fi
fi		

	

