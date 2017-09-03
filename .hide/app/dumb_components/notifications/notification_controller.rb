# !/bin/bash

module dumb_notifications

  def installed_locally
    osascript -e 'display notification "Installed for this user only, enjoy." with title "Success, Aerial Desktop"'
  end

  def installed_across_all_users
    osascript -e 'display notification "Installed for all users, enjoy." with title "Success, Aerial Desktop"'
  end

  def prompt_or_credential_input_time_expired
  osascript -e 'display notification "Did you put your credentials? Uninstall and reinstall, thanks." with title "error 333 Aerial Desktop"'
  end
end

