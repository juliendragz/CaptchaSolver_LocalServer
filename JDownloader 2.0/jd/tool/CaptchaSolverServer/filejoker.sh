#!/bin/bash

SERVER_URL="http://localhost:5050/solve?host=filejoker.net"

file="/share/result.txt"
[ -e "$file" ] && rm "$file"
sleep 1

curl "${SERVER_URL}"

while [ ! -e "$file" ]; do
    sleep 1
done

sleep 1