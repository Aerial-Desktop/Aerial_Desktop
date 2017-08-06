# !/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# run aerial application
  if [ -d ~/Library/Screen\ Savers/Aerial.saver ] || [ -d /Library/Screen\ Savers/Aerial.saver ] ; then
    echo "File exists."
  else
    open $DIR/../../bin/Aerial.saver/
  fi
