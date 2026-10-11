#!/usr/bin/perl

# Perl 1.000 reference — first public Perl release (1987-12-18).
# Conservative syntax only: no 'use', no 'my', no Perl 5 references/modules.

$name = 'Corbie';
$age = 28;
$count = 0;
$total = 0;

print "PERL 1.000 REFERENCE\n";
print "Hello, $name\n";

# Arithmetic
$total = 5 + 3;
$total = $total * 2;
print "Total: $total\n";

# Conditionals
if ($age >= 18) {
    print "Adult\n";
} else {
    print "Minor\n";
}

# Loops
while ($count < 3) {
    print "Count: $count\n";
    $count++;
}

# Regular-expression matching was already central to early Perl.
$text = 'coffee bean';
if ($text =~ /coffee/) {
    print "Matched coffee\n";
}

# Simple substitution
$text =~ s/coffee/black/;
print "$text\n";

# ------------------------------------------------------------
# PERL 1.000 QUICK NOTES
# ------------------------------------------------------------
# Official release date: 1987-12-18.
# Perl 1 was the first public release of the language.
# The early language already centered on scalar variables, text processing,
# regular expressions, print, conditionals, loops, and shell-like scripting.
#
# Do NOT read modern Perl 5 conventions backward into this file:
#   use strict;
#   use warnings;
#   my $lexical;
#   references, modules, modern OO, signatures, etc.
# belong to later generations.
