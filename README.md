# Programming Cheat Sheets

A compact reference library for programming syntax, logic, and common patterns.

The goal is simple: when you remember *what* you want to do but forget how a particular language spells it, open the matching language reference. When the syntax is familiar but the programming idea itself is fuzzy, open `logic/`.

## Structure

```text
cheat-sheets/
├── logic/          # language-independent programming concepts
├── modern/         # modern language syntax references
│   ├── c/
│   ├── csharp/
│   ├── java/
│   ├── javascript/
│   ├── python/
│   └── sql/
└── legacy/         # older languages with surviving real-world ecosystems
    ├── cobol/
    ├── fortran/    # coming next
    ├── perl/       # planned
    └── lisp/       # planned; ANSI Common Lisp
```

## Logic references

| Concept | Cheat sheet |
|---|---|
| Algorithms / pseudocode / flowcharts | [`logic/algorithms-pseudocode-flowcharts.md`](./logic/algorithms-pseudocode-flowcharts.md) |
| Input → Process → Output | [`logic/input-process-output.md`](./logic/input-process-output.md) |
| Variables / data types | [`logic/variables-and-data-types.md`](./logic/variables-and-data-types.md) |
| Conditionals / Boolean logic | [`logic/conditionals-and-boolean-logic.md`](./logic/conditionals-and-boolean-logic.md) |
| Loops | [`logic/loops.md`](./logic/loops.md) |
| Functions / scope / modules | [`logic/functions-and-scope.md`](./logic/functions-and-scope.md) |
| Collections / sequences | [`logic/collections-and-sequences.md`](./logic/collections-and-sequences.md) |
| Files / exceptions | [`logic/files-and-exceptions.md`](./logic/files-and-exceptions.md) |
| Objects / inheritance | [`logic/objects-and-inheritance.md`](./logic/objects-and-inheritance.md) |
| Recursion | [`logic/recursion.md`](./logic/recursion.md) |

See [`logic/README.md`](./logic/README.md) for the logic-folder index.

## Modern language references

| Language | Reference file |
|---|---|
| C | [`modern/c/c_reference.c`](./modern/c/c_reference.c) |
| C# | [`modern/csharp/csharp_reference.cs`](./modern/csharp/csharp_reference.cs) |
| Java | [`modern/java/JavaReference.java`](./modern/java/JavaReference.java) |
| JavaScript | [`modern/javascript/javascript_reference.js`](./modern/javascript/javascript_reference.js) |
| Python | [`modern/python/python_reference.py`](./modern/python/python_reference.py) |
| SQL | [`modern/sql/sql_reference.sql`](./modern/sql/sql_reference.sql) |

## Legacy language references

| Language | Reference file |
|---|---|
| COBOL | [`legacy/cobol/cobol_reference.cob`](./legacy/cobol/cobol_reference.cob) |
| Fortran | Coming next |
| Perl | Planned |
| ANSI Common Lisp | Planned |

See [`legacy/README.md`](./legacy/README.md) for how legacy references handle standards, dialects, and implementation differences.

## How the pieces fit together

```text
logic/   = WHAT the programming concept means
modern/  = HOW a modern language writes it
legacy/  = HOW an older language writes it
```

The language files are intentionally practical rather than full tutorials. Examples are kept small enough to scan, edit, and run.

## Planned next

- Finish the legacy set: Fortran, Perl, ANSI Common Lisp
- Side-by-side syntax comparison
- Expand individual references as course material adds useful patterns
