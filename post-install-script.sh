#!/bin/sh

#Introductory messages
echo "Welcome to the Fedora 42 KDE Plasma Edition custom setup script."
echo "This script is only intended to be used on Fedora 42 KDE Plasma Edition."

sleep 0.2

echo
echo "Disclaimer:"
echo "This script assumes that"
echo
echo "- Git is installed,"
echo "- The Github repo this script is hosted on was cloned in its entirety, and"
echo "- That the script is run from its root directory (where the Wallpapers directory, readme, etc. reside)."
echo
echo
echo "This script will do the following:"

sleep 0.5

echo
echo
echo "	1. Take care of wallpapers, global theme and everything around it;"
echo "	3. Enable RPM Fusion and multimedia codecs;"
echo "	4. Install a list of apps via Flatpak and RPM."
echo
read -p "Press any key to start."

echo
echo

# Check if the script is run as root
if [ $(id -u) -ne 0 ]
	then
		echo
		echo "This script must be run as root. Please run with sudo or as the root user." 1>&2
		exit 1
fi

# Defining color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

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
				echo
				echo "To update your system, do the following:"
				echo
				echo "	1. Open Discover;"
				echo "	2. Click on 'Updates' in the side bar;"
				echo "	3. Make sure every available update is selected, and click 'Update All' in the top right corner."
				echo
				echo
				echo "Please update your system before running this script again."
				exit 1
				;;
		esac
	done
}


# Defining step 1 function
step_1() {
	while true; do
		clear
		echo "== Step 1: Desktop & Global Theme =="
		echo
		echo "This part of the script does the following:"
		echo
		echo "1. Move wallpapers and profile picture to the user's Pictures directory;"
		echo "2. Clone and execute the Catppuccin KDE Plasma theme install script;"
		echo "3. Display further instructions."
		echo
		echo "Proceed with Step 1 of the script? [y/n]"
		read -r stepone
		case "$response" in
			[Yy]* )
				echo
				echo "Initiating Step 1."
				echo
				echo
				echo "Moving Wallpapers folder to '~/Pictures'..."
				do mv 'Wallpapers' '~/Pictures'
				echo "Done."
				echo "Moving pfp.png to '~/Pictures/Profiles Pictures'..."
				mkdir ~/Pictures/Profile\ Pictures/
				mv pfp.png ~/Pictures/Profile\ Pictures
				echo "Done."
				sleep 1
				echo
				echo
				echo "Next, the Catppuccin KDE Plasma theme will be cloned from the official Github repo and its install script executed."
				echo "In the new Konsole window, enter your password and select the following options:"
				echo
				echo "1. Flavor: Mocha (Option 1)"
				echo "2. Accent: Lavender (Option 14)"
				echo "3. Window Style: Modern (Option 1)"
				echo "4. Don't apply Global Theme"
				echo
				read -p "Press any key to continue."
				echo
				echo

				# Clone Github repo
				git clone --depth=1 https://github.com/catppuccin/kde catppuccin-kde && cd catppuccin-kde
				konsole -e sudo ./install.sh
				read -p "Once the install script has finished, press any key to continue."
				echo
				echo "{$GREEN}Removing Catppuccin cursor themes...{$NC}"
				konsole --workdir ~/.local/share/icons -e rm -rf Catppuccin-Mocha-Dark-Cursors/ Catppuccin-Mocha-Lavender-Cursors/
				echo "{$GREEN}Done.{$NC}"
				echo "{$GREEN}Removing Catppuccin window buttons...{$NC}"
				konsole --workdir ~/.local/share/aurorae/themes -e rm -rf CatppuccinMocha-Modern/
				echo "{$GREEN}Done.{$NC}"
				echo "{$GREEN}Applying Global Theme...{$NC}"
				konsole -e lookandfeeltool --apply Catppuccin-Mocha-Lavender
				konsole -e /usr/libexec/kwin-applywindowdecoration Breeze
				read -p "{$GREEN}Done.{$NC} Press any key to continue."


				clear
				echo "A few additional manual steps are necessary:"
				echo
				echo "	1. In Konsole: Settings > Window Color Scheme > Catppuccin Mocha Lavender"
				echo "	2. In System Settings: Set Wallpapers directory (~/Pictures/Wallpapers) as default wallpaper location"
				echo
				echo
				echo "When done, press any key to continue."

				return 0
				;;
			[Nn]* )
				echo
				echo "Skipping Step 1."
				return 1
				;;
		esac
	done
}


# Defining step 2 function
step_2() {
	while true; do
		clear
		echo "Proceed with Step 2 of the script? [y/n]"
		read -r response
		case "$response" in
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


# Calling step 1 function
step_1


# Calling step 2 function
step_2
