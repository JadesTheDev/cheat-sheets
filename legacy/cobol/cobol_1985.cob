       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOL1985.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-AGE         PIC 99 VALUE 28.
       01  WS-COUNT       PIC 99 VALUE ZERO.
       01  WS-STATUS      PIC X VALUE 'A'.
           88 STATUS-ACTIVE   VALUE 'A'.
           88 STATUS-INACTIVE VALUE 'I'.
       01  WS-TEXT        PIC X(20) VALUE 'HELLO COBOL'.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY 'COBOL 1985 REFERENCE'

           IF WS-AGE >= 18
               DISPLAY 'ADULT'
           ELSE
               DISPLAY 'MINOR'
           END-IF

           EVALUATE WS-STATUS
               WHEN 'A'
                   DISPLAY 'ACTIVE'
               WHEN 'I'
                   DISPLAY 'INACTIVE'
               WHEN OTHER
                   DISPLAY 'UNKNOWN'
           END-EVALUATE

           INITIALIZE WS-COUNT

           PERFORM VARYING WS-COUNT FROM 1 BY 1
               UNTIL WS-COUNT > 3
               DISPLAY 'COUNT: ' WS-COUNT
           END-PERFORM

           IF STATUS-ACTIVE
               CONTINUE
           END-IF

           DISPLAY 'SLICE: ' WS-TEXT(1:5)
           STOP RUN.

      * ------------------------------------------------------------
      * COBOL 1985 / ISO 1989:1985 QUICK NOTES
      * ------------------------------------------------------------
      * This is the huge structural modernization point in COBOL.
      * Important standard-era additions include explicit scope
      * terminators (END-IF, END-PERFORM, etc.), inline PERFORM,
      * EVALUATE, CONTINUE, INITIALIZE, reference modification,
      * and nested programs.
      * Intrinsic functions arrived in a later amendment to COBOL-85.
      * GnuCOBOL's -std=cobol85 is useful when checking this dialect.
