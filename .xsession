export LC_CTYPE="en_US.UTF-8"
export ENV=$HOME/.kshrc

redshift -l -33:-58 -m randr -v &
xset r rate 300 50 &
xbanish &

setxkbmap -layout us -variant intl -option ctrl:nocaps
xrdb -merge $HOME/.Xdefaults

fvwm
