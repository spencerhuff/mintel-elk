#!/bin/sh
# Using GNU netcat (CentOS, Fedora, MacOS Homebrew, ...)
. .env
docker-compose up -d
sleep 120 # wait 2 minutes for the stack to initialize before sending log data
curl -L -k $URL_LOG_RAW | gzip -d | nc -c localhost 5000