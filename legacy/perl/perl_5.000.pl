#!/usr/bin/perl

# Perl 5.000 reference — released 1994-10-17.
# This is the major redesign that established the Perl 5 language family.

use strict;

print "PERL 5.000 REFERENCE\n";

my $name = 'Corbie';
my @cats = ('CoffeeBean', 'Mocha');
my %ages = (
    CoffeeBean => 5,
    Mocha      => 5,
);

print "Hello, $name\n";

# Lexical variables with my()
my $count = 0;
while ($count < 3) {
    print "Count: $count\n";
    $count++;
}

# References
my $array_ref = \@cats;
my $hash_ref  = \%ages;
print "First cat: $array_ref->[0]\n";
print "Mocha age: $hash_ref->{Mocha}\n";

# Anonymous data structures
my $person = {
    name => 'CoffeeBean',
    kind => 'cat',
};
print "$person->{name} is a $person->{kind}\n";

# Subroutines
sub greet {
    my ($who) = @_;
    return "Hello, $who";
}

print greet('Mocha'), "\n";

# Packages underpin Perl 5 modules and object-oriented conventions.
package Cat;

sub new {
    my ($class, $cat_name) = @_;
    my $self = { name => $cat_name };
    return bless $self, $class;
}

sub speak {
    my ($self) = @_;
    return "$self->{name} says meow.";
}

package main;

my $cat = Cat->new('CoffeeBean');
print $cat->speak(), "\n";

# ------------------------------------------------------------
# PERL 5.000 QUICK NOTES
# ------------------------------------------------------------
# Perl 5.000 was released in October 1994 and was a major rewrite.
# Important Perl 5-era foundations include:
#   lexical variables with my()
#   references and nested data structures
#   packages/modules
#   closures
#   object-oriented conventions built on packages + bless
#   a much more extensible language/runtime architecture
#
# Modern Perl 5 has added many features since 5.000, but this file keeps to
# the generation-defining foundations rather than back-porting 2026 syntax.
