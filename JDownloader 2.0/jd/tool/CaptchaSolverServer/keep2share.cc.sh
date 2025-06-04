#!/bin/bash

# URL de ton serveur CaptchaSolver
SERVER_URL="http://localhost:5050/solve?host=keep2share.cc"

file="/share/result.txt"
[ -e "$file" ] && rm "$file"
sleep 1

curl "${SERVER_URL}"

while [ ! -e "$file" ]; do
    sleep 1
done

sleep 1
