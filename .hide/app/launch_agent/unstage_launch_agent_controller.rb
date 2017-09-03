require launch_agent

def unstage_launch_agent_controller
  launch_agent.unload_launch_agent
  launch_agent.remove_launch_agent
end

# to be called in a higher order controller.
