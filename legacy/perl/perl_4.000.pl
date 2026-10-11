#!/usr/bin/perl

# Perl 4.000 reference — released 1991-03-21.
# Perl's own history describes Perl 4 as largely a version-number transition
# around the first Camel book, not a Perl-5-scale redesign.

print "PERL 4.000 REFERENCE\n";

$name = 'Corbie';
@cats = ('CoffeeBean', 'Mocha');
%ages = ('CoffeeBean', 5, 'Mocha', 5);

print "Hello, $name\n";

# Arrays
for ($i = 0; $i <= $#cats; $i++) {
    print "Cat: $cats[$i]\n";
}

# Associative arrays (later called hashes)
print "CoffeeBean age: $ages{'CoffeeBean'}\n";

# Subroutine
sub greet {
    local($who) = @_;
    print "Hello, $who\n";
}

&greet('Mocha');

# File input pattern
# open(FILE, 'example.txt') || die "Cannot open example.txt\n";
# while (<FILE>) {
#     print $_;
# }
# close(FILE);

# Regex and substitution
$text = 'Perl likes text';
$text =~ s/text/patterns/;
print "$text\n";

# ------------------------------------------------------------
# PERL 4.000 QUICK NOTES
# ------------------------------------------------------------
# Official Perl history places Perl 4 in March 1991.
# The language retained the global/package-variable-heavy style of Perl 3.
# Filehandles were typically barewords such as FILE.
# Arrays used @, associative arrays used %, and scalars used $.
#
# Perl 5's lexical my(), references, modules, object model, and use pragmas
# are intentionally absent here.
