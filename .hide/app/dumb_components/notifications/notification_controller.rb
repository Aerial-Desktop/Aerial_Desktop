# !/bin/bash

module dumb_notifications
  
  def installed_locally
    have_a_third_method_that_builds_it("this user")
  end

  def installed_across_all_users
    have_a_third_method_that_builds_it("all users")
  end
  
  def have_a_third_method_that_builds_it(users)
    osascript -e 'display notification "Installed for #{users} only, enjoy." with title "Success, Aerial Desktop"'
  end

  def installed_across_all_users
    osascript -e 'display notification "Installed for all users, enjoy." with title "Success, Aerial Desktop"'
    have_a_third_method_that_builds_it("all users")
  end

  def prompt_or_credential_input_time_expired
  osascript -e 'display notification "Did you put your credentials? Uninstall and reinstall, thanks." with title "error 333 Aerial Desktop"'
  end
end

