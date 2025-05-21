#!/bin/bash

echo "This script updates and removes uselsess packages"

sleep 1

sudo apt update && sudo apt upgrade -y

sudo apt autoremove

