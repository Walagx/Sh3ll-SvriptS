#!/bin/bash

echo "This script updates and removes uselsess packages"

sleep 1

sudo apt update > /dev/null 2>&1
sudo apt upgrade -y > /dev/null 2>&1
sudo apt autoremove > /dev/null 2>&1

echo "Done :D"
