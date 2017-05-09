# !/bin/bash

# write out path needed
# pwd=$PWD
pwd2="              <string>$DIR/./DesktopBackgroundChanger.app/Contents/Resources/script</string>"
echo $pwd2

# insert path needed into correct file.
# line 9 in com.example.hello.plist
sed -i '' '9s?.*?'"$pwd2"'?' $pwd/com.example.hello.plist

# change environment appropriately
chmod 644 $DIR/com.example.hello.plist

cp $DIR/com.example.hello.plist ~/Library/LaunchAgents/

launchctl load ~/Library/LaunchAgents/com.example.hello.plist
