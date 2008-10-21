#!/usr/bin/env ruby
# vim: set sw= sts= et tw= :

# I have a ton of gems installed and everytime I do a clean install or 
# setup another box I gotta reinstall all these fuckers, one at a time
# as I find I need them. No will I do that. Run this and it should take
# care of it for you. Pretty much hardcoded to my gentoo install for now.
# Going to add support for freebsd soon.
#
# TODO test if system packages are already installed.
#      If they are remove them from the array.
#      Then install whats left if any.
# TODO Rescue from possible errors
# TODO Perty status messages/colors

GEM="/usr/bin/gem"
GEM_OPTS="--no-ri --no-rdoc"
GEM_UPDATE="update --system"
PALUDIS="/usr/bin/paludis"
PALUDIS_OPTS="-i"
PACKAGES = %w[dev-ruby/rubygems dev-libs/oniguruma media-gfx/imagemagick].join(' ')

GEMS = %w[
abstract 
actionmailer 
actionpack 
activerecord 
activeresource 
activesupport 
addressable 
anvil 
archive-tar-minitar 
arrayfields 
attributes 
aws-s 
BlueCloth 
builder 
capistrano 
cgi_multipart_eof_fix 
cheat 
chronic 
coderay 
color 
columnize
commandline 
configatron 
curb 
daemons 
data_objects 
defunkt-github 
diff-lcs 
discount 
dm-aggregates 
dm-core 
dm-migrations 
dm-sweatshop 
dm-timestamps 
dm-types 
dm-validations 
do_mysql 
do_sqlite 
echoe 
erubis 
escape 
etc 
eventmachine 
exifr 
extensions 
extlib 
facets 
faker 
fastthread 
fattr 
file-tail 
flacmp 
flacinfo-rb 
gem_plugin 
getopt-declare 
god 
googlebase 
guessmethod 
haml 
highline 
hoe 
hpricot 
jdpace-weatherman 
json_pure 
libxml-ruby 
linecache 
logr 
mailfactory 
main 
mechanize 
merb 
merb-action-args 
merb-assets 
merb-auth 
merb-auth-core 
merb-auth-more 
merb-auth-slice-password 
merb-cache 
merb-core 
merb-exceptions 
merb-gen 
merb-haml 
merb-helpers 
merb-mailer 
merb-more 
merb-pagination 
merb-param-protection 
merb-slices 
merb_datamapper 
merb_has_flash 
merb_helpers 
merb_jquery 
merb_openid 
merbful_authentication 
mime-types 
minigems 
mocha 
mongrel 
net-scp 
net-sftp 
net-ssh 
net-ssh-gateway 
net-toc 
newgem 
oldmoe-neverblock 
oldmoe-neverblock-mysql 
oniguruma 
open 
ParseTree 
passenger 
pelargir-finder_filter 
piston 
Platform 
plist 
populator 
pow 
rack 
rails 
rake 
rand 
randexp 
rdiscount 
RedCloth 
roodi 
rspec 
rubigen 
ruby-debug 
ruby-debug-base 
ruby-mpinfo 
ruby-openid 
rubyruby 
rubyforge 
RubyInline 
rubyweather 
rush 
ryanb-acts-as-list 
sbfaulkner-fuzzy_file_finder 
sequel 
session 
sqlite-ruby 
syntax 
SyslogLogger 
technicalpickles-shoulda_generator 
templater 
term-ansicolor 
test-spec 
text-format 
text-hyphen 
textpow 
thin 
thor 
thoughtbot-factory_girl 
thoughtbot-quietbacktrace-quiet_backtrace 
thoughtbot-shoulda 
ultraviolet 
unicode 
utility_belt 
uuidtools 
vlad 
what_methods 
widget_wrapper 
wirble 
wxruby 
xml-simple 
yahoo-weather 
ZenTest].join(' ')

%x[#{PALUDIS} #{PALUDIS_OPTS} #{PACKAGES}]
%x[#{GEM} #{GEM_OPTS} #{GEM_UPDATE}]
%x[#{GEM} #{GEM_OPTS} #{GEMS}]
