shrink=../../..
./$shrink/.hide/app/uninstall/unstage_launch_agent.sh
./$shrink/.hide/app/uninstall/remove_aerial.sh
mv $shrink/Start.app/ ../../../.hide/bin
mv $shrink/Stop.app/ ../../../.hide/bin
mv $shrink/Uninstall.app ../../../.hide/bin
mv ../$shrink/bin/Installer.app ../../../../../

