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

# Edit these
dotfiles = %w[.zshrc .vimrc .zsh .vim .dir_colors .zkbd]
servers = %w[gila web miker ibiblio nlfg isp4cheap]

#TODO Allow user to override dotfiles and servers array via cmd line opt.
#TODO Verbose option, no verbosity by default (for cron)
#TODO Maybe use benchmark and time the process via optional parameter
#TODO Use getoptlong

require 'getoptlong'
require 'rdoc/usage'
require 'net/scp'

def send_defaults
  list_dotfiles = dotfiles.join(", ")
  servers.each do |server|
      puts "Transfering #{list_dotfiles} to #{server}"
      dotfiles.each do |dotfile|
        Net::SCP.start("#{server}", :user) do |scp|
          scp.upload! "#{dotfile}", "~", :recursive => true
      end
    end
  end
end

opts = GetoptLong.new(
      [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
      [ '--version', '-v', GetoptLong::NO_ARGUMENT ]
    )


if ARGV.empty?
  send_defaults
end

opts.each do |opt, arg|
  case opt
    when '--help'
      RDoc::usage
      exit 1
    when '--version'
      puts "Version: 0.1"
      exit 1
  end
end
