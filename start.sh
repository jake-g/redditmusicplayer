#!/bin/bash
# Start server and open it

cd ~/Dropbox/projects/Javascript/redditmusicplayer

redis-server &
echo "~ redis server up ~"

if [ "$1" == "-u" ]; then
echo "~ Updating ~"
	git pull
	npm install
	grunt build
elif ["$1" == "-h" ]; then
	echo "-u to update, otherwise no args"
fi

echo "~ reddit server up ~"
NODE_ENV=production npm start

open -a safari http://localhost:4008

