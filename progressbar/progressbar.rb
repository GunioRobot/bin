#!/usr/bin/ruby

LOG_FILE="/var/log/paludis.log"
ACTIONS="clean|uninstall|fetch|install"
SYNC_PATTERN="finished #{ACTIONS} of package"
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

outcome = status.last
outcome = outcome.match("[0-9]{1,3} of [0-9]{1,3}")
outcome = outcome.to_s
outcome = outcome.gsub("of", "")
outcome = outcome.split(" ")
puts 100.0*outcome[0].to_i/outcome[1].to_i
