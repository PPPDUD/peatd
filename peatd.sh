#!/usr/bin/bash
function handle_kill() {
	echo Exiting!
	trap - SIGTERM SIGINT EXIT
	kill -- -$$
	exit
}

function run-ttyd() {
	command="viewadsb"
	for i in "${BEAST_CONNECTIONS[@]}"; do
		command+=" --net-connector $i"
	done
	ttyd -p "$TTYD_PORT" -t 'theme={"background": "black", "foreground":"white"}' $command &
}

source /etc/peatd/.env
if [[ $USE_TTYD == "true" && $USE_READSB == "true" ]]; then
	echo "Running readsb server on port $BEAST_PORT_OUT."
	readsb --device-type "$DEVICE_TYPE" --net --net-bo-port="$BEAST_PORT_OUT" &
	readsb_pid=$!
	echo $readsb_pid
	trap handle_kill SIGTERM SIGINT EXIT
	echo "Running ttyd server on port $TTYD_PORT."
	run-ttyd
	wait -n

elif [[ $USE_TTYD == "true" ]]; then
	echo "Running ttyd server on port $TTYD_PORT."
	run-ttyd
	wait

elif [[ $USE_READSB == "true" ]]; then
	echo "Running readsb server on port $BEAST_PORT_OUT."
	readsb --device-type "$DEVICE_TYPE" --net --net-bo-port="$BEAST_PORT_OUT"

else
	echo "No services were requested. Exiting."
fi
