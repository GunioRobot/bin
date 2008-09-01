#!/usr/bin/ruby
# vim: set sw=2 sts=2 et tw=80 :

#TODO mkdir structure /screenshots/08.26.08/
#TODO take screenshot using scrot, stick in directory.
#TODO Naming scheme desktop-date
#TODO scp to server
#TODO if directories on server do not exist create them.
#TODO cmd line options, fullscreen, select, naming convention of image

require 'getoptlong'
require 'configatron'
require 'net/ssh'
require 'net/scp'

### EDIT These ###
configatron do |config|
  config.scrot = "/usr/bin/scrot"
  config.server = "gregf.org"
  config.remote_path = "~/blog/shared/stuff/screenshots/"
  # If these are left blank it will read settings from ~/.ssh/config
  config.user = "gregf"
  config.port = "159"
  # Set this to anything you want.
  config.tmpdir = ENV["TMP"]
  config.clean_tmpdir = true
end


system(configatron.scrot)
