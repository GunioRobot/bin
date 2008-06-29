#!/usr/bin/perl
#
# Check finger @kernel.org. If theres been anything new added since the 
# last check send an email to let you know.
#
# Created by: Greg Fitzgerald
# Email: gregf@bigtimegeeks.com
#
#

use strict;
use Mail::Sendmail;
use File::Compare qw(compare_text);

#
# Functions
#

sub rmtmp {
	system ("rm file1");
}

sub mailme {

open F, "< file1" or die $!;
my $msg;
{ local $/; $msg = <F>; }
close F;

my %mail = ( To	     => 'gregf@bigtimegeeks.com',
	     From    => 'fingerme@mylan.org',
	     Subject => 'New Kernel Released',
	     Message => "$msg",
	  );
$mail{smtp} = 'mail.bigtimegeeks.com';
sendmail(%mail) or die $Mail::Sendmail::error;

print "Ok. Log says:\n", $Mail::Sendmail::log;

}

#
# Main Program
#

rmtmp;
if (-e "hardc") {
	system ("finger \@kernel.org >> file1");
	if (compare_text("hardc","file1") == 0 ) {
		print "equal\n";
		rmtmp;
	}
	else {
		print "not equal\n";
		mailme;
		rmtmp;
	}
}
