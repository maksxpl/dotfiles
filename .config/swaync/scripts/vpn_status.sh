#!/bin/bash

VPN_NAME="shiro"  # Replace with your VPN connection name

if nmcli connection show --active | grep -w "$VPN_NAME" > /dev/null; then
    echo true
else
    echo false
fi

