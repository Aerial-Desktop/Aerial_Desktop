# !/bin/bash
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  TARGET="$(readlink "$SOURCE")"
  if [[ $TARGET == /* ]]; then
    echo "SOURCE '$SOURCE' is an absolute symlink to '$TARGET'"
    SOURCE="$TARGET"
  else
    DIR="$( dirname "$SOURCE" )"
    echo "SOURCE '$SOURCE' is a relative symlink to '$TARGET' (relative to '$DIR')"
    SOURCE="$DIR/$TARGET" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  fi
done
echo "SOURCE is '$SOURCE'"
RDIR="$( dirname "$SOURCE" )"
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
if [ "$DIR" != "$RDIR" ]; then
  echo "DIR '$RDIR' resolves to '$DIR'"
fi
echo "DIR is '$DIR'"

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
