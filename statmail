#! /usr/bin/perl -w
# $Id: statmail,v 1.8 2006/11/29 20:42:01 dhag Exp $
# A replacement for procmail's "mailstat" program that actually works.

# Copyright 2004, 2006 David Haguenauer
# Contact: dhag@users.sf.net

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

use strict;
require 5.002;
my $rcsid = '$Id: statmail,v 1.8 2006/11/29 20:42:01 dhag Exp $';

use POSIX qw(floor);

sub sanitize_boxname ($) {
    my ($folder) = @_;

    if ($folder =~ /(.*)\/(?:cur|new|tmp).*/) {
        $folder = $1;
    }

    return $folder;
}


## Step 1: collect underpants
my %count = ();
my %sizes = ();
while (<>) {
    if (/^  Folder: (\S+)\s+([0-9]+)$/) {
        my ($folder, $size) = ($1, $2);

        my $fol = sanitize_boxname $folder;

        $count{$fol}++;
        $sizes{$fol} += $size;
    }
}


## Step 2: ????
my $cw = 10;                    # column width
my $fmt = "%${cw}s %${cw}s %${cw}s %s\n";
my $fmthdr = "%${cw}.${cw}s %${cw}.${cw}s %${cw}.${cw}s %s\n";
my $hdr = sprintf $fmthdr, '-' x 16, '-' x 16, '-' x 16, '-' x 16;


printf $fmt, 'Total', 'Average', 'Number', 'Folder';
print $hdr;

my ($gtotsz, $gtotct) = (0, 0);
foreach my $key (sort keys %count) {
    # lists folders in an arbitrary order
    my $folder = $key;
    my $totsz = $sizes{$key};
    my $count = $count{$key};

    my $avgsz = floor $totsz / $count;
    $gtotsz += $totsz;
    $gtotct += $count;
    printf $fmt, $totsz, $avgsz, $count, $folder;
}


## Step 3: profit!
my $gtotavg = floor $gtotsz / $gtotct;

print $hdr;
printf $fmt, $gtotsz, $gtotavg, $gtotct, '';
