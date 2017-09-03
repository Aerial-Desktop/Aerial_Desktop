# file info

require_relative file_info #this should be a module.

def change_defaults_on_root
  `defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Aerial path "#{root_saver_string(screen_saver)}" type 0`
end

def change_defaults_on_local(screen_saver)
  `defaults -currentHost write com.apple.screensaver modulePath -string "#{local_saver_string(screen_saver)}";
  defaults -currentHost write com.apple.screensaver moduleName -string "#{screensaver}";
  defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName "#{screen_saver}" path "#{root_saver_path(screen_saver)}" type 0;`
end # if local "~/" if root "/"

# previous example
  # defaults -currentHost write com.apple.screensaver modulePath -string "~/Library/Screen\ Savers/Aerial.saver";
  # defaults -currentHost write com.apple.screensaver moduleName -string "Aerial";
  # defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Aerial path ~/Library/Screen\ Savers/Aerial.saver type 0;

##### put in a controller. Not sure where to put this yet.. this was for notifications and changing defaults based on user decision.
# file.root_screensaver_exists(saver_location, saver_name)
#if file.local_screensaver_exists(saver_location, saver_name) then


