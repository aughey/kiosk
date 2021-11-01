export DISPLAY=:0

while [ 1 ]; do
	xset s off
	xset s noblank
	xset -dpms
	sleep 5
done
