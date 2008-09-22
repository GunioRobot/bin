#!/usr/bin/ruby
# vim: set sw=2 sts=2 et tw=80 :

bugnumber = ARGV[0]
browser = "/usr/bin/firefox"
tabcmd = "-new-tab"
bugzilla_url = "http://bugs.gentoo.org/show_bug.cgi?id="

if "#{bugnumber}" =~ /^#/
  bugnumber = bugnumber.gsub('#', '')
end

system("#{browser} #{tabcmd} #{bugzilla_url}#{bugnumber}")
