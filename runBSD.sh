#!/bin/sh
# Using BSD netcat (Debian, Ubuntu, MacOS system, ...)
. .env
docker-compose up -d
sleep 120 # wait 2 minutes for the stack to initialize before sending log data
curl -L -k $URL_LOG_RAW | gzip -d | nc -q0 localhost 5000