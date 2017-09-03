#!/bin/bash

module Check
# def notify_while_adaptive_wait()
## over the course of 25 seconds. prompt the user 5 times to enter their credentials.
## but listen every second for if they submitted a result.
#{}`TIMEOUT=25
#  until [ -d ~/Library/Screen\ Savers/Aerial.saver ] || [ -d /Library/Screen\ Savers/Aerial.saver ] || [ $TIMEOUT -eq 0 ] ; do
#    if ! ((TIMEOUT % 5)); then
#    osascript -e 'display notification "To allow for Decision/User Credentials" with title "Application Waiting"'
#    fi
#    sleep 1
#    TIMEOUT=$[$TIMEOUT-1]
#  done`
#end

def notify_adaptive_wait()
# over the course of 25 seconds. prompt the user 5 times to enter their credentials.
# but listen every second for if they submitted a result.
  time = 25
  until local_saver_exists || root_saver_exists || out_of_time(time) ; do # this unill is truthy
    handle_notifications
    let_time_pass
  end

  def handle_notifications(time)
    if time  % 5 then send_a_notification end
  end

  def send_a_notification()
    osascript -e 'display notification "To allow for Decision/User Credentials" with title "Application Waiting"'
  end

  def let_time_pass()
    sleep 1
    time = time - 1
  end

  def out_of_time(time)
      time == 0 ? return false : return true
  end
end
