Install Steps (Fedora 42 KDE Plasma)


Pre-Install
1. Make sure the drive you wish to install Fedora on is either already formatted, or doesn't have important data on it. This data will be overwritten during the install.
2. If you already have a Linux install on the drive you wish to install Fedora on, it's usually best to backup your important data and erase the drive contents so that new partitions can be created as necessary during the install. When using a /home partition from a different distro, it can lead to compatibility issues with certain configs and bloating the partition with files that aren't needed anymore.
3. If this is your first time installing Linux, make sure your hardware is compatible. NVIDIA GPUs run a bit worse under Linux than AMD or Intel cards, and most proprietary peripherals will struggle working correctly under Linux as well. Check if that's the case for you and evaluate accordingly.


The Install
1. Download the Fedora ISO and flash it onto a USB drive (or copy it onto a Ventoy-enabled drive). Plug that drive into one of the motherboard USB ports, restart the PC and boot into the Fedora live environment.
2. Install Fedora using the installer. You can choose to install the entire distro onto 1 big partition, or separate certain parts of the file system to different partitions, like the /home folder.
3. Once the install is complete, restart the computer.


Post-Install Setup
1. Download all Fedora updates through Discover, then restart to install the updates.
2. Navigate to the RPM Fusion website (https://rpmfusion.org/) and follow the "Enable RPM Fusion on your system" guide. Then go to the Multimedia page and follow it to install additional codecs and, more importantly, the hardware codecs further down.
    2.1. If you wish to use DVDs, install the packages provided under the "Play a DVD" section.
    2.2. Once done, restart the computer.
3. Install Timeshift ("sudo dnf install timeshift"), set it up and create a snapshot ("20xx-MM-DD Post-Install").
    3.1. Have Timeshift do snapshots every so often (every 2-3 days should suffice).


Customization
- How you customize your desktop is completely up to you. This is how I usually customize my desktop.

1. Go to the Catppuccin Github repo for KDE (https://github.com/catppuccin/kde) and follow the on-site instructions to install the Catppuccin Mocha Lavender global theme.
2. Once installed, apply the global theme. Change the Plasma Style and Window Decorations to Breeze, and change the icons to Breeze Dark.
3. Copy the Wallpapers folder from the root folder of this guide into your Pictures folder and replace the current wallpaper with these.
4. Change the background image for the login screen to the login_screen.png located in "/Wallpapers/Login Screen".
5. In Dolphin, enable "Show Menubar" and add a Refresh button to the toolbar.
    5.1. If the menubar doesn't stay enabled after restarting Dolphin, navigate to "~/.config" and remove every file related to Dolphin, or navigate to "~/.cache" and delete every file ending with ".kcache", then log out and back in.
6. In Konsole, create a new profile and do the following steps:
    6.1. Download the Catppuccin Mocha for Konsole color scheme and apply it to the profile.
    6.2. Change the font to FiraCode Nerd Font Mono, 10pt.
    6.3. Make the background 7% transparent, enable "Blur background" (make sure the Blur effect is enabled in System Settings).
7. Set the panel to "Dodge windows", otherwise leave unchanged.
    7.1. If you use more than 1 monitor, clone the panel and move it to the bottom of the other monitor.


Additional Software
- Once again, it's completely up to you what software you install from this point onward. This is just what I personally use.

1. As a precautionary step, remove "fedora" from the list of added Flatpak remotes ("sudo flatpak remote-delete fedora").
2. Using Flatpak, install the following programs:
    - Floorp ("sudo flatpak install one.ablaze.floorp"),
    - Lutris ("sudo flatpak install net.lutris.Lutris"),
    - Vesktop ("sudo flatpak install dev.vencord.Vesktop"),
    - Spotify ("sudo flatpak install com.spotify.Client"),
    - Prism Launcher ("sudo flatpak install org.prismlauncher.PrismLauncher"), and
    - Flatseal ("sudo flatpak install com.github.tchx84.Flatseal").
3. Using RPM, install the following programs:
    - OpenRGB ("sudo dnf install openrgb")
    - VLC Media Player ("sudo dnf install vlc"),
    - Steam ("sudo dnf install steam"), and
    - GIMP ("sudo dnf install gimp").
