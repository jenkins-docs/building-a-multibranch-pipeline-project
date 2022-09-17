#!/usr/bin/env sh

echo 'The following command terminates the "npm start" process using its PID'
echo '(written to ".pidfile"), all of which were created when either'
echo '"deliver-for-development.sh" or "deliver-for-development.sh" was executed.'
set -x
kill $(cat .pidfile)
pkill npm
exit 0
