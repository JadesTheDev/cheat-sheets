>>SOURCE FORMAT FREE
*> Modern COBOL reference: practical examples for everyday use.
*> Main examples favor broadly supported ISO-style COBOL and GnuCOBOL.
*> Current published standard: ISO/IEC 1989:2023.
*> A newer edition is under development as of 2026, so avoid treating draft-only
*> features as portable until implementations and the standard settle.

IDENTIFICATION DIVISION.
PROGRAM-ID. COBOL-REFERENCE.

ENVIRONMENT DIVISION.
INPUT-OUTPUT SECTION.
FILE-CONTROL.
    SELECT OPTIONAL SAMPLE-FILE
        ASSIGN TO "example.txt"
        ORGANIZATION IS LINE SEQUENTIAL
        FILE STATUS IS WS-FILE-STATUS.

DATA DIVISION.
FILE SECTION.

FD SAMPLE-FILE.
01 SAMPLE-RECORD                PIC X(80).

WORKING-STORAGE SECTION.

*> ============================================================
*> 1. BASIC DATA ITEMS / PICTURE CLAUSE
*> ============================================================

01 WS-NAME                      PIC X(20) VALUE "Corbie".
01 WS-AGE                       PIC 9(3) VALUE 28.
01 WS-COUNT                     PIC 9(3) VALUE ZERO.
01 WS-TOTAL                     PIC S9(7)V99 VALUE ZERO.
01 WS-PRICE                     PIC 9(4)V99 VALUE 4.99.
01 WS-RATE                      PIC 9V999 VALUE 0.075.
01 WS-FLAG                      PIC X VALUE "Y".

*> Implied decimal point: V does not occupy storage.
*> Signed numeric item:
01 WS-BALANCE                   PIC S9(7)V99 VALUE -12.50.

*> Edited numeric item for display:
01 WS-DISPLAY-AMOUNT            PIC $ZZ,ZZ9.99.

*> Packed decimal is common in business systems.
*> COMP-3 is widely supported but is implementation/dialect terminology.
01 WS-PACKED-AMOUNT             PIC S9(7)V99 COMP-3 VALUE 1234.56.

*> Binary/integer storage:
01 WS-BINARY-COUNT              PIC S9(9) COMP VALUE 42.

*> ============================================================
*> 2. GROUP ITEMS / REDEFINES / 88-LEVEL CONDITION NAMES
*> ============================================================

01 WS-PERSON.
    05 WS-FIRST-NAME            PIC X(15) VALUE "CoffeeBean".
    05 WS-LAST-NAME             PIC X(15) VALUE "Cat".
    05 WS-PERSON-AGE            PIC 9(3) VALUE 5.

01 WS-STATUS                    PIC X VALUE "A".
    88 STATUS-ACTIVE            VALUE "A".
    88 STATUS-INACTIVE          VALUE "I".

01 WS-DATE-NUMERIC              PIC 9(8) VALUE 20261011.
01 WS-DATE-TEXT REDEFINES WS-DATE-NUMERIC PIC X(8).

*> ============================================================
*> 3. TABLES / OCCURS / SUBSCRIPTS
*> ============================================================

01 WS-NUMBERS.
    05 WS-NUMBER OCCURS 5 TIMES PIC 9(3)
        VALUE 10 20 30 40 50.

01 WS-INDEX                     PIC 9(2) VALUE ZERO.

*> ============================================================
*> 4. STRING WORK AREAS
*> ============================================================

01 WS-FULL-NAME                 PIC X(40) VALUE SPACES.
01 WS-INPUT-TEXT                PIC X(40) VALUE "red,green,blue".
01 WS-COLOR-1                   PIC X(10) VALUE SPACES.
01 WS-COLOR-2                   PIC X(10) VALUE SPACES.
01 WS-COLOR-3                   PIC X(10) VALUE SPACES.
01 WS-TALLY                     PIC 9(3) VALUE ZERO.

*> ============================================================
*> 5. FILE STATUS / END-OF-FILE
*> ============================================================

01 WS-FILE-STATUS               PIC XX VALUE SPACES.
01 WS-END-OF-FILE               PIC X VALUE "N".
    88 END-OF-FILE              VALUE "Y".
    88 NOT-END-OF-FILE          VALUE "N".

