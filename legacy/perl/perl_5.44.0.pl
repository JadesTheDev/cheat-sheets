#!/usr/bin/env perl

# Modern Perl 5 reference — current stable series: Perl 5.44.x (2026).
# This sheet uses conservative modern Perl 5 syntax and core modules so it
# remains useful across recent supported Perl 5 releases.

use strict;
use warnings;
use feature 'say';
use autodie;
use File::Spec;
use List::Util qw(sum max min);

# ============================================================
# 1. OUTPUT / INPUT / COMMENTS
# ============================================================

say 'Hello, world!';
print "Same line";
print "\n";

# my $input = <STDIN>;
# chomp $input;

# Single-line comments begin with #.
# POD documentation uses =pod ... =cut blocks.

# ============================================================
# 2. SCALARS / ARRAYS / HASHES
# ============================================================

my $name     = 'Corbie';
my $age      = 28;
my $price    = 4.99;
my $is_ready = 1;
my $nothing  = undef;

my @cats = ('CoffeeBean', 'Mocha');
my %ages = (
    CoffeeBean => 5,
    Mocha      => 5,
);

say $cats[0];
say $ages{Mocha};

push @cats, 'Crow';
my $last = pop @cats;
my $count = scalar @cats;

# qw() is convenient for simple word lists.
my @colors = qw(blue green plum);

# ============================================================
# 3. CONTEXT
# ============================================================

# Perl operations can behave differently in scalar vs list context.
my @numbers = (10, 20, 30);
my $number_count = @numbers;       # scalar context -> 3
my ($first, $second) = @numbers;   # list context

say "count=$number_count first=$first second=$second";

# ============================================================
# 4. OPERATORS / COMPARISONS
# ============================================================

my $sum        = 2 + 3;
my $difference = 5 - 2;
my $product    = 4 * 3;
my $quotient   = 10 / 4;
my $remainder  = 10 % 4;
my $power      = 2 ** 3;

# Numeric comparison: == != < <= > >= <=>
# String comparison:  eq ne lt le gt ge cmp

if ($age >= 18 && $name eq 'Corbie') {
    say 'Adult Corbie';
}

# Defined-or operator
my $display_name = $nothing // 'Guest';

# Assignment forms include += -= *= /= .= //= and others.
my $message = 'Hello';
$message .= ', Perl';

# ============================================================
# 5. CONDITIONALS
# ============================================================

if ($age >= 18) {
    say 'Adult';
}
elsif ($age >= 13) {
    say 'Teen';
}
else {
    say 'Child';
}

# Statement modifiers are common Perl style.
say 'Ready' if $is_ready;
say 'Not ready' unless $is_ready;

# Ternary operator
my $category = $age >= 18 ? 'adult' : 'minor';

# ============================================================
# 6. LOOPS
# ============================================================

for my $i (0 .. 4) {
    say $i;
}

for my $cat (@cats) {
    say "Cat: $cat";
}

my $index = 0;
while ($index < @cats) {
    say $cats[$index];
    $index++;
}

# next = continue; last = break; redo restarts current iteration.
for my $n (1 .. 10) {
    next if $n == 2;
    last if $n == 5;
    say $n;
}

# ============================================================
# 7. SUBROUTINES
# ============================================================

sub add {
    my ($a, $b) = @_;
    return $a + $b;
}

sub greet {
    my ($person) = @_;
    $person //= 'Guest';
    return "Hello, $person!";
}

say add(2, 3);
say greet($name);

# @_ contains arguments for the current subroutine.
# Perl historically permits calls with or without parentheses depending on context;
# using parentheses consistently is easier to read.

# ============================================================
# 8. REFERENCES / NESTED DATA
# ============================================================

my $array_ref = \@cats;
my $hash_ref  = \%ages;

say $array_ref->[0];
say $hash_ref->{CoffeeBean};

my $homestead = {
    cats => [
        { name => 'CoffeeBean', color => 'black' },
        { name => 'Mocha', color => 'tortoiseshell' },
    ],
    active => 1,
};

say $homestead->{cats}[1]{name};

# Anonymous structures
my $point = [10, 20];
my $user  = { name => 'Corbie', age => 28 };

# ============================================================
# 9. STRINGS
# ============================================================

my $single = 'No interpolation: $name';
my $double = "Interpolation: $name";

my $text = '  Hello Perl  ';
$text =~ s/^\s+|\s+$//g;

my @words = split /\s+/, $text;
my $joined = join '-', @words;

say uc $text;
say lc $text;
say length $text;
say substr($text, 0, 5);
say $joined;

# qq// behaves roughly like double quotes; q// roughly like single quotes.
my $quoted = qq{Name: $name};

# ============================================================
# 10. REGULAR EXPRESSIONS
# ============================================================

