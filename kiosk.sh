export DISPLAY=:0

export URL='https://docs.google.com/presentation/d/e/2PACX-1vRloaV-I9H6O0gGfr2P6PAssAG0tOVbdsQ3lU5MdAksuE0YhPJ757kCX3CREAmB_ummgNU8jycO_XBz/pub?start=true&loop=true&delayms=10000'

sh /home/pi/src/kiosk/keepon.sh &
sh /home/pi/src/kiosk/message_handler.sh &

while [ 1 ]; do
  killall -w unclutter
  killall -w chromium-browser
  unclutter &
  chromium-browser --temp-profile -kiosk "$URL"
done

