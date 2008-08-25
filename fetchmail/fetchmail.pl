#!/usr/bin/perl -W
# $Id: fetchmail.pl,v 1.5 2006/12/19 22:19:23 yanovich Exp $

use integer;
use strict;
use warnings;

$|++;

my $width = 72;
# <-- acctlen ->12<--------------------->123456789
# foo.bar.com	 |-----------------------| xxx/xxx
my $acctlen = 16;
my $bwidth = $width - $acctlen - 2 - 9;

chdir "$ENV{HOME}/mbox" or die "chdir $ENV{HOME}/mbox: $!\n";
open FM, "fetchmail -t 8 -v 2>&1 |" or die "fetchmail: $!\n";
while (defined(my $line = <FM>)) {
	# reading message phirerunner@mail.comcast.net:1 of 1 ...
	if ($line =~ /^reading messages? (.*?):(\d+) of (\d+)/) {
		my $acct = $1;
		my $pos = $2;
		my $total = $3;

		$acct =~ s/.*@//;

		my $stat = $acct;
		$stat .= " " x ($acctlen - length($stat));
		$stat .= " |";

		my $n = $bwidth * $pos / $total;
		$stat .= "=" x $n;
		$stat .= " " x ($bwidth - $n);
		$stat .= "| $pos/$total";
		$stat .= " " x ($width - length($stat));

		print "\r$stat";
	} elsif ($line =~ /fetchmail: .*? querying (.*?) .*: poll started/) {
		my $acct = $1;

		my $stat = "connecting to $acct...";
		$stat .= " " x ($width - length($stat));
		print "\r$stat";
	} elsif ($line =~ /connection to (.*?) failed: /) {
		my $acct = $1;
		my $msg = $';
#		chomp $msg;

		my $stat = "$acct: $msg";
		$stat .= " " x ($width - length($stat));
		print "\r$stat";
	}
}
close FM;
print "\r", " " x $width, "\r";
