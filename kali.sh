#!/bin/bash

# Changes the apt sources
echo 'deb http://kali.download/kali kali-rolling main non-free contrib' > /etc/apt/sources.list

# Obtain the apt key
wget https://archive.kali.org/archive-key.asc -O /etc/apt/trusted.gpg.d/kali-archive-keyring.asc

# Installs kali key package
wget -q --show-progress https://kali.download/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2025.1_all.deb

dpkg -i kali-archive-keyring_2025.1_all.deb

# Update
sudo apt update
sudo apt upgrade -y
sudo apt install kali-defaults -y
sudo apt update
sudo apt upgrade -y
sudo apt autoremove

