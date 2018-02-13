## it would be beneficial to write all expected outputs.
1) `open .hide/bin/Installer.app/ --args Aerial`
<br>"opens the application" 
<br>... allowing install if needed.
<br>now user is gaurenteed to have saver. and expect it is showing on desktop.
<br>closes out of system preferences.
<br>notifies the user with a notification ... of success or failure.
<br>now for the fun part!
2) checks to see if user is connected to the internet. 
<br>does not show screensaver until connected to the internet.
3) checks to see if users battery is below 20 percent uncharged or 40 percent charged.
4) correctly identifies if user is on desktop mac computer or macbook laptop computer.
<br>battery check does not take effect if user is on a desktop computer as it is not needed.
5) disables completely if user (sleeps computer/closes laptop) multiple times. within 60 seconds.
6) application stops when script `open .hide/bin/Stop.app/` is executed.
