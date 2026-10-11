# COBOL by Standard Era

These files are named for **actual COBOL standard years**, not made-up repository version numbers.

The point is to show how COBOL evolved without pretending every old compiler implemented every standard identically.

| Standard era | Reference |
|---|---|
| ANSI COBOL 1968 | [`cobol_1968.cob`](./cobol_1968.cob) |
| ANSI COBOL 1974 | [`cobol_1974.cob`](./cobol_1974.cob) |
| COBOL 1985 / ISO 1989:1985 | [`cobol_1985.cob`](./cobol_1985.cob) |
| COBOL 2002 / ISO/IEC 1989:2002 | [`cobol_2002.cob`](./cobol_2002.cob) |
| COBOL 2014 / ISO/IEC 1989:2014 | [`cobol_2014.cob`](./cobol_2014.cob) |
| COBOL 2023 / ISO/IEC 1989:2023 | [`cobol_2023.cob`](./cobol_2023.cob) |

## Big evolutionary landmarks

- **1968** — first ANSI COBOL standard.
- **1974** — additions such as `INSPECT`, `STRING`, and `UNSTRING` became part of standard-era COBOL.
- **1985** — major structured-programming modernization: explicit scope terminators, inline `PERFORM`, `EVALUATE`, `CONTINUE`, `INITIALIZE`, reference modification, and more.
- **2002** — object-oriented COBOL, free-form source, user-defined functions, national character support, and other large language additions.
- **2014** — further modern data-processing and interoperability features, including standardized JSON/XML-related facilities and other extensions.
- **2023** — current published COBOL standard as of 2026. A newer edition is already under development, so draft-only features are not treated as portable here.

## Important warning

COBOL is unusually implementation-sensitive. IBM Enterprise COBOL, Micro Focus/OpenText COBOL, GnuCOBOL, and historical compilers may differ in syntax accepted, storage representation, file organizations, encodings, extensions, and how completely newer standards are implemented.

The historical sheets intentionally use conservative examples. The 2023 sheet is the full everyday reference.
