# Perl by Release Era

Perl is not standardized by ISO/ANSI version years like COBOL or Fortran. Its history is tracked by **official interpreter release numbers**, so this folder uses real Perl release milestones instead of invented repository versions.

| Release milestone | Reference |
|---|---|
| Perl 1.000 (1987) | [`perl_1.000.pl`](./perl_1.000.pl) |
| Perl 2.000 (1988) | [`perl_2.000.pl`](./perl_2.000.pl) |
| Perl 3.019 (1990) | [`perl_3.019.pl`](./perl_3.019.pl) |
| Perl 4.000 (1991) | [`perl_4.000.pl`](./perl_4.000.pl) |
| Perl 5.000 (1994) | [`perl_5.000.pl`](./perl_5.000.pl) |
| Perl 5.44.0 (2026) | [`perl_5.44.0.pl`](./perl_5.44.0.pl) |

## Why these milestones?

The first five files follow Perl's major historical generations. Perl 3.019 is used rather than 3.000 because the official `perlhist` record specifically marks 3.019 as the point where user subroutines arrived. Perl 4.000 was mostly a major-number transition around the first Camel book, while Perl 5.000 was the huge redesign that introduced the extensible Perl 5 language family still maintained today.

The final file jumps to the **current stable Perl 5 series** instead of pretending every annual Perl 5 release needs its own separate syntax sheet. Perl 5 uses a `5.X.Y` numbering scheme: even-numbered `X` values are stable series, odd-numbered `X` values are development series, and `Y` increments are maintenance releases.

As of October 2026, Perl 5.44.x is the current stable series.

## Historical landmarks

- **1.000 — 1987-12-18:** first public Perl release.
- **2.000 — 1988-06-05:** incorporated Henry Spencer's regular-expression package.
- **3.x — 1989-1990:** binary-data handling appeared; 3.019 is recorded as introducing user subroutines.
- **4.000 — 1991:** first Camel-book era; comparatively evolutionary rather than a ground-up language redesign.
- **5.000 — 1994:** major rewrite with references, lexical variables, modules/packages, object-oriented mechanisms, closures, and the extensibility model that defines modern Perl.
- **5.44.0 — 2026:** current stable Perl line used for the full everyday reference.

## Validation policy

The modern/current sheet was syntax-checked on Perl 5.40.1 using only syntax and core facilities that remain valid in current Perl. The historical sheets are intentionally conservative because old Perl interpreters are not normally available on modern systems and later interpreters can accept syntax that did not exist in the named historical release.

For historical behavior, the repository follows Perl's own `perlhist`, versioned perldoc documentation, and release-policy documentation rather than guessing from modern syntax.
