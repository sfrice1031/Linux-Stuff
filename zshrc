#######################################
#             ZSH RC File             #
#           By Psych0Shawn0           #
#         sfrice1031@gmail.com        #
#######################################

# Path to your oh-my-zsh installation #
  export ZSH=/home/sfrice1031/.oh-my-zsh

# Set name of the theme to load #
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="bira"

# Uncomment the following line to display red dots whilst waiting for completion #
  COMPLETION_WAITING_DOTS="true"

# Create another custom folder #
# ZSH_CUSTOM=/path/to/new-custom-folder

# Oh My ZSH Plugins (plugins can be found in ~/.oh-my-zsh/plugins/*) #
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git)

# User configuration #

 export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"

# export MANPATH="/usr/local/man:$MANPATH" #

 source $ZSH/oh-my-zsh.sh

# SSH #
# export SSH_KEY_PATH="~/.ssh/dsa_id" 

# RVM #

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"


######################################
#               Aliases              #             
######################################


###########
# Configs #
###########
  alias cfg-AwesomeWM="vim ~/.config/awesome/rc.lua"
  alias cfg-ZSHrc="vim ~/.zshrc"
  alias cfg-ohmyZSH="vim ~/.oh-my-zsh"
  alias cfg-Xresources="vim ~/.Xresources"
  alias cfg-AwesomeTHEME="sudo vim /usr/share/awesome/themes/shawnburn/theme.lua"
  alias cfg-VIM="vim ~/.vimrc"
  alias cfg-RangerFM="vim ~/.config/ranger/rc.conf"

#####################
# Command Functions #
#####################

# Clear Screen #
 alias c="clear"

# YouTube to MP3 #
# requires youtube-dl & ffmpeg to be installed #  
 ytmp3() { youtube-dl -c --restrict-filenames --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" $@ ;}

# Extract compressed files #
 function extract {
  if [ -z "$1" ]; then
     # display usage if no parameters given
     echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
     if [ -f $1 ] ; then
         # NAME=${1%.*}
         # mkdir $NAME && cd $NAME
         case $1 in
           *.tar.bz2)   tar xvjf ../$1    ;;
           *.tar.gz)    tar xvzf ../$1    ;;
           *.tar.xz)    tar xvJf ../$1    ;;
           *.lzma)      unlzma ../$1      ;;
           *.bz2)       bunzip2 ../$1     ;;
           *.rar)       unrar x -ad ../$1 ;;
           *.gz)        gunzip ../$1      ;;
           *.tar)       tar xvf ../$1     ;;
           *.tbz2)      tar xvjf ../$1    ;;
           *.tgz)       tar xvzf ../$1    ;;
           *.zip)       unzip ../$1       ;;
           *.Z)         uncompress ../$1  ;;
           *.7z)        7z x ../$1        ;;
           *.xz)        unxz ../$1        ;;
           *.exe)       cabextract ../$1  ;;
           *)           echo "extract: '$1' - unknown archive method" ;;
         esac
     else
         echo "$1 - file does not exist"
     fi
 fi
 }
