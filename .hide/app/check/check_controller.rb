#!/bin/bash

`adaptive_wait () {
TIMEOUT=25
  until [ -d ~/Library/Screen\ Savers/Aerial.saver ] || [ -d /Library/Screen\ Savers/Aerial.saver ] || [ $TIMEOUT -eq 0 ] ; do
    if ! ((TIMEOUT % 5)); then
    osascript -e 'display notification "To allow for Decision/User Credentials" with title "Application Waiting"'
    fi
    sleep 1
    TIMEOUT=$[$TIMEOUT-1]
  done
}`


