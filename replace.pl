#!/usr/bin/perl
use strict;
use warnings;

my $infile  = shift or die "Usage: $0 infile outfile\n";
my $outfile = shift or die "Usage: $0 infile outfile\n";

open my $in,  '<', $infile  or die "Can't open $infile: $!";
open my $out, '>', $outfile or die "Can't open $outfile: $!";

my $L1 = "string1";
my $R1 = "string2";

while (my $line = <$in>) {
    # Replace .lib ... TT → .lib ... FF
    # $line =~ s/(\.lib\s+'[^']+'\s*)TT(\s*)$/${1}FF${2}/;

    # Replace .temp 25 → .temp 50
    # $line =~ s/(\.temp\s+)25(\s*)$/${1}50${2}/;

    $line =~ s/$L1/$R1/g;

    print $out $line;
}

close $in;
close $out;

# Comment:
# s/(\.lib\s+'[^']+'\s*)TT(\s*)$/${1}FF${2}/
# s/  (\.lib\s+'[^']+'\s*)TT(\s*)$  /  ${1}FF${2}  /
# s/  ...                           /  ...         / -> substitution
# Group1: (\.lib\s+'[^']+'\s*)
# Group2: (\s*)
# \.lib      -> \. escapes the dot
# \s+        -> one or more whitespace characters
# '[^']+'    -> a quoted string, e.g. 'xxx.lib'
# \s*        -> optional spaces after that
# (\s*)$     -> optional spaces & end of line
# ${1}FF${2} -> group1 + FF + group2

# Command to Execute:
# ./replace.pl input_file output_file
