#!/usr/bin/ruby

LOG_FILE="/var/log/paludis.log"
ACTIONS="clean|uninstall|fetch|install"
SYNC_PATTERN="finished #{ACTIONS} of package"
status = %w[]
if File.file?(LOG_FILE) && File.readable?(LOG_FILE)
  File.open(LOG_FILE, "r") do |f|
    f.each_line do |line|
      line = line.grep( /#{SYNC_PATTERN}/ ) do |line|
        status.push("#{line} ")
      end
    end
  end
end

outcome = status.last.split(" ")

puts outcome[5]
