  folder = "/System/Library/Frameworks/ScreenSaver.framework/Resources"
    Dir.chdir("#{folder}") do |i|
      `./ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background`
    end
