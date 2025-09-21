#!/bin/bash

echo -e "NOTE: Before running this utility, please ensure you have installed VMTools. If you have not you can do this with 'sudo dnf install open-vm-tools open-vm-tools-desktop\n"

read -p "Do you have VMTools installed? Please enter 'yes' or 'no' : " answer

if [ "$answer" == "yes" ]; then
	echo ""
	read -p "Enter your share folders name in VMWare WS Pro: " sharename
	echo ""
	read -p "Enter an absolute directory location for where you want your share mounted (e.g., /opt/share) : " mountpoint

	mkdir -p "$mountpoint"
	
	if mount -t fuse.vmhgfs-fuse ".host:/$sharename" "$mountpoint" -o allow_other; then 
		echo -e "\n"$sharename" was successfully mounted to $mountpoint!"
	else
		echo -e "\nFailed to mount. Please check the folder name and VMWare 'Shared Folders' settings"
	fi

else

	echo -e "\nYou need VMTools. 🙂"
fi
