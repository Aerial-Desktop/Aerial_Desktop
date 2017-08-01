# !/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# run aerial application
aerial_saver="/Library/Screen\ Savers/Aerial.saver"
  if [ -d ~$aerial_saver ] || [ -d $aerial_saver ] ; then
    echo "File exists."
  else
    open $DIR/../../bin/Aerial.saver/
  fi
