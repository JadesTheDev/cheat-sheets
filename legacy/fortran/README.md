# Fortran by Standard Era

These files use the language's **recognized standard edition names**, not made-up repository version numbers.

The naming convention changes historically: the older language is normally written **FORTRAN** (all caps) through FORTRAN 77, while **Fortran** became the official styling with Fortran 90.

| Standard era | Reference |
|---|---|
| FORTRAN 66 | [`fortran_66.f`](./fortran_66.f) |
| FORTRAN 77 | [`fortran_77.f`](./fortran_77.f) |
| Fortran 90 | [`fortran_90.f90`](./fortran_90.f90) |
| Fortran 95 | [`fortran_95.f90`](./fortran_95.f90) |
| Fortran 2003 | [`fortran_2003.f90`](./fortran_2003.f90) |
| Fortran 2008 | [`fortran_2008.f90`](./fortran_2008.f90) |
| Fortran 2018 | [`fortran_2018.f90`](./fortran_2018.f90) |
| Fortran 2023 | [`fortran_2023.f90`](./fortran_2023.f90) |

## Important filename note

`.f` conventionally means **fixed source form** and `.f90` conventionally means **free source form**. The `.f90` extension does **not** mean a file is restricted to the Fortran 90 standard; later Fortran is commonly stored in `.f90` files too.

## Evolution landmarks

- **FORTRAN 66** — classic fixed-form scientific programming: labels, `DO`, arithmetic `IF`, `GO TO`, `FORMAT`, arrays, subroutines.
- **FORTRAN 77** — character data, block `IF`, and a more structured style while retaining fixed form.
- **Fortran 90** — the huge modernization: free form, modules, derived types, array syntax, allocatables, pointers, recursion, `SELECT CASE`, structured `DO`.
- **Fortran 95** — evolutionary cleanup and additions such as `FORALL`, `PURE`, and stronger array-oriented programming.
- **Fortran 2003** — major object-oriented features, type-bound procedures, C interoperability, and many allocatable/I/O improvements.
- **Fortran 2008** — coarrays, `DO CONCURRENT`, `BLOCK`, `ERROR STOP`, and further parallel/interoperability work.
- **Fortran 2018** — assumed-rank, `SELECT RANK`, enhanced parallel/coarray facilities, locality specs, and further C interoperability.
- **Fortran 2023** — current published base-language standard as of 2026. Technical Corrigendum 1 was published in 2026, and the next revision is already under development.

## Validation

The references were checked with GNU Fortran 14.2.0. FORTRAN 66/77 were compiled in legacy mode; Fortran 90+ files were checked with the strictest matching `-std=` mode GNU Fortran provides (`f95`, `f2003`, `f2008`, `f2018`, `f2023`).

Historical compiler behavior still varied. These files intentionally show recognizable standard-era syntax rather than pretending every old compiler accepted exactly the same program.