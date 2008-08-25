#!/usr/bin/env ruby
require 'fileutils'

module Settings
  HOME="/home/gregf/" # Backslash requried
  TMPDIR="#{HOME}/dotfilebackup" # No backslash here

  DOTFILES = {
    ".vimrc" => "dot.vimrc",
    ".zshrc" => "dot.zshrc",
    ".screenrc" => "dot.screenrc",
    ".muttrc" => "dot.muttrc",
    ".Xmodmap" => "dot.Xmodmap",
    ".xinitrc" => "dot.xinitrc",
    ".zsh" => "dot.zsh",
    ".Xdefaults" => "dot.Xdefaults",
    ".conkyrc" => "dot.conkyrc",
    ".conky" => "dot.conky"

  }
end

include Settings

if !File.exists? "#{TMPDIR}"
  FileUtils.mkdir "#{TMPDIR}", :mode => 0700
end

Dir.chdir("#{HOME}") do
  DOTFILES.each do |original, new|
    if File.dirname("#{original}") == "."
      puts "#{original}" + " is a dotfile"
      FileUtils.cp_r "#{original}", "#{TMPDIR}/#{new}"
    else
      DF = new.split('/')
      FileUtils.mkdir TMPDIR + "/" + DF[0]
      FileUtils.cp_r "#{original}", "#{TMPDIR}/#{DF[0]}/#{DF[1]}" 
    end
  end
end

# Clean things up
#FileUtils.rm_r("#{TMPDIR}")
