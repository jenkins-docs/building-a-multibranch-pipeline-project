##!/usr/bin/env sh
#!/bin/bash
echo 'TTTTTTTTTTTTTTTTTTTTTTTTTTThe following command terminates the "npm start" process using its PID'
echo '(written to ".pidfile"), all of which were conducted when either'
echo '"deliver-for-development.sh" or "deliver-for-development.sh" was executed.'
#set -x
#kill $(cat .pidfile)
ssh -i /home/.ssh/jenkins_rsa root@35.194.253.9 'mkdir /home/GitHub'
