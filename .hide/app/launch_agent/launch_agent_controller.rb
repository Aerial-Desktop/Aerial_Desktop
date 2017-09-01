# require relative screensaver_engine.rb
# require relative com.example.plist
# require relative .tmp

# write out path needed

def get_directory()
  directory = File.dirname(__FILE__)
end

def get_launch_agent_directory(directory)
  launch_agent = directory
end

def get_screensaver_engine_directory(directory)
  screensaver_engine = "#{directory}/../../bin"
end

def create_tmp_file(launch_agent_directory)
  `mkdir #{launch_agent_directory}/.tmp`
end

def copy_launch_agent_to_tmp(launch_agent_directory)
  `cp #{launch_agent_directory}/com.example.hello.plist #{launch_agent_directory}/.tmp/com.example.hello.plist`
end

def create_string_for_launch_agent(screensaver_engine)
  # create the string needed.
  change_line_str = "              <string>#{screensaver_engine}/./screensaver_engine.app/Contents/Resources/script</string>"
end

def insert_path_needed_into_correct_file(change_line_str, launch_agent_directory)
  # line 9 in com.example.hello.plist
  `sed -i '' '9s?.*?''#{change_line_str}''?' "#{launch_agent_directory}/.tmp/com.example.hello.plist"`
end

def set_plist_permissions(launch_agent)
  `chmod 644 "#{launch_agent}/.tmp/com.example.hello.plist"`
end

def stage_launch_agent(launch_agent)
  `cp "#{launch_agent}/.tmp/com.example.hello.plist" ~/Library/LaunchAgents/`
end

def load_launch_agent
  `launchctl load ~/Library/LaunchAgents/com.example.hello.plist`
end

def controller()
  get_directory
  launch_agent_directory = get_launch_agent_directory(get_directory())
  get_screensaver_engine_directory(get_directory())
  create_tmp_file(launch_agent_directory)
  copy_launch_agent_to_tmp(launch_agent_directory)
  change_line_str = create_string_for_launch_agent(get_screensaver_engine_directory(get_directory()))
  insert_path_needed_into_correct_file(change_line_str, launch_agent_directory)
  set_plist_permissions(launch_agent_directory)
  stage_launch_agent(launch_agent_directory)
  load_launch_agent
end

controller
