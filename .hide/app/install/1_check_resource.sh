# !/bin/bash
screensaver=$1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# run aerial application
  if [ -d ~/Library/Screen\ Savers/$screensaver ]  
  then
    open ~/Library/Screen\ Savers/$screensaver 
  elif [ -d /Library/Screen\ Savers/$screensaver ]
  then 
    open /Library/Screen\ Savers/$screensaver 
  else
    open $DIR/../../bin/$screensaver
  fi
