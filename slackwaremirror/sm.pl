#!/usr/bin/perl

use File::Touch;

my $server="rsync.foo.com";
my $source="slackware";
my $destination="/home/gregf/slackware";
my $options="--archive --compress --delete-after --delete-excluded";
my $lockmsg="archive.update.in.progress";

foreach my $i (0 .. $#ARGV)
{
	$_ = $ARGV[$i];
	slackware-current()	if/^(--slackware-current)$/i;
	slackware81(),next	if/^(--slackware-8.1)$/i;
}

sub slackware-current {
	print "current\n";
}

sub slackware81 {
	print "8.1\n";
}
