. ./env
while [ 1 ]; do
	#echo "waiting for message"
	reload=`mosquitto_sub -h $MQTT_HOST -t reload -p $MQTT_PORT -u $MQTT_USER -P $MQTT_PASSWORD -C 1`
	if [ "$reload" = "reload" ]; then
		#echo "reloading"
		DISPLAY=:0 xdotool search --onlyvisible --class Chrome windowfocus key ctrl+r
	fi
	sleep 1
done
