#!/usr/bin/ruby
# vim: set sw=2 sts=2 et tw=80 :

#TODO Add that ability to choose between fullscreen and select
#TODO Check if we should user .ssh/config or provided info.

require 'configatron'
require 'net/ssh'
require 'net/scp'
require 'ping'
require 'fileutils'

### EDIT These ###
configatron do |config|
  config.namespace(:scrot) do |scrot|
    scrot.bin = "/usr/bin/scrot"
    scrot.delay = "5"
    scrot.multihead = "false"
    scrot.quality = "85"
    scrot.format = "png"
    scrot.type = "fullscreen" # or select (click a window on runtime to snap)
    scrot.border = "true" # Grab window border if using select
  end
  config.namespace(:ssh) do |ssh|
    ssh.server = "gregf.org"
    ssh.remote_path = "~/blog/shared/stuff/screenshots/"
    # If these are left blank it will read settings from ~/.ssh/config
    ssh.user = "gregf"
    ssh.port = "159"
  end
  # Set this to anything you want.
  config.tmpdir = ENV["TMP"] # No trailing slash!
  config.clean_tmpdir = true
  config.filename_date = "%m.%d.%y"
  config.directory_date = "%m.%Y"
  config.filename = "desktop"
end

# Do not touch anything below this line unless you know what your doing.

# Build some filenames, and paths based off of the info the user entered above.
time = Time.now
directory_date = time.strftime("#{configatron.directory_date}")
filename_date = time.strftime("#{configatron.filename_date}")
filename = "#{configatron.tmpdir}/#{configatron.filename}-#{filename_date}.#{configatron.scrot.format}"
send_to = "#{configatron.ssh.remote_path}/#{directory_date}"

# Check if the server is alive before we start.
if !Ping.pingecho(configatron.ssh.server)
  puts "Server appears to be down. Wait a few minutes and try again."
  exit 0
end

# Make sure our directory structure exists before we try to send the file there.
Net::SSH.start(configatron.ssh.server, configatron.ssh.user,
              :port => configatron.ssh.port) do |ssh|
  ssh.exec("mkdir -p #{send_to}")
end

# Build command for scrot.
if configatron.scrot.multihead
  scrot_command = [ "#{configatron.scrot.bin}", "-d", "#{configatron.scrot.delay}",
                  "-q", "#{configatron.scrot.quality}", "-m",
                  "#{filename}"].join("\s")
else
  scrot_command = [ "#{configatron.scrot.bin}", "-d", "#{configatron.scrot.delay}",
                  "-q", "#{configatron.scrot.quality}",
                  "#{filename}"].join("\s")
end

# Take the screenshot.
system(scrot_command)

# Upload the screen shot to ssh.remote_path using scp.
Net::SCP.start(configatron.ssh.server, configatron.ssh.user,
              :port => configatron.ssh.port) do |scp|
  scp.upload!("#{filename}", "#{send_to}")
end

# Clean up any files we may have made.
if configatron.clean_tmpdir
  if File.file?("#{filename}")
    FileUtils.remove_file("#{filename}", true)
  end
end
