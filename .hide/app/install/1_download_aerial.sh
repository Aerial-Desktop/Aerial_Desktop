# !/bin/bash

  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
  cd $DIR;
  #svn checkout https://github.com/MichaelDimmitt/sc/trunk/Aerial.saver;
  #svn checkout https://github.com/MichaelDimmitt/sc/trunk/Blue Screen Saver.saver;
  #svn checkout https://github.com/MichaelDimmitt/sc/trunk/Epoch%20Flip%20Clock.saver;
  #svn checkout https://github.com/MichaelDimmitt/sc/trunk/FractalClock.saver;
  #svn checkout https://github.com/MichaelDimmitt/sc/trunk/KPSaver.saver;
  #svn checkout https://github.com/MichaelDimmitt/sc/trunk/MarineAquarium3.2.saver;
  #svn checkout https://github.com/MichaelDimmitt/sc/trunk/MatrixScreenSaver.saver;
  #svn checkout https://github.com/MichaelDimmitt/sc/trunk/StarWarsScroll.saver;
  #svn checkout https://github.com/MichaelDimmitt/sc/trunk/WhatColourIsIt.saver;
  svn checkout https://github.com/MichaelDimmitt/sc/trunk/Word%20Clock.saver;
  screen_saver=Word\ Clock.saver/
  say $screen_saver   
  # mv $DIR/$screen_saver $DIR/../../bin/$screen_saver
  # mv Aerial.saver $DIR/../../bin/Aerial.saver;
   mv Aerial.saver $DIR/../../bin/Word\ Clock.saver/;
# run aerial application
  if [ -d ~/Library/Screen\ Savers/$screen_saver ] || [ -d /Library/Screen\ Savers/$screen_saver ] ; then
    echo "File exists."
  else
    # svn checkout https://github.com/MichaelDimmitt/sc/trunk/KPSaver.saver;
    #open $DIR/../../bin/Aerial.saver/
    open $DIR/../../bin/Word\ Clock.saver/
    #open $DIR/../../bin/$screen_saver/
  fi
