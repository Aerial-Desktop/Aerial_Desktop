DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo $($DIR/./0_check_version.sh $(sw_vers -productVersion) 10.12.6 '<=')
