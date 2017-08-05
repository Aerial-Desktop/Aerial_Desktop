#require_relative '../screensaver/screensaver_controller.rb'
#require_relative '../check/check_controller.rb'
#require_relative '../notifications/notification_controller.rb'
#require_relative '../launch_agent/launch_agent_controller.rb'
#class InstallController
  #  CheckController.adaptive_wait()
  # to do... everything should be refactored into module's
  # the state for this application is the macintosh environment.
# screensaver_controller  = ScreensaverController.new
# check_controller  = CheckController.new
# notification_controller  = NotificationController.new
# launch_agent_controller  = LaunchAgentController.new


# screensaver_controller.change_screensaver()
# check_controller.notify_while_adaptive_wait() # will call a method in notification.
# notification_controller.tell_what_happened()
# launch_agent_controller.setup_and_load()
#end
class InstallController
  def local_screensaver_exists(saver_location, saver_name)
    "~/#{SAVER_LOCATION}/#{saver_name}"
  end # test should send empty saver name or demo ... and match manually typed
  def root_screensaver_exists(saver_location, saver_name)
    "/#{SAVER_LOCATION}/#{saver_name}"
  end # test should send empty saver name or demo ... and match manually typed
end
SAVER_LOCATION = 'Library/LaunchAgents'
install_controller = InstallController.new
puts install_controller.local_screensaver_exists SAVER_LOCATION, 'Aerial.saver'
puts install_controller.root_screensaver_exists  SAVER_LOCATION, 'Aerial.saver'



  def setup_and_load()
`DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LA=$DIR
SE=$DIR/../../bin

echo $DIR


#create .tmp file
mkdir $LA/.tmp
cp $LA/com.example.hello.plist $LA/.tmp/com.example.hello.plist

# create the string needed.
pwd2="              <string>$SE/./screensaver_engine.app/Contents/Resources/script</string>"
echo $pwd2
# insert path needed into correct file.
# line 9 in com.example.hello.plist
sed -i '' '9s?.*?'"$pwd2"'?' $LA/.tmp/com.example.hello.plist

# change environment appropriately
chmod 644 $LA/.tmp/com.example.hello.plist

cp $LA/.tmp/com.example.hello.plist ~/Library/LaunchAgents/

launchctl load ~/Library/LaunchAgents/com.example.hello.plist`
  end
  def tell_what_happened()
`if [ -d ~/Library/Screen\ Savers/Aerial.saver ] ; then
  defaults -currentHost write com.apple.screensaver modulePath -string "/System/Library/Screen Savers/Shell.saver"; defaults -currentHost write com.apple.screensaver moduleName -string "Shell"; defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Shell path /System/Library/Screen\ Savers/Shell.saver/ type 0;
  defaults -currentHost write com.apple.screensaver modulePath -string "~/Library/Screen\ Savers/Aerial.saver"; defaults -currentHost write com.apple.screensaver moduleName -string "Aerial";defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Aerial path ~/Library/Screen\ Savers/Aerial.saver type 0;
  osascript -e 'display notification "Installed for this user only, enjoy." with title "Success, Aerial Desktop"'
elif [ -d /Library/Screen\ Savers/Aerial.saver ] ; then
  defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Aerial path /Library/Screen\ Savers/Aerial.saver type 0
  osascript -e 'display notification "Installed for all users, enjoy." with title "Success, Aerial Desktop"'
else
  osascript -e 'display notification "Did you put your credentials? Uninstall and reinstall, thanks." with title "error 333 Aerial Desktop"'
fi`
  end
  def notify_while_adaptive_wait()
`TIMEOUT=25
  until [ -d ~/Library/Screen\ Savers/Aerial.saver ] || [ -d /Library/Screen\ Savers/Aerial.saver ] || [ $TIMEOUT -eq 0 ] ; do
    if ! ((TIMEOUT % 5)); then
    osascript -e 'display notification "To allow for Decision/User Credentials" with title "Application Waiting"'
    fi
    sleep 1
    TIMEOUT=$[$TIMEOUT-1]
  done`
  end

def change_screensaver()
`DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# run aerial application
  if [ -d ~/Library/Screen\ Savers/Aerial.saver ] || [ -d /Library/Screen\ Savers/Aerial.saver ] ; then
    echo "File exists."
  else
    open $DIR/../../bin/Aerial.saver/
  fi`
  end
# end
# InstallController.new.notify_while_adaptive_wait()
