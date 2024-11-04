#!/bin/bash

VPN_NAME="shiro"
VPN_STATUS=$(nmcli connection show --active | grep -w "$VPN_NAME")
if [ -n "$VPN_STATUS" ]; then
    STATUS="connected"
else
    STATUS="disconnected"
fi

echo "{\"text\": \"$STATUS\"}"
