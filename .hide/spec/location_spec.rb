require "rspec"
require_relative '../app/install/install_controller.rb'

describe InstallController do
  let(:install_controller) { InstallController.new }
  describe "Locations_LaunchAgents" do

    it "installs screensavers to their correct locations" do
      SAVER_LOCATION = 'Library/LaunchAgents'
      expect(install_controller.local_screensaver_exists SAVER_LOCATION, 'Aerial.saver').to eq( "~/Library/LaunchAgents/Aerial.saver")
      expect(install_controller.root_screensaver_exists  SAVER_LOCATION, 'Aerial.saver').to eq("/Library/LaunchAgents/Aerial.saver")
      expect(install_controller.local_screensaver_exists SAVER_LOCATION, 'Aerial.saver').not_to eq ("/Library/LaunchAgents/Aerial.saver")
      expect(install_controller.root_screensaver_exists  SAVER_LOCATION, 'Aerial.saver').not_to eq("~/Library/LaunchAgents/Aerial.saver")
    end
  end

  describe "Locations filenames" do
  # 0) part of any error subset file error ... tell me when nothing happened due to error
  # 1) for file name tell me path requested and from what path location
  # 2) search project for file name
  # 3) suggest path requested to be changed to path of file found.
  end

  describe "any error" do end

  describe "tell me each success for every behavior" do end

  describe "Locations_ScreenSavers" do end

  describe "Other Stuff" do end



end

