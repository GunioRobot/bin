#!/usr/bin/perl -w

use Net::POP3;
use Net::SMTP;
use Getopt::Std;
use strict;

# Setup vars
my $delay	= 10;			# Delay between connections
my $pop_addr	= "mail.bigtimegeeks.com:110";	# POP3 server:port
my $smtp_addr	= "mail.bigtimegeeks.com:25";		# SMTP server:port
my $from	= "root\@wh0r3.mylan";	# From addy
my $to		= "gregf\@bigtimegeeks.com";	# To addy
my $pop_user	= "gregf\@bigtimegeeks.com";		# POP3 username
my $pop_pass	= "guessme";		# POP3 password

my %flags	= ();
getopt('s:',\%flags);

# Read message from standard input
my $subject	= $flags{s};
my $data	= "From: $from\nTo: $to\nSubject: $subject\n\n" . join('',<STDIN>);

# Login to POP3 server
my $p = Net::POP3->new($pop_addr)	or die "Couldn't connect to POP3 server\n";
$p->login($pop_user=>$pop_pass)		or die $p->message,"\n";
$p->quit();

# Delay
sleep($delay);

# Login to SMTP server
my $s = Net::SMTP->new($smtp_addr)	or die "Couldn't connect to SMTP server\n";
$s->mail($from)				or die $s->message,"\n";
$s->recipient($to)			or die $s->message,"\n";
$s->data($data)				or die $s->message,"\n";
$s->quit();

exit 0;
