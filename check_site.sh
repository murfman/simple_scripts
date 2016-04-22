##!/bin/bash
# script to check if my website is up and then to notify me via Pushbullet if it isn't.
# Requires a file called push.token in the folder above that only holds a single line with your PushBullet API in it.

# Read the token from filters
FILE=../push.token
line=`cat ../push.token`
#echo "$line"

# curl call to check if site is up
if curl -s --head  --request GET http://www.mu-podcast.com | grep "200 OK" > /dev/null
then
      echo "The server is up." >> /dev/null
else # send notification push to PushBullet to let me know it is down.
  echo "something is wrong"
  curl --header "Access-Token: ${line}" \
       --header 'Content-Type: application/json' \
       --data-binary '{"body":"MUP is down! http://www.mup-podcast.com","title":"MUP is Down!!!","type":"note"}' \
       --request POST \
       https://api.pushbullet.com/v2/pushes
fi


# Testing section
#
# if curl -s --head  --request GET http://www.mu-podcast.com | grep "200 OK" > /dev/null
# then
#   curl --header "Access-Token: ${line}" \
#        --header 'Content-Type: application/json' \
#        --data-binary '{"body":"This is a Test! http://www.mup-podcast.com","title":"JUST a TEST!!!","type":"note"}' \
#        --request POST \
#        https://api.pushbullet.com/v2/pushes
# else # send notification push to PushBullet to let me know it is down.
#    echo "something is wrong"
#    curl --header 'Access-Token: $line' \
#         --header 'Content-Type: application/json' \
#         --data-binary '{"body":"MUP is down! http://www.mup-podcast.com","title":"MUP is Down!!!","type":"note"}' \
#         --request POST \
#         https://api.pushbullet.com/v2/pushes
# fi
