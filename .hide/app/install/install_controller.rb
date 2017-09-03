require_relative ../screensaver/screensaver_controller.rb
require_relative ../notifications/notification_controller.rb
require_relative ../launch_agent/launch_agent_controller.rb
require_relative ../check/check_controller.rb
class InstallController
  # to do... everything should be refactored into module's
  # the state for this application is the macintosh environment.

  #story, how this application works.
  #users interact with the menubar... that is an interface or dashboard or something.
  #the install requests come into this file.
  #
  #this file handles
  # 1.Installing the particular screensaver
  # 2.probably monitoring the status ... or telling the monitor to do stuff.
  # 2.changing the mac_defaults.
  # 3.telling the launch agent to run.
  # 4.allowing users to customize the stuff later.
  #
  # 5.really this should be manager. not install.
  # 5.manager can, install, start, stop, and uninstall.
  #
  # 6.the interface is manipulated by the User and the manager takes care of it
end
