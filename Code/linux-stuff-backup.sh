#!/bin/bash

# Script I maintain to easily update my Linux-Stuff repo with the latest versions 
# of my configs, code, and scripts

# Copying local config files into their respective folders in the repo
cp ~/.zshrc ~/Git/Linux-Stuff/Arch-Stuff
cp ~/.config/i3/config ~/Git/Linux-Stuff/Arch-Stuff
cp -r ~/.config/qutebrowser ~/Git/Linux-Stuff/Arch-Stuff
cp ~/.vimrc ~/Git/Linux-Stuff/Arch-Stuff

# Copying local code and scripts into their respective repo folders
cp ~/Scripts/linux-stuff-backup.sh ~/Git/Linux-Stuff/Code

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

# Bob Dobbs respects the 5-10 minutes of slack you've gained back by using this script

cat << "EOF"
@@@@@@@^^~~~~~~~~~~~~~~~~~~~~^^@@@@@@@@
@@@@@@^     ~^  @  @@ @ @ @ I  ~^@@@@@@
@@@@@            ~ ~~ ~I          @@@@@
@@@@'                  '  _,w@<    @@@@
@@@@     @@@@@@@@w___,w@@@@@@@@  @  @@@
@@@@     @@@@@@@@@@@@@@@@@@@@@@  I  @@@
@@@@     @@@@@@@@@@@@@@@@@@@@*@[ i  @@@
@@@@     @@@@@@@@@@@@@@@@@@@@[][ | ]@@@
@@@@     ~_,,_ ~@@@@@@@~ ____~ @    @@@
@@@@    _~ ,  ,  `@@@~  _  _`@ ]L  J@@@
@@@@  , @@w@ww+   @@@ww``,,@w@ ][  @@@@
@@@@,  @@@@www@@@ @@@@@@@ww@@@@@[  @@@@
@@@@@_|| @@@@@@P' @@P@@@@@@@@@@@[|c@@@@
@@@@@@w| '@@P~  P]@@@-~, ~Y@@^'],@@@@@@
@@@@@@@[   _        _J@@Tk     ]]@@@@@@
@@@@@@@@,@ @@, c,,,,,,,y ,w@@[ ,@@@@@@@
@@@@@@@@@ i @w   ====--_@@@@@  @@@@@@@@
@@@@@@@@@@`,P~ _ ~^^^^Y@@@@@  @@@@@@@@@
@@@@^^=^@@^   ^' ,ww,w@@@@@ _@@@@@@@@@@
@@@_xJ~ ~   ,    @@@@@@@P~_@@@@@@@@@@@@
@@   @,   ,@@@,_____   _,J@@@@@@@@@@@@@
@@L  `' ,@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
EOF

echo "Good job kid!"
