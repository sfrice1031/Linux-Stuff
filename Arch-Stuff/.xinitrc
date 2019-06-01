[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

compton &

# dwm startup script #
feh --randomize --bg-fill ~/Pictures/Wallpapers/* &
slstatus &
exec dwm

# i3wm Settings #
# exec i3
