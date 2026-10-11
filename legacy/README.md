# Legacy Language References

These sheets cover older languages that still matter in real systems, education, scientific computing, scripting, and programming-language history.

`legacy/` does **not** mean dead. It means the language has a long history and enough evolution that one "current syntax sheet" can hide important differences.

## Versioning rule

Legacy folders use **real language-standard years or official release names/numbers whenever those exist**. We do not invent `v1.0`, `v2.0`, etc. just for the repository.

Where a language does **not** have one clean official version line (especially Lisp), the folder will use historically accurate dialect/standard names instead and explain the lineage in its README.

## References

| Language | Reference | Status |
|---|---|---|
| COBOL | [`cobol/README.md`](./cobol/README.md) | Complete multi-era set: 1968 → 2023 |
| Fortran | [`fortran/README.md`](./fortran/README.md) | Complete standard-era set: FORTRAN 66 → Fortran 2023 |
| Perl | `perl/` | Planned: selected official major/stable milestone releases, ending with current Perl 5.44 |
| Lisp | `lisp/` | Planned: historically named Lisp/Common Lisp milestones; no fake universal "Lisp version" sequence |

## Approach

Each legacy reference separates three things:

1. **Portable language fundamentals** — syntax and concepts likely to survive across implementations.
2. **Standard-era changes** — what became available in a particular official language revision.
3. **Implementation / vendor behavior** — differences that may appear in real historical or production code.

The goal is not to pretend a 60-year-old language has one universal style. It is to make the evolution visible while still giving you code you can recognize and learn from.

## Current research baseline (October 2026)

- **COBOL:** ISO/IEC 1989:2023 is the current published standard; a newer edition is under development.
- **Fortran:** ISO/IEC 1539-1:2023 is the current published base-language standard. ISO/IEC 1539-1:2023/Cor 1:2026 is published, and the next revision is already under development.
- **Perl:** Perl 5 uses `5.X.Y`; even-numbered `X` values are stable series. Perl 5.44.x is the current stable series in 2026.
- **Lisp:** Lisp is a language family. This repository will distinguish historical Lisp material from ANSI Common Lisp instead of inventing a single version ladder. ANSI Common Lisp is based on INCITS 226-1994.

Whenever implementation support differs sharply, the files say so instead of quietly pretending the differences do not exist.