*> ============================================================
*> 6. DATE / TIME / FUNCTION RESULTS
*> ============================================================

01 WS-CURRENT-DATE              PIC X(21).
01 WS-UPPER-NAME                PIC X(20).

PROCEDURE DIVISION.

MAIN.
    PERFORM DEMO-OUTPUT
    PERFORM DEMO-MOVES-AND-MATH
    PERFORM DEMO-CONDITIONS
    PERFORM DEMO-LOOPS
    PERFORM DEMO-STRINGS
    PERFORM DEMO-TABLE
    PERFORM DEMO-INTRINSICS
    PERFORM DEMO-FILE-IO

    DISPLAY "COBOL reference finished."
    STOP RUN.

*> ============================================================
*> 7. OUTPUT / INPUT
*> ============================================================

DEMO-OUTPUT.
    DISPLAY "Hello, world!"
    DISPLAY "Name: " WS-NAME
    DISPLAY "Age:  " WS-AGE

    *> ACCEPT reads from the environment/console.
    *> Uncomment for interactive use:
    *> DISPLAY "Enter your name: " WITH NO ADVANCING
    *> ACCEPT WS-NAME
    *> DISPLAY "Hello, " WS-NAME
    .

*> ============================================================
*> 8. MOVE / INITIALIZE / SET
*> ============================================================

DEMO-MOVES-AND-MATH.
    MOVE "Mocha" TO WS-NAME
    MOVE 29 TO WS-AGE

    INITIALIZE WS-FULL-NAME

    SET STATUS-ACTIVE TO TRUE

    ADD 5 TO WS-COUNT
    SUBTRACT 2 FROM WS-COUNT
    MULTIPLY WS-COUNT BY 3
    DIVIDE WS-COUNT BY 2

    COMPUTE WS-TOTAL = (WS-PRICE * 3) + 10.00

    *> ROUNDED can be added where rounding is required.
    COMPUTE WS-BALANCE ROUNDED = WS-TOTAL / 3

    MOVE WS-TOTAL TO WS-DISPLAY-AMOUNT
    DISPLAY "Total: " WS-DISPLAY-AMOUNT
    .

*> ============================================================
*> 9. CONDITIONS / IF / EVALUATE
*> ============================================================

DEMO-CONDITIONS.
    IF WS-AGE >= 18
        DISPLAY "Adult"
    ELSE
        DISPLAY "Minor"
    END-IF

    IF STATUS-ACTIVE
        DISPLAY "Status is active"
    END-IF

    *> AND / OR / NOT work in compound conditions.
    IF WS-AGE >= 18 AND WS-FLAG = "Y"
        DISPLAY "Condition matched"
    END-IF

    *> EVALUATE is COBOL's multi-way selection structure.
    EVALUATE TRUE
        WHEN WS-AGE < 13
            DISPLAY "Child"
        WHEN WS-AGE < 18
            DISPLAY "Teen"
        WHEN OTHER
            DISPLAY "Adult"
    END-EVALUATE

    EVALUATE WS-STATUS
        WHEN "A"
            DISPLAY "Active"
        WHEN "I"
            DISPLAY "Inactive"
        WHEN OTHER
            DISPLAY "Unknown"
    END-EVALUATE
    .

*> ============================================================
*> 10. LOOPS / PERFORM
*> ============================================================

DEMO-LOOPS.
    MOVE 1 TO WS-COUNT

    PERFORM UNTIL WS-COUNT > 3
        DISPLAY "UNTIL count: " WS-COUNT
        ADD 1 TO WS-COUNT
    END-PERFORM

    PERFORM VARYING WS-INDEX FROM 1 BY 1
        UNTIL WS-INDEX > 5
        DISPLAY "VARYING index: " WS-INDEX
    END-PERFORM

    *> Paragraph-style PERFORM:
    PERFORM SMALL-TASK 2 TIMES
    .

SMALL-TASK.
    DISPLAY "Performed paragraph."
    .

*> ============================================================
*> 11. STRINGS / STRING / UNSTRING / INSPECT
*> ============================================================

