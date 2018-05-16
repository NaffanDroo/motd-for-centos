#!/bin/bash

#check for updates
UPDATES_COUNT=$(yum check-update --quiet | grep -v "^$" | wc -l)
UPDATES=$(yum list updates)

if [[ $UPDATES_COUNT -gt 0 ]];
then

  # we have updates; record to motd
  echo "echo \"${UPDATES_COUNT} Updates available\"" > /etc/update-motd.d/90-updates-available

  # and send root a message
  echo "$UPDATES" | mail -s "${UPDATES_COUNT} Updates available for $(hostname)" root
  # root destination is altered via /etc/aliases

else

  echo "echo \"System is up to date\"" > /etc/update-motd.d/90-updates-available

fi
