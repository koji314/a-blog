#! /usr/bin/env perl

use warnings;
use strict;

my $indoc = 0;
my $indisplaymath = 0;
my @dsubs;
$dsubs[0] = '\\[';
$dsubs[1] = '\\]';

while (<>) {
  if (/\\begin{document}/) {
    $indoc = 1;
  }
  if ($indoc == 1) {
    while (/\s*\${2}\s*/p) {
      my $pre = '';
      my $post = '';
      if (${^PREMATCH} ne '') { $pre = "\n"; }
      $_ =~ s/\s*\${2}\s*/$pre$dsubs[$indisplaymath]\n/;
      $indisplaymath = 1 - $indisplaymath;
    }
  }
  print;
}