my $sentence = 'CoffeeBean is a black cat';

if ($sentence =~ /black\s+cat/) {
    say 'Regex matched';
}

$sentence =~ s/black/very black/;

my @matches = $sentence =~ /(\w+)/g;
say join ', ', @matches;

# Common modifiers:
# /i case-insensitive
# /m ^ and $ operate per line
# /s dot matches newline
# /x extended/readable regex layout
# /g global/repeated matching

# Prefer qr// for reusable regex objects.
my $cat_pattern = qr/\bcat\b/i;
say 'Contains cat' if $sentence =~ $cat_pattern;

# ============================================================
# 11. HASH ITERATION / SORTING
# ============================================================

for my $key (sort keys %ages) {
    say "$key => $ages{$key}";
}

my @sorted_numbers = sort { $a <=> $b } @numbers;
my @sorted_cats    = sort { $a cmp $b } @cats;

# ============================================================
# 12. FILE I/O
# ============================================================

my $path = File::Spec->catfile('.', 'example.txt');

# autodie turns many file-operation failures into exceptions automatically.
# open my $out, '>', $path;
# print {$out} "Hello from Perl\n";
# close $out;
#
# open my $in, '<', $path;
# while (my $line = <$in>) {
#     chomp $line;
#     say $line;
# }
# close $in;

# Three-argument open is preferred in modern Perl:
# open my $fh, '<', $filename;

# ============================================================
# 13. EXCEPTIONS / eval
# ============================================================

my $result = eval {
    die "Something went wrong\n" if 0;
    42;
};

if ($@) {
    warn "Caught error: $@";
}
else {
    say "Result: $result";
}

# eval BLOCK is Perl's traditional exception-catching mechanism.
# CPAN modules may provide richer exception systems, but they are not core syntax.

# ============================================================
# 14. PACKAGES / MODULES / OBJECTS
# ============================================================

{
    package Cat;

    sub new {
        my ($class, %args) = @_;
        my $self = {
            name  => $args{name}  // 'Unnamed',
            color => $args{color} // 'unknown',
        };
        return bless $self, $class;
    }

    sub speak {
        my ($self) = @_;
        return "$self->{name} says meow.";
    }
}

my $cat = Cat->new(name => 'CoffeeBean', color => 'black');
say $cat->speak;

# A normal module is typically stored as Some/Module.pm and ends with a true value:
# package Some::Module;
# ...
# 1;

# Load modules with use (compile time) or require (runtime).

# ============================================================
# 15. CORE MODULE / FUNCTION EXAMPLES
# ============================================================

say 'sum=', sum(@numbers);
say 'max=', max(@numbers);
say 'min=', min(@numbers);

# Many capabilities live on CPAN rather than in the core distribution.
# Check module documentation with:
#   perldoc Module::Name
# and search CPAN via MetaCPAN.

# ============================================================
# 16. SPECIAL VARIABLES YOU WILL SEE IN REAL PERL
# ============================================================

# $_   default topic variable used by many operators
# @_   current subroutine arguments
# $@   most recent eval exception
# $!   operating-system error string/number
# @ARGV command-line arguments
# %ENV environment variables
# $.   current input line number for last filehandle accessed

# Explicit lexical variables are usually clearer than leaning heavily on globals.

# ============================================================
# 17. COMMON GOTCHAS
# ============================================================

# 1. Use eq/ne for strings and ==/!= for numbers.
# 2. Scalar and list context can change an expression's behavior.
# 3. undef, empty string, "0", and numeric 0 are all false in boolean context.
# 4. $array[0] accesses an array element; @array refers to the whole array.
# 5. $hash{key} accesses a hash value; %hash refers to the whole hash.
# 6. References use -> for nested access: $ref->{key}, $ref->[0].
# 7. Regexes are language syntax, not a separate library bolted on later.
# 8. Bareword filehandles and two-argument open appear in old code; modern code
#    generally prefers lexical filehandles and three-argument open.
# 9. 'use strict; use warnings;' should be the normal baseline for new Perl code.
# 10. CPAN is a huge part of real Perl development; core Perl alone is not the
#     entire ecosystem.

# ============================================================
# 18. CURRENT RELEASE POLICY (2026)
# ============================================================

# Perl versions use 5.X.Y.
# - even X -> stable release series (5.40, 5.42, 5.44)
# - odd X  -> development series leading to the next stable release
# - Y      -> maintenance/security/critical-fix release within a stable series
#
# Perl 5.44.x became the current stable series in July 2026.
# The Perl project normally produces a new stable series about once per year.
#
# Check your interpreter:
#   perl -v
#   perl -V
#
# Check syntax only:
#   perl -c perl_5.44.0.pl
