>>SOURCE FORMAT FREE
*> COBOL 2014 reference -- ISO/IEC 1989:2014
*> Practical core syntax plus features associated with the 2014 standard.

IDENTIFICATION DIVISION.
PROGRAM-ID. COBOL2014.

DATA DIVISION.
WORKING-STORAGE SECTION.
01 WS-NAME              PIC X(20) VALUE "Corbie".
01 WS-AGE               PIC 9(3) VALUE 28.
01 WS-COUNT             PIC 9(3) VALUE ZERO.
01 WS-STATUS            PIC X VALUE "A".
   88 STATUS-ACTIVE     VALUE "A".
01 WS-TEXT              PIC X(40) VALUE "hello cobol 2014".
01 WS-UPPER             PIC X(40).

PROCEDURE DIVISION.
MAIN.
    DISPLAY "COBOL 2014 REFERENCE"

    IF WS-AGE >= 18
        DISPLAY "ADULT"
    ELSE
        DISPLAY "MINOR"
    END-IF

    EVALUATE TRUE
        WHEN WS-AGE < 13
            DISPLAY "CHILD"
        WHEN WS-AGE < 18
            DISPLAY "TEEN"
        WHEN OTHER
            DISPLAY "ADULT"
    END-EVALUATE

    PERFORM VARYING WS-COUNT FROM 1 BY 1
        UNTIL WS-COUNT > 3
        DISPLAY "COUNT: " WS-COUNT
    END-PERFORM

    MOVE FUNCTION UPPER-CASE(WS-TEXT) TO WS-UPPER
    DISPLAY WS-UPPER

    GOBACK.

*> ------------------------------------------------------------
*> COBOL 2014 / ISO/IEC 1989:2014 QUICK NOTES
*> ------------------------------------------------------------
*> COBOL 2014 built on the large COBOL 2002 revision.
*> Features associated with the 2014 standard include expanded
*> support for modern data processing, dynamic-capacity tables,
*> JSON GENERATE / JSON PARSE, XML facilities, VALIDATE, and
*> additional numeric / floating-point capabilities.
*>
*> IMPORTANT: implementation support is uneven. A statement being in
*> the 2014 standard does not guarantee that an installed IBM,
*> Micro Focus/OpenText, or GnuCOBOL compiler implements it identically.
*>
*> GnuCOBOL provides a strict dialect mode:
*>     cobc -std=cobol2014 ...
