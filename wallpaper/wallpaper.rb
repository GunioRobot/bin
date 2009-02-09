#!/usr/bin/env ruby
# vim: set sw=2 sts=2 et tw=80 :

WALLPAPER="/home/gregf/.wallpaper/" # Full path no ~
IMAGE_FORMATS="[.jpg,.gif,.png,.bmp]" # Keep this a string
WALLPAPER_CMD="/usr/bin/feh" # Whatever command you use to set your wallpaper
WPCMD_OPTIONS="--bg-scale" # Any options you need to pass to the above command
DISPLAY=":0.0" # You can use ENV['DISPLAY'] here but, it wont work from a cronjob.

unless IMAGE_FORMATS.class == String
  puts "IMAGE_FORMATS must be a string, surround it in quotes."
  exit
end

unless File.directory?("#{WALLPAPER}")
  puts "Wallpaper directory #{WALLPAPER} does not exist"
  exit
end

unless File.executable?("#{WALLPAPER_CMD}")
  puts "#{WALLPAPER_CMD} is not executable"
  exit
end

ENV["DISPLAY"] = "#{DISPLAY}"

Dir.chdir("#{WALLPAPER}") do
  files = Dir.glob("*#{IMAGE_FORMATS}")
  random_file = rand(1-files.size)
  IO.popen("#{WALLPAPER_CMD} #{WPCMD_OPTIONS} #{files[random_file]}")
end
