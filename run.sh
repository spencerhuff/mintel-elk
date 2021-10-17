#!/bin/sh
docker-compose up -d
sleep 120 # wait 2 minutes for the stack to initialize before sending log data
curl -L -k https://github.com/mintel/sre-interview-assets/blob/master/challenges/challenge_01_docker_elk_apache_logs/WEB_access_log.log.gz?raw=true | gzip -d | nc -c localhost 5000