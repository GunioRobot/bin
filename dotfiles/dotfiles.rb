#!/usr/bin/ruby
# vim: set sw=2 sts=2 et tw=80 :

#TODO Allow user to override dotfiles and servers array via cmd line opt.
#TODO Verbose option, no verbosity by default (for cron)
#TODO Maybe use benchmark and time the process via optional parameter
#TODO Use getoptlong

require 'net/scp'

# Edit these
dotfiles = %w[.zshrc .vimrc .zsh .vim .dir_colors .zkbd]
servers = %w[gila web miker ibiblio nlfg isp4cheap]

# Leave alone!
list_dotfiles = dotfiles.join(", ")
servers.each do |server|
    puts "Transfering #{list_dotfiles} to #{server}"
    dotfiles.each do |dotfile|
      Net::SCP.start("#{server}", :user) do |scp|
        scp.upload! "#{dotfile}", "~", :recursive => true
    end
  end
end
