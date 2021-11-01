BASEDIR=$(dirname "$0")

. $BASEDIR/env
HOSTNAME=`hostname`

sendmsg()
{
	mosquitto_pub -h $MQTT_HOST -t message/$HOSTNAME -p $MQTT_PORT -u $MQTT_USER -P $MQTT_PASSWORD -m "$1"
}


sendmsg "listening"

while [ 1 ]; do
	#echo "waiting for message"
	command=`mosquitto_sub -h $MQTT_HOST -t command -p $MQTT_PORT -u $MQTT_USER -P $MQTT_PASSWORD -C 1`
	if [ "$command" = "reload" ]; then
		sendmsg "reloading"
		#echo "reloading"
		DISPLAY=:0 xdotool search --onlyvisible --class Chrome windowfocus key ctrl+r
	elif [ "$command" = "pull" ]; then
		sendmsg "pulling from github"
		(cd $BASEDIR ; git pull)
	elif [ "$command" = "ping" ]; then
		sendmsg "pong"
	elif [ "$command" = "reboot" ]; then
		sendmsg "rebooting"
		sudo reboot
	fi
	sleep 1
done
