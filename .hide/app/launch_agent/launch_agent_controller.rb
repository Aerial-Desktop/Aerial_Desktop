# require relative screensaver_engine.rb
# require relative com.example.plist
# require relative .tmp

# write out path needed
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
