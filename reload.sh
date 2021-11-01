. ./env
while [ 1 ]; do
	reload=`mosquitto_sub -h www.washucsc.org -t reload -p 3001 -u $MQTT_USER -P $MQTT_PASSWORD -C 1`
	if [ "$reload" = "reload" ]; then
		DISPLAY=:0 xdotool search --onlyvisible --class Chrome windowfocus key ctrl+r
	fi
	sleep 1
done
