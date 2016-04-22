#!/bin/bash
if curl -s --head  --request GET http://www.mu-podcast.com | grep "200 OK" > /dev/null
then
  echo "something is wrong"
  curl --header 'Access-Token: $access_token' \
       --header 'Content-Type: application/json' \
       --data-binary '{"body":"This is a test. http://www.mu-podcast.com","title":"MUP is Down!!!","type":"note"}' \
       --request POST \
       https://api.pushbullet.com/v2/pushes

else
  echo "The server is up." >> /dev/null
fi
