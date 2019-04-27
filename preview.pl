#!/usr/bin/env perl
use strict;
use warnings;

my ($file, $start) = @ARGV;
open(IN, $file);
my $i = 0;
while (<IN>) {
    $i++;
    if ($i > $start) {
        if (/^\S/) {
            last;
        }
        s/^    //;
        print;
    }
}
close(IN);

