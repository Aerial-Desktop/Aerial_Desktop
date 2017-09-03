
def notify_uninstall_success
  osascript -e 'display notification "Aerial Screensaver has been removed." with title "Aerial Desktop Uninstall Successful"'
end

def notify_about_sudo_problem_known_bug
  osascript -e 'display notification "Did not Uninstall currently in dev,\nReason: installed across all Users; need sudo"'
end

def notify_no_file
  osascript -e 'display notification "File does not exist." with title "Notification: Aerial Desktop"'
end



