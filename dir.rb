#!/usr/bin/ruby -w
require 'find'
dir = "/home/gregf/boo/"
Dir.chdir(dir)
files = Dir['**/*']
for f in files
  Find.find(f) do |path|
    if FileTest.directory?(path)
      Find.prune
    end
  p path.to_a
  end
end
