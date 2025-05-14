#!/bin/sh

#Introductory messages
echo "Welcome to the Fedora 42 KDE Plasma Edition custom setup script."
echo "This script is only intended to be used on Fedora 42 KDE Plasma Edition."

sleep 0.2

echo
echo "This script will do the following:"

sleep 0.5

echo
echo
echo "	1. The script assumes that the Github repo it is hosted on was cloned entirely and resides within the cloned folder."
echo "	   The theme and wallpapers from the root folder will be moved to their proper location on the system."
echo "	2. A list of apps will be installed via Flatpak and RPM."

sleep 1

echo
echo


# Check if the script is run as root
if [ $(id -u) -ne 0 ]
	then
		echo
		echo "This script must be run as root. Please run with sudo or as the root user." 1>&2
		exit 1
fi


# Defining up_to_date function
up_to_date() {
	while true; do
		echo "Your install of Fedora has to be fully up-to-date for this script to run smoothly."
		echo "Is your system up-to-date? [y/n]"
		read -r response
		case "$response" in
			[Yy]* )
				echo
				return 0
				;;
			[Nn]* )
				echo "To update your system, do the following:"
				echo
				echo "	1. Open Discover"
				echo "	2. Click on 'Updates' in the side bar"
				echo "	3. Make sure every available update is selected, and click 'Update All' in the top right corner"
				echo
				echo
				echo "Please update your system before running this script again."
				exit 1
				;;
			* )
				echo "Invalid input. Please enter y or n."
				;;
		esac
	done
}


# Defining step_2 function
step_1() {
	while true; do
		echo -n "[y/n]"
		read -r yesno
		case "$yesno" in
			[Yy]* )
				echo
				return 0
				;;
			[Nn]* )
				echo
				return 1
				;;
			* )
				echo "Invalid input. Please enter y or n."
				;;
		esac
	done
}


# Calling up_to_date function
up_to_date


# Initiating Step 1
echo "== Step 1 =="
echo
echo "Moving Wallpapers folder to '~/Pictures'..."
do mv 'Wallpapers' '~/Pictures'
echo "Moving pfp.png to '~/Pictures/Profiles Pictures'..."
do mkdir '~/Pictures/Profile Pictures'
do mv 'pfp.png' '~/Pictures/Profile Pictures'
