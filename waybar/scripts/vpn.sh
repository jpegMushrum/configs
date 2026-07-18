#!/bin/bash

if ip -o link show | awk -F': ' '{print $2}' | grep -q 'tun'; then
	echo '{"text":"󰖂 ","class":"connected"}'
else
	echo '{"text":"","class":"disconnected"}'
fi
