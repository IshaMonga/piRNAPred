#!/usr/bin/perl
system "$ARGV[0] >mdtt";
system "cut -d '	' -f 2 $ARGV[1] >thermo";
system "paste -d   mdtt thermo >mdtt-thermo.pat";

