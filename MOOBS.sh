#!/usr/bin/env bash

# Michael's Overly Opinionated Bootstrapping Script (MOOBS)
# by Michael Auderer <mike@silverstone.io>
# License: WTFPL

# Add google chrome
dnf install -y fedora-workstation-repositories
dnf config-manager --set-enabled google-chrome

# Add VSCode key and repo
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# Add repo for i3 and rofi
dnf copr enable gregw/i3desktop

# Install yummy packages
dnf install -y \
	i3-gaps \
	rofi \
	google-chrome-stable \
	code \
	nano \
	vim \
	ranger \
	w3m \
	calcurse \
	compton \
	feh \
	arandr \
	i3blocks \
	i3lock \
	rxvt-unicode \
	scrot \
	unar

# Install Discord
flatpak install --from https://flathub.org/repo/appstream/com.discordapp.Discord.flatpakref 

# Install pywal
pip3 install pywal

# Download fonts
cd /usr/share/fonts
mkdir hack && cd hack
FONT_PATH=https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/Hack
wget $FONT_PATH/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete.ttf?raw=true
wget $FONT_PATH/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true
wget $FONT_PATH/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete.ttf?raw=true
wget $FONT_PATH/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete%20Mono.ttf?raw=true
wget $FONT_PATH/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete.ttf?raw=true
wget $FONT_PATH/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete%20Mono.ttf?raw=true
wget $FONT_PATH/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete.ttf?raw=true
wget $FONT_PATH/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf?raw=true

# Regenerate font cache
fc-cache -f -v

