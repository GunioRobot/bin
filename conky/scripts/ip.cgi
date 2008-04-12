#!/usr/bin/perl

# by Brian Carper
# http://briancarper.net
#
# This script returns your IP address as seen by the
# server which is running this script.
#
# Helpful if you run a NAT firewall, if you run this script
# on a public server outside your LAN.
#
# Run this as a CGI script, obviously.

use strict;
use warnings;
use CGI qw(:standard);

print header();
defined remote_host() ? print remote_host() : print "0";
