#require_relative '../screensaver/screensaver_controller.rb'
#require_relative '../check/check_controller.rb'
#require_relative '../notifications/notification_controller.rb'
#require_relative '../launch_agent/launch_agent_controller.rb'
#class InstallController
  #  CheckController.adaptive_wait()
  # to do... everything should be refactored into module's
  # the state for this application is the macintosh environment.
# screensaver_controller  = ScreensaverController.new
# check_controller  = CheckController.new
# notification_controller  = NotificationController.new
# launch_agent_controller  = LaunchAgentController.new


# screensaver_controller.change_screensaver()
# check_controller.notify_while_adaptive_wait() # will call a method in notification.
# notification_controller.tell_what_happened()
# launch_agent_controller.setup_and_load()
#end
class InstallController
  def local_screensaver_exists(saver_location, saver_name)
    "~/#{SAVER_LOCATION}/#{saver_name}"
  end # test should send empty saver name or demo ... and match manually typed
  def root_screensaver_exists(saver_location, saver_name)
    "/#{SAVER_LOCATION}/#{saver_name}"
  end # test should send empty saver name or demo ... and match manually typed
end
# SAVER_LOCATION = 'Library/LaunchAgents'
# install_controller = InstallController.new
