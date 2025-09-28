#!/usr/bin/perl
use strict;
use warnings;

my $input  = shift or die "Usage: $0 infile outfile\n";
my $output = shift or die "Usage: $0 infile outfile\n";

open(my $in,  "<", $input)  or die "Cannot open $input: $!";
open(my $out, ">", $output) or die "Cannot write $output: $!";

while (my $line = <$in>) {
    # Remove the target string if found in the line
    $line =~ s/\.lib\s+'\/home\/m111\/m111061571\/cic018\.l'\s+TT\s*//g;
    print $out $line;
}

close($in);
close($out);

print "Done. Output written to $output\n";

# Comment:
# s/.../.../g -> Perl substitution regex.

# Command to Execute:
# ./replace.pl input_file output_file