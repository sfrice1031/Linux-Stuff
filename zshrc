#######################################
#             ZSH RC File             #
#           By Psych0Shawn0           #
#         sfrice1031@gmail.com        #
#######################################

# Path to your oh-my-zsh installation.
  export ZSH=/home/sfrice1031/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="bira"

# Uncomment the following line to display red dots whilst waiting for completion.
#  COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git extract)

# User configuration

 export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"

# export MANPATH="/usr/local/man:$MANPATH"

 source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#RVM

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

# Rip Audio from the Web #  
  netrip() { youtube-dl -c --restrict-filenames --extract-audio --audio-format mp3 -o "%(title)s.%(ext)s" $@ ;}

# System Update #
  alias pacupdate="sudo pacman -Syu"


####################
# Transmission CLI #
####################

# WebUI:	http://localhost:9091/transmission/web/
# 		http://192.168.1.xxx:9091/transmission/web/

 tsm-clearcompleted() {
        transmission-remote -l | grep 100% | grep Done | \
        awk '{print $1}' | xargs -n 1 -I % transmission-remote -t % -r ;}
 tsm() { transmission-remote --list ;}
	# numbers of ip being blocked by the blocklist
	# credit: smw from irc #transmission
 tsm-count() { echo "Blocklist rules:" $(curl -s --data \
	'{"method": "session-get"}' localhost:9091/transmission/rpc -H \
	"$(curl -s -D - localhost:9091/transmission/rpc | grep X-Transmission-Session-Id)" \
	| cut -d: -f 11 | cut -d, -f1) ;}
# tutorial video: http://www.youtube.com/watch?v=TyDX50_dC0M
 tsm-blocklist() { ~/.scripts/blocklist.sh ;}		# update blocklist
 tsm-daemon() { transmission-daemon ;}
 tsm-quit() { killall transmission-daemon ;}
 tsm-altdownloadspeed() { transmission-remote --downlimit "${@:-900}" ;}	# upload default to 900K, else enter your own
 tsm-altdownloadspeedunlimited() { transmission-remote --no-downlimit ;}	
 tsm-limitupload() { transmission-remote --uplimit "${@:-10}" ;}	# upload default to 10kpbs, else enter your own
 tsm-limituploadunlimited() { transmission-remote --no-uplimit ;}
 tsm-add() { transmission-remote --add "$1" ;}
 tsm-askmorepeers() { transmission-remote -t"$1" --reannounce ;}
 tsm-pause() { transmission-remote -t"$1" --stop ;}		# <id> or all
 tsm-start() { transmission-remote -t"$1" --start ;}		# <id> or all
 tsm-purge() { transmission-remote -t"$1" --remove-and-delete ;} # delete data also
 tsm-remove() { transmission-remote -t"$1" --remove ;}		# leaves data alone
 tsm-info() { transmission-remote -t"$1" --info ;}
 tsm-speed() { while true;do clear; transmission-remote -t"$1" -i | grep Speed;sleep 1;done ;}
 tsm-grep() { transmission-remote --list | grep -i "$1" ;}
