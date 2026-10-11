>>SOURCE FORMAT FREE
*> COBOL 2002 reference -- ISO/IEC 1989:2002
*> This file highlights the 2002-era language while keeping examples conservative.

IDENTIFICATION DIVISION.
PROGRAM-ID. COBOL2002.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-NAME              PIC X(20) VALUE "Corbie".
01 WS-COUNT             PIC 9(3) VALUE ZERO.
01 WS-TEXT              PIC X(30) VALUE "hello cobol 2002".
01 WS-UPPER             PIC X(30).
01 WS-NATIONAL-TEXT     PIC N(20).

PROCEDURE DIVISION.
MAIN.
    DISPLAY "COBOL 2002 REFERENCE"

    PERFORM VARYING WS-COUNT FROM 1 BY 1
        UNTIL WS-COUNT > 3
        DISPLAY "COUNT: " WS-COUNT
    END-PERFORM

    MOVE FUNCTION UPPER-CASE(WS-TEXT) TO WS-UPPER
    DISPLAY WS-UPPER

    IF WS-NAME = "Corbie"
        DISPLAY "MATCH"
    END-IF

    *> GOBACK became a standard language element in COBOL 2002.
    GOBACK.

*> ------------------------------------------------------------
*> COBOL 2002 / ISO/IEC 1989:2002 QUICK NOTES
*> ------------------------------------------------------------
*> Major additions associated with COBOL 2002 include:
*> - object-oriented COBOL
*> - free-form source format
*> - user-defined functions
*> - national/Unicode-oriented data support (USAGE NATIONAL)
*> - conditional compilation facilities
*> - exception-handling additions
*> - standardization of GOBACK
*>
*> Object-oriented syntax and exact implementation coverage vary a lot
*> between compilers, so this compact reference does not pretend that
*> every COBOL 2002 OO program is portable across vendors.
*>
*> GnuCOBOL can check this dialect with:
*>     cobc -std=cobol2002 ...
