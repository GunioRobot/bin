#!/usr/bin/ruby

# by Brian Carper
# http://briancarper.net
#
# This script connects to an IMAP server and prints 
# how many new emails there are; if there are any
# new emails, it prints the sender and a short snippit
# of the email body.
#
# Why not use fetchmail?  Because I want to do
# other things to the output before printing it.

require 'net/imap'
require 'time'

# Remove these lines once you configure the script to 
# work with your own mail server
puts "Edit the script to include your login info!"
exit

# Change this to your mail server
imap = Net::IMAP.new('mail.server.com')

# Change USERNAME and PASSWORD to yours
imap.authenticate('LOGIN', 'USERNAME', 'PASSWORD')

# Change this to the mailbox you want to read
imap.examine('Inbox')

data = []
count = 0
imap.search(['UNSEEN']).each do |message_id|
    env = imap.fetch(message_id, 'ENVELOPE')[0].attr['ENVELOPE']

    # Filter here, if you want.
    next if /SPAM/i.match(env.subject)

    count += 1

    # Limit to 3 messages, otherwise conky would be too large.
    if count <= 3 then
        if env.sender[0].mailbox then
            addr = ' <' + env.sender[0].mailbox + '@' + env.sender[0].host + '>'
        end
        if (name = env.sender[0].name).nil? then
            name = ''
        end
        if (subject = env.subject).nil? then
            subject = ''
        end
        # Let's limit the length of the subject so as not to stretch conky
        subject.sub!(/(.{25}).*/, '\1...')
        data.push name + addr + "\n    " + subject + "\n"
    end
end

puts "#{count} new messages as of #{Time.now.strftime('%I:%M %p')}"
puts data
