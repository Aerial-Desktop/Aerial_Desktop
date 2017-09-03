
module file_info
#should these two methods be inside a check module?
  def local_screensaver_exists(saver_location, saver_name)
    "~/#{SAVER_LOCATION}/#{saver_name}"
  end # test should send empty saver name or demo ... and match manually typed

  def root_screensaver_exists(saver_location, saver_name)
    "/#{SAVER_LOCATION}/#{saver_name}"
  end # test should send empty saver name or demo ... and match manually typed

  # expect(install_controller.local_screensaver_exists SAVER_LOCATION, 'Aerial.saver').to eq( "~/Library/LaunchAgents/Aerial.saver")
  def root_saver_string(screen_saver)
    "/Library/Screen Savers/#{screen_saver}.saver"
  end

  def root_saver_path(screen_saver)
    "/Library/Screen\ Savers/#{screen_saver}.saver"
  end
end
