#!/usr/bin/perl
use strict;
use warnings;

my $infile  = shift or die "Usage: $0 infile outfile\n";
my $outfile = shift or die "Usage: $0 infile outfile\n";

open(my $in,  "<", $infile)  or die "Cannot open $infile: $!";
open(my $out, ">", $outfile) or die "Cannot open $outfile: $!";

while (my $line = <$in>) {
    print $out $line;
    if ($line =~ /\.lib/) { 
        print $out "This is a inserted string\n";
    }
}

close($in);
close($out);

# Comment:
# if ($line =~ /\.lib/) -> checks if the line contains .lib
# =~ "matches" operator in Perl

# Command to Execute:
# ./replace.pl input_file output_file