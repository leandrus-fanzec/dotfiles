export LC_CTYPE="en_US.UTF-8"
export ENV=$HOME/.kshrc

redshift -l -33:-58 -m randr -v &
xset r rate 300 50 &
xbanish &

setxkbmap -layout us -variant intl -option ctrl:nocaps
xwallpaper --zoom /home/lucas/.src/openbsd-wallpapers/dall-e3/openBSD_wall_dalle3_lpaz.png
xrdb -merge $HOME/.Xdefaults

xinput set-prop 7 'Device Accel Constant Deceleration' 0.3

while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
do
	sleep 1
done &

dwm
