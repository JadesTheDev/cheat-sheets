# Legacy Language References

These sheets cover older languages that still matter in real systems, education, scientific computing, scripting, and programming-language history.

`legacy/` does **not** mean dead. It means the language has a long history and a lot of surviving code, conventions, and implementation differences.

## References

| Language | Reference | Status |
|---|---|---|
| COBOL | [`cobol/cobol_reference.cob`](./cobol/cobol_reference.cob) | Complete |
| Fortran | `fortran/` | Coming next |
| Perl | `perl/` | Planned |
| Common Lisp | `lisp/` | Planned |

## Approach

Each legacy reference tries to separate three things:

1. **Portable language fundamentals** — syntax and concepts you are likely to encounter across implementations.
2. **Modern surviving practice** — the way the language is commonly written or implemented today.
3. **Historical / vendor-specific behavior** — important differences that may appear in old production code.

The goal is not to pretend a 60-year-old language has one universal style. It is to give you a safe map for recognizing and writing the language while clearly flagging implementation-sensitive territory.

## Current research baseline

- COBOL: ISO/IEC 1989:2023 is the current published standard; a newer edition is under development in 2026.
- Fortran: ISO/IEC 1539-1:2023 is the current published base-language standard, with Corrigendum 1 published in 2026.
- Perl: Perl 5.44 is the current stable series in 2026.
- Lisp: this repository will use **ANSI Common Lisp** as the concrete Lisp dialect, with modern SBCL notes. "Lisp" is a family, not one single standardized language.

Whenever a legacy language differs sharply by compiler or dialect, the sheet says so instead of quietly pretending the differences do not exist.
