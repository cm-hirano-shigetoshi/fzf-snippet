#!/usr/bin/env perl
use strict;
use warnings;

my ($file, $start);
while (<>) {
    my @s = split(":", $_);
    ($file, $start) = ($s[0], $s[1]);
    last;
}

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

