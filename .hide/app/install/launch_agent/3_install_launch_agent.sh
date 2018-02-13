# !/bin/bash
screen=$1
saver='.saver'

# write out path needed
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $DIR

#create .tmp file
mkdir $DIR/.tmp
cp $DIR/com.desktop.$screen.plist $DIR/.tmp/com.desktop.$screen.plist
cp $DIR/com.monitor.charge.plist $DIR/.tmp/com.monitor.charge.plist

# create the string needed.
pwd2="              <string>$DIR/./../4_desktop_background_changer.sh</string>"
pwd3="              <string>$DIR/./battery_check.sh</string>"
echo $pwd2
# insert path needed into correct file.
# line 9 in com.$screen.desktop.plist
sed -i '' '9s?.*?'"$pwd2"'?' $DIR/.tmp/com.desktop.$screen.plist
sed -i '' '9s?.*?'"$pwd3"'?' $DIR/.tmp/com.monitor.charge.plist

# change environment appropriately
chmod 644 $DIR/.tmp/com.desktop.$screen.plist
chmod 645 $DIR/.tmp/com.monitor.charge.plist

cp $DIR/.tmp/com.desktop.$screen.plist ~/Library/LaunchAgents/
cp $DIR/.tmp/com.monitor.charge.plist ~/Library/LaunchAgents/

launchctl load ~/Library/LaunchAgents/com.desktop.$screen.plist
launchctl load ~/Library/LaunchAgents/com.monitor.charge.plist
