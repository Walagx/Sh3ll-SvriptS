#!/bin/bash

# Changes the apt sources
echo 'deb http://kali.download/kali kali-rolling main non-free contrib' > /etc/apt/sources.list

echo 'deb http://http.kali.org/kali kali-rolling main non-free-firmware non-free contrib' > /etc/apt/sources.list


# Obtain the apt key
wget https://archive.kali.org/archive-key.asc -O /etc/apt/trusted.gpg.d/kali-archive-keyring.asc

# Update
sudo apt update
sudo apt upgrade -y
sudo apt install kali-defaults -y

sudo apt update
sudo apt upgrade -y
sudo apt install firmware-mediatek


