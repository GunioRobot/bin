#!/usr/bin/ruby -w

class Rename 
  attr_accessor :dname 
  
  def initialize(dname)  
       @dname = dname
  end  
  
  def dren
    dirs = Dir.entries(@dname)
    dirs.each do |d|
      next if d == "." or d == ".."
      oldDir = @dname + d
      d = d.gsub(/^[a-z]|\s+[a-z]/) { |a| a.upcase.strip.to_s }
      d = d.gsub(/^[a-z]|\_+[a-z]/) { |a| a.upcase.strip.to_s }
      d = d.gsub(" ", "")
      d = d.gsub("_", "")
      d = d.gsub("!", "")
      d = d.gsub("?", "")
      File.rename(oldDir, d)
    end
  end

  def fren
    files = Dir.entries(@dname)
    files.each do |f|
      next if f == "." or f == ".."
      oldFile = @dname + f
      f = f.gsub(/^[a-z]|\s+[a-z]/) { |a| a.upcase.strip.to_s }
      f = f.gsub(/^[a-z]|\_+[a-z]/) { |a| a.upcase.strip.to_s }
      f = f.gsub(/-{2,}/, "")
      f = f.gsub(" ", "")
      f = f.gsub("_", "")
      f = f.gsub("?", "")
      f = f.gsub("!", "")
      File.rename(oldFile, f)
    end
 
  end
end

foo = Rename.new("/home/gregf/test/")
foo.dren
foo.fren
