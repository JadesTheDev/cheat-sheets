#!/usr/bin/perl

# Perl 2.000 reference — released 1988-06-05.
# Conservative historical syntax; avoids later Perl 5 constructs.

$name = 'Mocha';
$count = 1;
$text = 'red green blue';

print "PERL 2.000 REFERENCE\n";
print "Name: $name\n";

# Regular expressions became more capable in the Perl 2 era.
if ($text =~ /green/) {
    print "Found green\n";
}

$text =~ s/green/gold/;
print "$text\n";

# Looping
while ($count <= 3) {
    print "Count: $count\n";
    $count++;
}

# Numeric comparison vs string comparison
$number = 10;
if ($number > 5) {
    print "Numeric comparison matched\n";
}

$word = 'cat';
if ($word eq 'cat') {
    print "String comparison matched\n";
}

# ------------------------------------------------------------
# PERL 2.000 QUICK NOTES
# ------------------------------------------------------------
# Official release date: 1988-06-05.
# Perl's own history notes Perl 2 for incorporating Henry Spencer's
# regular-expression package.
#
# Keep this sheet intentionally small: later Perl interpreters are highly
# backward-compatible, so using a modern interpreter is not proof that a
# feature existed in Perl 2.
#
# Still avoid later constructs such as:
#   my / lexical scoping
#   references
#   use / modules
#   Perl 5 object conventions
