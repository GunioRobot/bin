#!/usr/bin/env ruby
# gmail checker based off Brian Carpers code $
# http://briancarper.net/conky/check_mail.rb
#
# Modified by Greg Fitzgerald <netzdamon$gmail.com>

%w{rubygems daemons net/imap time}.each { |lib| require lib } 

#TODO detect if the daemon was stopped and report it
#TODO user filters for checkall mailboxes?
#FIXME find out why it crashes on gentoo-dev
#TODO Refactor checkmail
#TODO Rename class/program to something better. Ask mike.
#TODO Seperate config file so password is not readable by all users.

# Edit these
$username = "username@gmail.com"
$password = "password"
$mailboxes = %w[INBOX family friends] #Takes an array of mailboxes you want to monitor
$checkall = false # WARNING: If this is set to true gmail.rb overrides $mailboxes array and monitors every mailbox on the server.
$imapserver = "imap.gmail.com"
$imapport = "993" 
$ssl = true # enable ssl?
$limit = 5 # number of messages to display per inbox
$image = "#{ENV['PWD']}/gmail.png" # path to gmail image or supply your own
$display = ":0.0" # xorg display needed to run in the background
$wait = 600 # Time to wait beetween checks in seconds
$notify = "/usr/bin/notify-send" # path to notify-send
$urgency = "low" # notify-send urgency level low|normal|critical
$strftime = "%I:%M %p" # date format
$verbose = false 

class Gmailer
 
  # This should be used to pass in opts and map them to variables rather
  # than all the global vars.
  def initialize
    init
  end
  
  # Connects to the imap server with our credentials. Tries to rescue from some
  # common errors.
  def init
    begin
      $imap = Net::IMAP.new("#{$imapserver}", "#{$imapport}", $ssl)
    rescue NameError, SocketError
      raise "imap server or port wrong"
    end
    message "Connecting to #{$imapserver} #{$imapport}"
    begin
      $imap.login($username, $password)
    rescue Net::IMAP::NoResponseError
      raise "Invalid username or password"
    end
    message "Using #{$username} and password (hidden)"
  end

  def message(msg)
    # Strip any html I have in there for notify-send
    # Replace &lt and &gt; with <>
    msg = msg.gsub(/<\/?[^>]*>/, "")
    msg = msg.gsub(/&lt;/, "<")
    msg = msg.gsub(/&gt;/, ">")
    # if verbose is on print to stdout
    if $verbose
      $stdout.puts %Q{ #{msg} }
    end
  end

  def notify(*args)
    msg = args[0]
    image = args[1] || false

    # If we received to many args exit and tell the user.
    if args.length > 2
      $stderr.puts %Q{ Expecing 2 got #{args.length} for notify.}
      exit
    end

    # Run notify-send
    if image 
      system(%Q{#{$notify} -u #{$urgency} -i #{$image} "#{msg}"})
    else
      system(%Q{#{$notify} -u #{$urgency} "#{msg}"})
    end
  end

  # Gets a complete list of mailboxes on the server.
  # Attempts to filter out bad ones.
  def list_mailboxes
    mlist = $imap.list("", "%")
    mlist.each do |mbox|
      mbox = mbox[2] # 3rd item in array is the mailbox name
      next if mbox =~ /\[Gmail\]/i # this isn't realy a mailbox we never want to check it.
      next if mbox =~ /gentoo-dev/i # for some reason this is making it crash atm. 
      $mailboxes.push(mbox.strip)
    end
    return $mailboxes.uniq.compact
  end

  # Looks for UNSEEN email and displays the last $limit for each mailbox in
  # $mailboxes.
  def checkmail
    ENV["DISPLAY"] = $display
    init
    # If we set checkall get a list of all mailboxes and override the $mailboxes
    # array from settings just incase.
    if $checkall
      $mailboxes = list_mailboxes
    end

    $mailboxes.each do |mbox|
      message "Checking for mail in: #{mbox}"
      $imap.examine("#{mbox}")
      data = []
      count = 0
        $imap.search(['UNSEEN']).each do |message_id|
            env = $imap.fetch(message_id, 'ENVELOPE')[0].attr['ENVELOPE']

            # Filter here, if you want.
            next if /SPAM/i.match(env.subject)

            count += 1

            # Limit to number of new messages 
            if count <= $limit then
                if env.sender[0].mailbox then
                    addr = '&lt;' + env.sender[0].mailbox + '@' + env.sender[0].host + '&gt;'
                end
                if (name = env.sender[0].name).nil? then
                    name = ''
                end
                if (subject = env.subject).nil? then
                    subject = ''
                end
                # Let's limit the length of the subject.
                subject.sub!(/(.{25}).*/, '\1...')
                data.push name + ":" + addr + ":" + subject
            end
        end
      # If a mailbox has UNSEEN email in it let us know about it.
      unless count <= 0
        newmail = "<b>#{count}</b> new messages in <b>#{mbox}</b> as of #{Time.now.strftime($strftime)}"
        message newmail
        notify("#{newmail}", true)
        data.each do |email|
          email = email.split(":")
          name = email[0]
          addr = email[1]
          subject = email[2]
          message "\t#{name} #{addr} - #{subject}"
          notify("#{name} - #{addr}")
          # If a email doesn't have a subject don't print blank lines.
          unless subject.nil?
            notify("\s\s#{subject}") #tab seems to much here, use \t if you want.
          end
        end
      end
    end
  end
end

check = Gmailer.new

begin
  Daemons.run_proc("#{__FILE__}") do
    check.message "Firing up daemon and checking mail"
    check.notify("#{__FILE__} has started up", true)
    loop do
      check.checkmail
      check.message "sleeping for #{$wait} seconds"
      sleep($wait)
    end
  end
rescue Interrupt
  check.notify("#{__FILE__} has forcefully stopped", true)
  check.message "Deamon was forcefully stopped"
end
