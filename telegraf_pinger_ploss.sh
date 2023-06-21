#!/bin/sh

timestamp=$(date +%s)000000000

output=$(ping -c 1 1.1.1.1)

packet_loss=$(echo "$output" | sed -nE 's/.*([0-9.]+)% packet loss.*/\1/p')
average_ping=$(echo "$output" | sed -nE 's/.*round-trip min\/avg\/max\/stddev = ([0-9.]+)\/([0-9.]+)\/([0-9.]+)\/([0-9.]+) ms.*/\2/p')

if [ -n "$packet_loss" ] && [ -n "$average_ping" ]; then
  echo "netchecker,ip=1.1.1.1,host=$(hostname) ping=$average_ping,loss=$packet_loss $timestamp"
fi

output=$(ping -c 1 8.8.8.8)

packet_loss=$(echo "$output" | sed -nE 's/.*([0-9.]+)% packet loss.*/\1/p')
average_ping=$(echo "$output" | sed -nE 's/.*round-trip min\/avg\/max\/stddev = ([0-9.]+)\/([0-9.]+)\/([0-9.]+)\/([0-9.]+) ms.*/\2/p')

if [ -n "$packet_loss" ] && [ -n "$average_ping" ]; then
  echo "netchecker,ip=8.8.8.8,host=$(hostname) ping=$average_ping,loss=$packet_loss $timestamp"
fi
