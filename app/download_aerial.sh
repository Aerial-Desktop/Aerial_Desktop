# !/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# run aerial application
  if [ -d ~/Library/Screen\ Savers/Aerial.saver ] || [ -d /Library/Screen\ Savers/Aerial.saver ] ; then
    echo "File exists."
  else
    open $DIR/../bin/Aerial.saver/
    sleep 5
    osascript -e 'display notification "To allow for User decision/credentials" with title "Application Waiting ten seconds"'
    sleep 5
  fi
