#!/usr/bin/ruby -w

#== Synopsis
#
# cleanmusic: Removes uwanted files, Renames directories and files in a logical manor.
#
# = Usage
#
# cleanmusic [OPTION] ... SRCDIR
# -h --help
#   show help
#
# -s --srcdir </storage/music/>
#  Top level directory to where files/directories are located 
#
# -v --version
#   Display current version

require 'getoptlong'
require 'rdoc/usage'
# Needed for clean method
require 'find'
require 'fileutils'

# File types we want to remove if we find.
DO_NOT_WANT=%w[*.txt *.svf *.nfo *.jpg *.jpeg *.png *.gif *.bmp]

#TODO Refactor gsubs into a function?
#TODO Verbose flag
#TODO cp instead of mv as option
#TODO option to specify dstdir
#TODO rename dstdir to srcdir
class Rename 
  attr_accessor :dname 
  
  def initialize(dname)  
       @dname = dname
  end  
 
  #TODO Rename directories only
  #TODO Make Recursive 
  def dren
    dirs = Dir.entries(@dname)
    dirs.each do |d|
      next if d == "." or d == ".."
      oldDir = @dname + d
      d = d.gsub(/^[a-z]|\s+[a-z]/) { |a| a.upcase.strip.to_s }
      d = d.gsub(/^[a-z]|\_+[a-z]/) { |a| a.upcase.strip.to_s }
      d = d.gsub(/^[a-z]|\-+[a-z]/) { |a| a.upcase.strip.to_s }
      d = d.gsub(/^[0-9]|\s+[0-9]/) { |a| a.upcase.strip.to_s }
      d = d.gsub(" ", "")
      d = d.gsub("_", "")
      d = d.gsub("!", "")
      d = d.gsub("?", "")
      File.rename(oldDir, @dname + d)
    end
  end

  #TODO Rename files only
  #TODO Make Recursive 
  def fren
    files = Dir.entries(@dname)
    files.each do |f|
      next if f == "." or f == ".."
      oldFile = @dname + f
      f = f.gsub(/^[a-z]|\s+[a-z]/) { |a| a.upcase.strip.to_s }
      f = f.gsub(/^[0-9]|\-+[0-9]/) { |a| a.upcase.strip.to_s }
      f = f.gsub(/^[a-z]|\_+[a-z]/) { |a| a.upcase.strip.to_s }
      f = f.gsub(/^[a-z]|\-+[a-z]/) { |a| a.upcase.strip.to_s }
      f = f.gsub(/-{2,}/, "")
      f = f.gsub(" ", "")
      f = f.gsub("_", "")
      f = f.gsub("?", "")
      f = f.gsub("!", "")
      File.rename(oldFile, @dname + f)
    end
  end

  def clean
    #TODO recursivly remove certain file types, use filetypes from array above. 
    Find.find(@dname) do |path|
      if File.basename(path) == '.txt'
        FileUtils.remove_file(path, true)
        Find.prune
      end
    end
  end

end

opts = GetoptLong.new(
      [ '--help', '-h', GetoptLong::NO_ARGUMENT ],
      [ '--version', '-v', GetoptLong::NO_ARGUMENT ],
      [ '--srcdir', '-s', GetoptLong::REQUIRED_ARGUMENT ]

    )

if ARGV.empty? 
  puts "Missing dir argument. Try --help"
  exit 0
end

dstdir = nil 
opts.each do |opt, arg|
  case opt
    when '--help'
      RDoc::usage
      exit 1
    when '--srcdir'
      srcdir = arg
    when '--version'
      puts "Version: 0.1"
      exit 1
  end
end

music = Rename.new(srcdir)
music.dren
