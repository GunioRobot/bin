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
require 'find'
require 'fileutils'

# File types we want to remove if we find.
$do_not_want = %w[.txt .svf .nfo .jpg .jpeg .png .gif .bmp .url]

#TODO Refactor gsubs into a function?
#TODO Verbose flag
#TODO cp instead of mv as option
#TODO Rename files based off of id3 tags if available.
class Rename
  attr_accessor :dname

  def initialize(dname)
       @dname = dname
  end

  #TODO Rename directories only
  #TODO Make Recursive
  def directory_rename
      Find.find(@dname) do |path|
        next if File.file?(path)
        dir = File.dirname(path)
        dir = dir.gsub(/^[a-z]|\s+[a-z]/) { |a| a.upcase.strip.to_s }
        dir = dir.gsub(/^[a-z]|\_+[a-z]/) { |a| a.upcase.strip.to_s }
        dir = dir.gsub(/^[a-z]|\-+[a-z]/) { |a| a.upcase.strip.to_s }
        dir = dir.gsub(/^[0-9]|\s+[0-9]/) { |a| a.upcase.strip.to_s }
        dir = dir.gsub(" ", "")
        dir = dir.gsub("_", "")
        dir = dir.gsub("!", "")
        dir = dir.gsub("?", "")
        dir = dir.gsub("[", "")
        dir = dir.gsub("]", "")
        dir = dir.gsub(",", "")
        dir = dir.gsub(".", "")
        File.rename(path, dir)
    end
  end

  def file_rename
    Find.find(@dname) do |path|
      next if File.directory?(path) or path == "."  or path == ".."
      file = File.basename(path)
      dir = File.dirname(path)
      file = file.gsub(/^[a-z]|\s+[a-z]/) { |a| a.upcase.strip.to_s }
      file = file.gsub(/^[0-9]|\-+[0-9]/) { |a| a.upcase.strip.to_s }
      file = file.gsub(/^[a-z]|\_+[a-z]/) { |a| a.upcase.strip.to_s }
      file = file.gsub(/^[a-z]|\-+[a-z]/) { |a| a.upcase.strip.to_s }
      file = file.gsub(/-{2,}/, "")
      file = file.gsub(" ", "")
      file = file.gsub("-", "")
      file = file.gsub("_", "")
      file = file.gsub("?", "")
      file = file.gsub("!", "")
      file = file.gsub(")", "")
      file = file.gsub("(", "")
      file = file.gsub(",", "")
      file = file.gsub("]", "")
      file = file.gsub("[", "")
      File.rename(path, dir + '/' + file)
    end
  end

  def clean
    $do_not_want.each do |dnw|
      Find.find(@dname) do |file|
        next if File.directory?(file)
        if File.extname(file) == dnw
          FileUtils.remove_file(file, true)
          Find.prune
        end
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

srcdir = nil
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
puts "Renaming Directories.."
music.directory_rename # Broken!
puts "Renaming Files.."
music.file_rename
puts "Cleaning up files.."
music.clean
