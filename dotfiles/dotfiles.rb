#!/usr/bin/ruby

# Edit these
$dotfiles = %w[.zshrc .vimrc .zsh .vim .dir_colors .zkbd .gemrc .screenrc .gitconfig]
$servers = %w[quad gila web miker ibiblio nlfg isp4cheap]
# You can specify any path you wish
$location = ENV["HOME"]
$verbose = false

#TODO Rescue from some possible errors.
#TODO fix up variables
#TODO class based
#TODO option to delete files on the server first

%w[rubygems pp Getopt/Declare net/scp].each { |lib| require lib }

def verbose(list_dotfiles, server)
  if $verbose
    $stdout.puts %Q{ Transfering #{list_dotfiles} to #{server} }
  end
end

def sync_dotfiles
  Dir.chdir($location)
  list_dotfiles = $dotfiles.join(", ")
  $servers.each do |server|
      verbose(list_dotfiles, server)
        Net::SCP.start("#{server}", :user) do |scp|
          $dotfiles.each do |dotfile|
            scp.upload("#{dotfile}", "~", :recursive => true)
          end
        end
  end
end

if ARGV.empty?
  sync_dotfiles
end

args = Getopt::Declare.new(<<'EOF')
-server <server>    Process named server(s)
                            { $servers = server.to_a } 
-dotfile <dotfile>    Process named file(s)
                            { $dotfiles = dotfile.to_a }
-location <location>    Path to upload the file(s)
                            { $location = location }
-verbose    Verbose
              { $verbose = true }
EOF

sync_dotfiles
