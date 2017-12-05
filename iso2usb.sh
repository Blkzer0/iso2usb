#!/bin/bash 

##script needs to run in sudo to copy to usb

if [[ $EUID -ne 0 ]]; then
	echo "ERROR! Run this script with root user!"
	exit 1
fi

lsblk

   echo "What is the usb path?:"
   read path
   echo "What is the iso path?:"
   read iso
   dd bs=1M if=$iso of=$path iflag=fullblock oflag=direct status=progress
   sleep 1 
   echo "iso has been written to usb"

## (bs) block size can be set to 4M for faster copy but may 
## not work so its set to default 1M
