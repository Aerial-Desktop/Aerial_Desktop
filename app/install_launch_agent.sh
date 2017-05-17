# !/bin/bash

# write out path needed
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $DIR

pwd2="              <string>$DIR/./DesktopBackgroundChanger.app/Contents/Resources/script</string>"
echo $pwd2
# insert path needed into correct file.
# line 9 in com.example.hello.plist
sed -i '' '9s?.*?'"$pwd2"'?' $DIR/com.example.hello.plist

# change environment appropriately
chmod 644 $DIR/com.example.hello.plist

cp $DIR/com.example.hello.plist ~/Library/LaunchAgents/

launchctl load ~/Library/LaunchAgents/com.example.hello.plist
