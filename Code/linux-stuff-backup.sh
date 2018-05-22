#!/bin/bash

# Script i maintain to easily update my Linux-Stuff repo with the latest versions 
# of my configs, code, and scripts

# Copying config files into their respective folders
cp ~/.zshrc ~/Git/Linux-Stuff/Arch-Stuff
cp ~/.config/i3/config ~/Git/Linux-Stuff/Arch-Stuff
cp -r ~/.config/qutebrowser ~/Git/Linux-Stuff/Arch-Stuff
cp ~/.vimrc ~/Git/Linux-Stuff/Arch-Stuff

# Copying Code and Scripts into their respective folders
cp ~/Scripts/linux-stuff-backup.sh ~/Git/Linux-Stuff/Code

# Changing into the repo directory
cd ~/Git/Linux-Stuff/Arch-Stuff

# Renaming files for organization purposes and so dot files aren't hidden
rename config i3config config
rename .zshrc zshrc .zshrc
rename .vimrc vimrc .vimrc

# Change directory to the main repo directory
cd ~/Git/Linux-Stuff

# Update and merge with the repo on github
git add Arch-Stuff Code
git merge
git commit -m "Update"