DEMO-STRINGS.
    MOVE SPACES TO WS-FULL-NAME

    STRING
        WS-FIRST-NAME DELIMITED BY SPACE
        " " DELIMITED BY SIZE
        WS-LAST-NAME DELIMITED BY SPACE
        INTO WS-FULL-NAME
    END-STRING

    DISPLAY "Full name: " WS-FULL-NAME

    UNSTRING WS-INPUT-TEXT
        DELIMITED BY ","
        INTO WS-COLOR-1 WS-COLOR-2 WS-COLOR-3
    END-UNSTRING

    DISPLAY "Colors: " WS-COLOR-1 " / "
        WS-COLOR-2 " / " WS-COLOR-3

    MOVE ZERO TO WS-TALLY
    INSPECT WS-INPUT-TEXT
        TALLYING WS-TALLY FOR ALL ","
    DISPLAY "Comma count: " WS-TALLY

    *> Reference modification: identifier(start:length)
    DISPLAY "First four chars: " WS-NAME(1:4)
    .

*> ============================================================
*> 12. TABLES / OCCURS
*> ============================================================

DEMO-TABLE.
    PERFORM VARYING WS-INDEX FROM 1 BY 1
        UNTIL WS-INDEX > 5
        DISPLAY "Table value: " WS-NUMBER(WS-INDEX)
    END-PERFORM
    .

*> ============================================================
*> 13. INTRINSIC FUNCTIONS
*> ============================================================

DEMO-INTRINSICS.
    MOVE FUNCTION CURRENT-DATE TO WS-CURRENT-DATE
    MOVE FUNCTION UPPER-CASE(WS-NAME) TO WS-UPPER-NAME

    DISPLAY "Current date/time: " WS-CURRENT-DATE
    DISPLAY "Uppercase name: " WS-UPPER-NAME
    DISPLAY "Length: " FUNCTION LENGTH(WS-NAME)
    DISPLAY "Max: " FUNCTION MAX(10 20 30)
    DISPLAY "Min: " FUNCTION MIN(10 20 30)
    .

*> ============================================================
*> 14. FILE I/O
*> ============================================================

DEMO-FILE-IO.
    *> Write a line-sequential text file.
    OPEN OUTPUT SAMPLE-FILE

    IF WS-FILE-STATUS = "00"
        MOVE "Hello from COBOL." TO SAMPLE-RECORD
        WRITE SAMPLE-RECORD
        CLOSE SAMPLE-FILE
    ELSE
        DISPLAY "Open-for-output failed, status "
            WS-FILE-STATUS
    END-IF

    *> Read it back.
    SET NOT-END-OF-FILE TO TRUE
    OPEN INPUT SAMPLE-FILE

    IF WS-FILE-STATUS = "00"
        PERFORM UNTIL END-OF-FILE
            READ SAMPLE-FILE
                AT END
                    SET END-OF-FILE TO TRUE
                NOT AT END
                    DISPLAY "File: " SAMPLE-RECORD
            END-READ
        END-PERFORM
        CLOSE SAMPLE-FILE
    ELSE
        DISPLAY "Open-for-input failed, status "
            WS-FILE-STATUS
    END-IF
    .

*> ============================================================
*> 15. COMMON FILE MODES / OPERATIONS
*> ============================================================
*>
*> OPEN INPUT       -> read existing file
*> OPEN OUTPUT      -> create/replace for writing
*> OPEN EXTEND      -> append
*> OPEN I-O         -> read and update
*>
*> READ             -> retrieve a record
*> WRITE            -> add/write a record
*> REWRITE          -> replace an existing record
*> DELETE           -> remove a record (for supported organizations)
*> START            -> position in indexed/relative files
*> CLOSE            -> close the file
*>
*> Sequential, relative, indexed, and line-sequential organization
*> support varies by compiler/runtime and selected dialect.

*> ============================================================
*> 16. SORTING / SEARCHING NOTES
*> ============================================================
*>
*> SORT and MERGE are first-class COBOL verbs for record processing.
*> SEARCH works with tables; SEARCH ALL performs a binary search on a
*> properly ordered table.
*>
*> Example shape:
*>
*> SEARCH WS-NUMBER
*>     AT END
*>         DISPLAY "Not found"
*>     WHEN WS-NUMBER(WS-INDEX) = 30
*>         DISPLAY "Found"
*> END-SEARCH

