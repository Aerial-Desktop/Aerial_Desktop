#!/bin/bash
require unstage_launch_agent

def uninstall
  unstage_launch_agent
  if
    installed(local(Aerial.saver))
    then
    `rm -rf #{local(Aerial.saver)}`
    notify_uninstall_success

  else if
    installed(root(Aerial.saver))
    then
    notify_about_sudo_problem_known_bug
  else
    notify_no_file
  end

  change_mac_default_screensaver_no_longer_exists
end

# if user clicks a button ... uninstall.
