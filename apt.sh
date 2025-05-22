#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root"
    exit 1
fi

echo "This script updates and removes useless packages"

sleep 1

     apt update > /dev/null 2>&1
     apt upgrade -y > /dev/null 2>&1
     apt autoremove -y > /dev/null 2>&1

echo "Done :D"
