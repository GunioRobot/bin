#!/usr/bin/ruby

#== Synopsis
#
# dotfiles: Quick way to sync your dotfiles to multiple servers.
#
#
# = Usage
#
# dotfiles [OPTION] ...
# -h --help
#   show help
#
# -v --version
#   Display current version
#
# -d --dotfiles file1 file2 file3
#   Override the default configuration via command line.
#
# -s --servers server1 server2 server
#   Override the default configuration via command line.
#
# -l --location /some/path
#   Override the default location of the dotfiles.

# Edit these
$dotfiles = %w[.zshrc .vimrc .zsh .vim .dir_colors .zkbd]
$servers = %w[gila web miker ibiblio nlfg isp4cheap]
$location = "/home/gregf"
$verbose = true

#TODO Allow user to override dotfiles and servers array via cmd line opt.
#TODO Maybe use benchmark and time the process via optional parameter

require 'getoptlong'
require 'rdoc/usage'
require 'net/scp'

def verbose(list_dotfiles, server)
  if $verbose
    puts "Transfering #{list_dotfiles} to #{server}"
  end
end

def send_defaults()
  Dir.chdir($location)
  list_dotfiles = $dotfiles.join(", ")
  $servers.each do |server|
      verbose(list_dotfiles, server)
      $dotfiles.each do |dotfile|
        Net::SCP.start("#{server}", :user) do |scp|
          scp.upload! "#{dotfile}", "~", :recursive => true
      end
    end
  end
end

if ARGV.empty?
  send_defaults
end

opts = GetoptLong.new(
      [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
      [ '--version', '-v', GetoptLong::NO_ARGUMENT],
      [ '--dotfiles', '-d', GetoptLong::REQUIRED_ARGUMENT],
      [ '--servers', '-s', GetoptLong::REQUIRED_ARGUMENT],
      [ '--location', '-l', GetoptLong::REQUIRED_ARGUMENT]
    )

opts.each do |opt, arg|
  case opt
    when '--help'
      RDoc::usage
      exit 1
    when '--version'
      puts "Version: 0.1"
      exit 1
    when '--dotfiles'
      $dotfiles = arg.to_a
    when '--servers'
      $servers = arg.to_a
    when '--location'
      $location = arg.to_s
  end
end

send_defaults
