#!/bin/bash

# This script is still under construction :)

echo "This simple script injects any text you want into any file!"

sleep 2

echo "Type the path to the file that you want to inject into"
read injectpath

if [ ! -f $injectpath ]; then
	echo "File does not exist!"
	exit 1
fi

sleep 1
echo "Type the text you want to inject"
read inject

echo "Injecting ..."
sleep 1.5
echo $inject >> $injectpath
echo "Done!"
