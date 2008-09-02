#!/usr/bin/ruby
# vim: set sw=2 sts=2 et tw=80 :

#TODO mkdir structure /screenshots/08.26.08/
#TODO take screenshot using scrot, stick in directory.
#TODO Naming scheme desktop-date
#TODO cmd line options, fullscreen, select, naming convention of image

require 'getoptlong'
require 'configatron'
require 'net/ssh'
require 'net/scp'
require 'ping'

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
  config.tmpdir = ENV["TMP"]
  config.clean_tmpdir = true
  config.date_format = "%M/%D/%Y"
  config.filename = "desktop"
end

# Do not touch anything below this line unless you know what your doing.

# Check if the server is alive before we start.
if !Ping.pingecho(configatron.ssh.server)
  puts "Server appears to be down. Wait a few minutes and try again."
  exit 0
end

# Make sure our directory structure exists before we try to send the file there.
Net::SSH.start(configatron.ssh.server, configatron.ssh.user,
              :port => configatron.ssh.port) do |ssh|
  ssh.exec("mkdir -p #{configatron.ssh.remote_path}") # prints the results to $stdout
end

# Build command for scrot.
if configatron.scrot.multihead
  scrot_command = [ "#{configatron.scrot.bin}", "-d", "#{configatron.scrot.delay}",
                  "-q", "#{configatron.scrot.quality}", "-m",
                  "screeny.#{configatron.scrot.format}"].join("\s")
else
  scrot_command = [ "#{configatron.scrot.bin}", "-d", "#{configatron.scrot.delay}",
                  "-q", "#{configatron.scrot.quality}",
                  "screeny.#{configatron.scrot.format}"].join("\s")
end

# Take the screenshot.
system(scrot_command)

# Upload the screen shot to ssh.remote_path using scp.
Net::SCP.start(configatron.ssh.server, configatron.ssh.user,
              :port => configatron.ssh.port) do |scp|
  scp.upload!("./screeny.#{configatron.scrot.format}", "#{configatron.ssh.remote_path}")
end
