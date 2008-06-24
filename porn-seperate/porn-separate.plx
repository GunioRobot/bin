#!/usr/bin/perl

use Getopt::Std;
use File::Copy qw(copy);
use File::Basename;

sub gatherfiles
{
	local *D;
	my @list = ();

	foreach my $file (@_)
	{
		if (-f $file)
		{
			push @list,$file;

		} elsif (-d $file) {

			opendir D,$file;

			while (my $sub_file = readdir D)
			{
				push @list,gatherfiles("$file/$sub_file");
			}

			closedir D;
		} else {
			warn "Warning: skipping $file\n";
		}
	}

	return @list;
}

sub inarray
{
	my ($el,$r_arr) = @_;
	
	foreach my $i (@$r_arr)
	{
		return 1 if $i eq $el;
	}

	return 0;
}

# Process args
my %opts;

getopts('n:cbo:',\%opts);

# Check for arguments
if (length @ARGV == 0 || !exists $opts{n} || !exists $opts{o})
{
	die "Usage: [-bc] $0 -n size -o dir file1 file2 ... fileN

Separates files into directories

Options
	-n size
		Put at most `size' bytes into a directory.
		Quantifiers included appended 'K' for
		kilobytes, 'M' for megabytes, and 'G' for
		gigabtyes.
	-c
		If specified, files will be copied here
		instead of being moved.
	-b
		If specified, try to 'best fit' the data,
		or squeeze as much as possible into a
		directory.
	-o dir
		Output directory; ordered sub-directories
		will be created here comprising the
		selected files
	file1 file2 ... fileN
		A list of files (or directories that will
		be recursively searched) to be separated
		into directories
";
}

sub selectfiles
{
	my $max = shift;
	my ($file,$size);
	my $total = 0;
	my @files = ();

	foreach $file (@_)
	{
		$size = getsize($file);

		if ($total + $size > $max)
		{
			# We've reached our limit
			last;
		} else {
			# This file is okay to include
			push @files,$file;
			$total += $size;
		}
	}

	return \@files;
}

sub getsize
{
	return (stat $_[0])[7];
}

sub getlistsize
{
	my $total = 0;

	foreach my $file (@_)
	{
		$total += getsize($file);
	}

	return $total;
}

sub bestselectfiles
{
	my $max = shift;
	my ($file,$size,$t,@t);
	my @files = ();

	return [] unless @_;

	# Default to all, if possible
	$t = getlistsize(@_);
	if ($t < $max)
	{
		@files = @_;
		$size = $t;
	}

	for (my $i = 0; $i < @_; $i++)
	{
		# Grab best from each "tree"
		@t = @{bestselectfiles($max,splice @_,$i,1,())};
		$t = getlistsize(@t);
		if ($t < $max && $t > $size)
		{
			# We found a better tree
			@files = @t;
			$size = $t;
		}
	}

	return \@files;
}

# Convert {kilo,mega,giga}bytes
$opts{n} *= 1024		if $opts{n} =~ /k$/i;
$opts{n} *= 1024 * 1024		if $opts{n} =~ /m$/i;
$opts{n} *= 1024 * 1024 * 1024	if $opts{n} =~ /g$/i;

# Make sure there's a trailing directory separator
$opts{o} .= "/" unless $opts{o} =~ m{/$};

# Gather file list
my @files = gatherfiles(@ARGV);

my (@chosenfiles,@uniqfiles,$file);

my $moveop = $opts{c} ? "copy" : "rename";
my $selectop = $opts{b} ? "bestselectfiles" : "selectfiles";

my $count = 0;

while (@files)
{
	mkdir "$opts{o}out$count";
	
	@chosenfiles = @{&$selectop($opts{n},@files)};

	# Move/rename files
	foreach $file (@chosenfiles)
	{
		&$moveop($file,$opts{o} . "out$count/" . basename($file));
	}
warn "Done separating (@chosenfiles) into directory (size: ",getlistsize(@chosenfiles),")\n";
	# Calculate unique files for next separation
	@uniqfiles = ();

	foreach $file (@files)
	{
		push @uniqfiles,$file unless inarray($file,\@chosenfiles);
	}

	@files = @uniqfiles;
	$count++;
}

exit 0;
