#!/bin/bash

# Script I maintain to easily update my Linux-Stuff repo with the latest versions 
# of my configs, code, and scripts

# Copying local config files into their respective folders in the repo
cp ~/.zshrc ~/Git/Linux-Stuff/Arch-Stuff
cp ~/.config/i3/config ~/Git/Linux-Stuff/Arch-Stuff
cp ~/.vimrc ~/Git/Linux-Stuff/Arch-Stuff
cp ~/.xinitrc  ~/Git/Linux-Stuff/Arch-Stuff
cp -r ~/.config/qutebrowser ~/Git/Linux-Stuff/Arch-Stuff

# Copying local code and scripts into their respective repo folders
cp ~/Scripts/linux-stuff-backup.sh ~/Git/Linux-Stuff/Code
cp ~/Scripts/screenbrightup.sh ~/Git/Linux-Stuff/Code
cp ~/Scripts/screenbrightdown.sh ~/Git/Linux-Stuff/Code
cp ~/Scripts/cryptoportfolio.sh ~/Git/Linux-Stuff/Code

# Changing into the repo's Arch-Stuff directory
cd ~/Git/Linux-Stuff/Arch-Stuff

# Renaming files for organizational purposes and so dot files aren't hidden
rename config i3config config
rename .zshrc zshrc .zshrc
rename .vimrc vimrc .vimrc

# Change directory to the main repo directory
cd ~/Git/Linux-Stuff

# Update and merge with the repo on github
git add Arch-Stuff Code
git commit -m "Script Update" 
git push 

clear 

figlet "Good job kid!"
