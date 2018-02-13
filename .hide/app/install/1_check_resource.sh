# !/bin/bash
screensaver=$1
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# run aerial application
  if [ -d ~/Library/Screen\ Savers/$screensaver ] || [ -d /Library/Screen\ Savers/$screensaver ] ; then
    echo "File exists."
  else
    open $DIR/../../bin/$screensaver/
  fi
