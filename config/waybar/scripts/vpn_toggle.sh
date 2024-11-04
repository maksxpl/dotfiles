#!/bin/bash

VPN_NAME="shiro"
VPN_STATUS=$(nmcli connection show --active | grep -w "$VPN_NAME")

if [ -n "$VPN_STATUS" ]; then
    nmcli connection down "$VPN_NAME"
else
    nmcli connection up "$VPN_NAME"
fi

pkill -SIGRTMIN+10 waybar
