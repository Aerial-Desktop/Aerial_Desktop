def get_directory()
  directory = File.dirname(__FILE__)
end
  `cd "#{DIR}";
  #works
  #svn checkout https://github.com/MichaelDimmitt/sc/trunk/KPSaver.saver;
  #screen_saver=KPSaver.saver;
  #svn checkout https://github.com/MichaelDimmitt/sc/trunk/Aerial.saver;
  #screen_saver=Aerial.saver;
  #svn checkout https://github.com/MichaelDimmitt/sc/trunk/FractalClock.saver;
  #screen_saver=FractalClock.saver;
  #svn checkout https://github.com/MichaelDimmitt/sc/trunk/MarineAquarium3.2.saver;
  #screen_saver=MarineAquarium3.2.saver;
  #svn checkout https://github.com/MichaelDimmitt/sc/trunk/MatrixScreenSaver.saver;
  #screen_saver=MatrixScreenSaver.saver;
  svn checkout https://github.com/MichaelDimmitt/sc/trunk/StarWarsScroll.saver;
  screen_saver=StarWarsScroll.saver;
  #svn checkout https://github.com/MichaelDimmitt/sc/trunk/WhatColourIsIt.saver;
  #screen_saver=WhatColourIsIt.saver;
  #svn checkout https://github.com/MichaelDimmitt/sc/trunk/WordClock.saver;
  #screen_saver=WordClock.saver
  #svn checkout https://github.com/MichaelDimmitt/sc/trunk/BlueScreenSaver.saver;
  #screen_saver=BlueScreenSaver.saver

  #not working
  #svn checkout https://github.com/MichaelDimmitt/sc/trunk/EpochFlipClock.saver;
  #screen_saver=EpochFlipClock.saver



##############################stays######if !screen_saver empty
  mv $DIR/$screen_saver $DIR/../../bin/$screen_saver
  open $DIR/../../bin/$screen_saver
# run aerial application
  if [ -d ~/Library/Screen\ Savers/$screen_saver ] || [ -d /Library/Screen\ Savers/$screen_saver ] ; then
    echo "File exists."
  else
    # svn checkout https://github.com/MichaelDimmitt/sc/trunk/KPSaver.saver;
    #open $DIR/../../bin/Aerial.saver/
    #`open $DIR/../../bin/Word\ Clock.saver/
    #open $DIR/../../bin/$screen_saver/
    open $DIR/../../bin/$screen_saver
  fi
    open $DIR/../../bin/$screen_saver`
