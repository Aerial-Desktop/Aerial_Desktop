require_relative ../screensaver/screensaver_controller.rb
require_relative ../notifications/notification_controller.rb
require_relative ../launch_agent/launch_agent_controller.rb
require_relative ../check/check_controller.rb
class InstallController
  # to do... everything should be refactored into module's
  # the state for this application is the macintosh environment.
  = ScreensaverController.new
  = CheckController.new
  = NotificationController.new
  = LaunchAgentController.new
end
