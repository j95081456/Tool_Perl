#!/usr/bin/perl
use strict;
use warnings;

# Usage: perl replace.pl old_string new_string file1 file2

my ($old, $new, $infile, $outfile) = @ARGV;

if (not defined $outfile) {
    die "Usage: perl $0 old_string new_string file1 file2\n";
}

open my $in,  '<', $infile  or die "Cannot open $infile: $!";
open my $out, '>', $outfile or die "Cannot open $outfile: $!";

while (<$in>) {
    s/\Q$old\E/$new/g;   # replace all occurrences, \Q...\E escapes regex chars
    print $out $_;
}

close $in;
close $out;

# Command to Execute:
# ./replace_argv.pl "string1" "string2" input_file output_file