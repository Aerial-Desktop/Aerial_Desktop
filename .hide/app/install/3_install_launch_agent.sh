# !/bin/bash

# write out path needed
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $DIR

#create .tmp file
mkdir $DIR/.tmp
cp $DIR/com.example.hello.plist $DIR/.tmp/com.example.hello.plist
cp $DIR/com.example.charg.plist $DIR/.tmp/com.example.charg.plist

# create the string needed.
pwd2="              <string>$DIR/./DesktopBackgroundChanger.app/Contents/Resources/script</string>"
pwd3="              <string>$DIR/./battery_check.sh</string>"
echo $pwd2
# insert path needed into correct file.
# line 9 in com.example.hello.plist
sed -i '' '9s?.*?'"$pwd2"'?' $DIR/.tmp/com.example.hello.plist
sed -i '' '9s?.*?'"$pwd3"'?' $DIR/.tmp/com.example.charg.plist

# change environment appropriately
chmod 644 $DIR/.tmp/com.example.hello.plist
chmod 645 $DIR/.tmp/com.example.charg.plist

cp $DIR/.tmp/com.example.hello.plist ~/Library/LaunchAgents/
cp $DIR/.tmp/com.example.charg.plist ~/Library/LaunchAgents/

launchctl load ~/Library/LaunchAgents/com.example.hello.plist
launchctl load ~/Library/LaunchAgents/com.example.charg.plist
