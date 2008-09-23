#!/usr/bin/ruby

LOG_FILE="/var/log/paludis.log"
SYNC_PATTERN="finished sync of repository gentoo"
sync_date = %w[]
if File.file?(LOG_FILE)
  File.open(LOG_FILE, "r") do |f|
    f.each_line do |line|
      line = line.grep( /#{SYNC_PATTERN}/ ) do |line|
        sync_date.push("#{line} ")
      end
    end
  end
end

lastline = sync_date.last.gsub("\n", "")
unixtime = Time.at(lastline.to_i)
puts unixtime.strftime("%a, %b %d @ %I:%M%P")
