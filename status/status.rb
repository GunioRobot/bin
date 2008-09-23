#!/usr/bin/ruby

def pluralize(action)
  case action
  when "install": "installing"
  when "clean": "cleaning"
  when "fetch": "fetching"
  when "uninstall": "uninstalling"
  else "Error will robinson, error!"
  end
end

LOG_FILE="/var/log/paludis.log"
ACTIONS="clean|uninstall|fetch|install"
SYNC_PATTERN="#{ACTIONS} of package"
status = %w[]
if File.file?(LOG_FILE)
  File.open(LOG_FILE, "r") do |f|
    f.each_line do |line|
      line = line.grep( /#{SYNC_PATTERN}/ ) do |line|
        status.push("#{line} ")
      end
    end
  end
end

outcome = status.last.match("#{ACTIONS}").to_s

puts pluralize(outcome)