*> ============================================================
*> 17. SUBPROGRAM / CALL PATTERN
*> ============================================================
*>
*> Caller:
*>     CALL "MY-SUBPROGRAM"
*>         USING BY REFERENCE SOME-VALUE
*>         RETURNING RESULT-CODE
*>     END-CALL
*>
*> Callee commonly defines:
*>     LINKAGE SECTION.
*>     01 SOME-VALUE PIC 9(4).
*>     PROCEDURE DIVISION USING SOME-VALUE.
*>
*> Exact calling conventions and RETURNING support can be
*> implementation-sensitive, especially when interoperating with C,
*> Java, or platform-specific runtimes.

*> ============================================================
*> 18. COPYBOOKS
*> ============================================================
*>
*> COPY statements insert reusable source text at compile time.
*>
*>     COPY CUSTOMER-RECORD.
*>
*> REPLACING can substitute text while copying:
*>
*>     COPY TEMPLATE
*>         REPLACING ==:PREFIX:== BY ==WS==.
*>
*> Copybook search paths and file-name conventions are compiler-specific.

*> ============================================================
*> 19. COMMON DATA STORAGE REMINDERS
*> ============================================================
*>
*> PIC X(n)         -> alphanumeric
*> PIC 9(n)         -> unsigned numeric display
*> PIC S9(n)        -> signed numeric
*> V                -> implied decimal point
*> Z                -> suppress leading zero during editing
*> COMP / BINARY    -> binary representation (dialect details vary)
*> COMP-3           -> packed decimal (widely used extension/usage)
*>
*> Financial/business data often uses fixed decimal representations.
*> Avoid assuming internal byte layout when moving files between
*> compilers, platforms, encodings, or mainframe/distributed systems.

*> ============================================================
*> 20. SCOPE TERMINATORS / PERIODS
*> ============================================================
*>
*> Prefer explicit scope terminators in modern COBOL:
*> END-IF, END-EVALUATE, END-PERFORM, END-READ, END-WRITE,
*> END-STRING, END-UNSTRING, END-CALL, etc.
*>
*> A period ends the current sentence and can terminate multiple open
*> scopes. That is historically normal COBOL, but overusing periods in
*> deeply nested logic can make control flow harder to reason about.

*> ============================================================
*> 21. FIXED FORMAT VS FREE FORMAT
*> ============================================================
*>
*> Traditional COBOL source uses fixed columns with Area A / Area B,
*> sequence-number columns, and an indicator area.
*>
*> This file uses free-format source via:
*>     >>SOURCE FORMAT FREE
*>
*> Free format is easier to read in modern editors, but old codebases
*> and mainframe shops may still use fixed-format conventions.

*> ============================================================
*> 22. CURRENT COBOL NOTES (2026)
*> ============================================================
*>
*> - ISO/IEC 1989:2023 is the current published COBOL standard.
*> - ISO is developing the next edition; a Draft International Standard
*>   is in progress in 2026. Draft features are not treated here as
*>   portable production syntax.
*> - GnuCOBOL 3.2 is the latest packaged release on SourceForge.
*> - The GnuCOBOL project also maintains a 3.3 development/stable branch
*>   and a 4.0 testing branch. Those are moving implementation targets.
*> - GnuCOBOL implements substantial portions of COBOL 85, 2002, 2014,
*>   and 2023 plus compiler-specific compatibility dialects.
*> - Enterprise COBOL varies by vendor (IBM, Micro Focus/OpenText,
*>   GnuCOBOL, ACUCOBOL, etc.). Always check the target compiler's
*>   dialect, encoding, file organization, and runtime documentation.
*>
*> Useful GnuCOBOL command shapes:
*>
*>     cobc -x -free cobol_reference.cob
*>     ./cobol_reference
*>
*> Ask the compiler which dialect/options are available:
*>
*>     cobc --help
*>     cobc -info
*>
*> The reference intentionally favors readable, explicit constructs
*> over vendor-only shortcuts.
