
module launch_agent
  def stage_launch_agent(launch_agent)
    `cp "#{launch_agent}/.tmp/com.example.hello.plist" ~/Library/LaunchAgents/`
  end

  def load_launch_agent
    `launchctl load ~/Library/LaunchAgents/com.example.hello.plist`
  end

  def unload_launch_agent
    ` launchctl unload ~/Library/LaunchAgents/com.example.hello.plist;`
  end

  def remove_launch_agent
    `rm ~/Library/LaunchAgents/com.example.hello.plist`
  end

end
