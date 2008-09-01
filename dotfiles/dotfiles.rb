#!/usr/bin/ruby

# Edit these
$dotfiles = %w[.zshrc .vimrc .zsh .vim .dir_colors .zkbd]
$servers = %w[gila web miker ibiblio nlfg isp4cheap]
$location = "/home/gregf"
$verbose = false

#TODO Rescue from some possible errors.
#TODO Maybe use benchmark and time the process via optional parameter

require 'Getopt/Declare'
require 'net/scp'

def verbose(list_dotfiles, server)
  if $verbose
    puts "Transfering #{list_dotfiles} to #{server}"
  end
end

def sync_dotfiles
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
  sync_dotfiles
end

specification = %q(
  [tight]

  -server <server>...      Process named file(s)
                              { $servers = server.to_a }
  -s <server>...     [ditto]

  -dotfile <dotfile>...    Process named file(s)
                              { $dotfiles = dotfile.to_a }
  -d  <dotfile>...    [ditto]

  -location  <location>     Process location
                              { $location = location }
  -l <location>       [ditto]

  --verbose                 Verbose
                             { $verbose = true }
  )


args = Getopt::Declare.new(specification)
sync_dotfiles
