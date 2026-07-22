#!/usr/bin/env bash

interface=$(ip -4 route show default | awk '$1 == "default" { print $5; exit }')
private_ip=""

if [[ -n "$interface" ]]; then
    private_ip=$(ip -4 -o address show dev "$interface" scope global 2>/dev/null |
        awk '{ split($4, address, "/"); print address[1]; exit }')
fi

if ip link show nordlynx 2>/dev/null | grep -qE '<[^>]*\bUP\b'; then
    vpn_status="VPN ON"
else
    vpn_status="VPN OFF"
fi

if [[ -n "$private_ip" ]]; then
    printf '%s | IP %s\n' "$vpn_status" "$private_ip"
else
    printf '%s\n' "$vpn_status"
fi
