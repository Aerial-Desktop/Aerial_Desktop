# !/bin/bash

# write out path needed
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DIR=$DIR/../../bin
echo $DIR


#create .tmp file
mkdir $DIR/.tmp
cp $DIR/com.example.hello.plist $DIR/.tmp/com.example.hello.plist

# create the string needed.
pwd2="              <string>$DIR/./screensaver_engine.app/Contents/Resources/script</string>"
echo $pwd2
# insert path needed into correct file.
# line 9 in com.example.hello.plist
sed -i '' '9s?.*?'"$pwd2"'?' $DIR/.tmp/com.example.hello.plist

# change environment appropriately
chmod 644 $DIR/.tmp/com.example.hello.plist

cp $DIR/.tmp/com.example.hello.plist ~/Library/LaunchAgents/

launchctl load ~/Library/LaunchAgents/com.example.hello.plist
