#!/bin/bash

VPN_NAME="shiro"  # Replace with your VPN connection name

VPN_STATUS=$(nmcli connection show --active | grep -w "$VPN_NAME")

if [ -n "$VPN_STATUS" ]; then
    # Disconnect if VPN is active
    nmcli connection down "$VPN_NAME"
    echo "VPN disconnected"
else
    # Connect if VPN is not active
    nmcli connection up "$VPN_NAME"
    echo "VPN connected"
fi

