export DISPLAY=:0

xset s off
xset -dpms

while [ 1 ]; do
  killall -w unclutter
  killall -w chromium-browser
  unclutter &
  chromium-browser --temp-profile -kiosk 'https://docs.google.com/presentation/d/e/2PACX-1vQms_iW5THtj9sQPx1PPzueQofifFHnoA8UM0G97XmyTXnrcoSAMW9Bd_2NptybVkqYLpYHRhpWGYAa/pub?start=true&loop=true&delayms=10000'
done

