       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOL1968.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-NAME        PIC X(20) VALUE SPACES.
       01  WS-AGE         PIC 99 VALUE ZERO.
       01  WS-COUNT       PIC 99 VALUE ZERO.
       01  WS-TOTAL       PIC 9999V99 VALUE ZERO.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY 'COBOL 1968 REFERENCE'.
           MOVE 'CORBIE' TO WS-NAME.
           MOVE 28 TO WS-AGE.
           DISPLAY 'NAME: ' WS-NAME.
           DISPLAY 'AGE:  ' WS-AGE.

           ADD 5 TO WS-COUNT.
           SUBTRACT 2 FROM WS-COUNT.
           MULTIPLY WS-COUNT BY 3.
           DIVIDE WS-COUNT BY 2.
           COMPUTE WS-TOTAL = WS-COUNT * 10.50.
           DISPLAY 'TOTAL: ' WS-TOTAL.

           IF WS-AGE GREATER THAN 17
               DISPLAY 'ADULT'
           ELSE
               DISPLAY 'MINOR'.

           PERFORM COUNT-PARA VARYING WS-COUNT FROM 1 BY 1
               UNTIL WS-COUNT GREATER THAN 3.

           STOP RUN.

       COUNT-PARA.
           DISPLAY 'COUNT: ' WS-COUNT.

      * ------------------------------------------------------------
      * COBOL 1968 / ANSI X3.23-1968 QUICK NOTES
      * ------------------------------------------------------------
      * First ANSI COBOL standard.
      * Source was traditionally fixed-format and column-sensitive.
      * Core style relies heavily on divisions, sections, paragraphs,
      * PICTURE clauses, MOVE, arithmetic verbs, IF, GO TO, and PERFORM.
      * Explicit scope terminators such as END-IF and inline PERFORM
      * belong to later COBOL standards; periods were central to scope.
      * Keep this file intentionally conservative: vendor compilers of
      * the era differed, and surviving code often contains extensions.
