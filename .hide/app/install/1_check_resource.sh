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
    curl -L -O https://github.com/MichaelDimmitt/sc/blob/zip/$screensaver.zip?raw=true
    mv $screensaver.zip* $screensaver.zip
    unzip $screensaver.zip 
    open $screensaver
  fi
