#!/usr/bin/perl

# Perl 3.019 reference — 1990 milestone recorded for user subroutines.
# Conservative historical syntax; avoids Perl 5-only features.

print "PERL 3.019 REFERENCE\n";

$name = 'CoffeeBean';
$value = 7;

print "Name: $name\n";

# Perl 3 gained the ability to handle binary data containing embedded NULs.
$binary = "A\0B";
print "Binary-capable string length: ", length($binary), "\n";

# User subroutines are specifically noted in the official release history at 3.019.
sub double_value {
    local($input) = @_;
    return $input * 2;
}

$result = &double_value($value);
print "Doubled: $result\n";

# Pattern matching
$text = 'crow cat crow';
if ($text =~ /cat/) {
    print "Matched cat\n";
}

# Loop
for ($i = 0; $i < 3; $i++) {
    print "Index: $i\n";
}

# ------------------------------------------------------------
# PERL 3.019 QUICK NOTES
# ------------------------------------------------------------
# Perl 3.000 was released 1989-10-18.
# The official perlhist record marks 3.019 (1990-03-02) with "User subs."
# Perl 3 is also remembered for binary-safe strings / embedded NUL handling.
#
# Historical code commonly used package/global variables and local() rather
# than Perl 5's lexical my().
#
# Do not assume Perl 5 references, modules, strict/warnings pragmas, or
# modern object conventions exist in this era.
