       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOL1974.

       ENVIRONMENT DIVISION.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  WS-FIRST       PIC X(12) VALUE 'COFFEEBEAN'.
       01  WS-LAST        PIC X(12) VALUE 'CAT'.
       01  WS-FULL        PIC X(30) VALUE SPACES.
       01  WS-TEXT        PIC X(30) VALUE 'RED,GREEN,BLUE'.
       01  WS-COLOR-1     PIC X(10) VALUE SPACES.
       01  WS-COLOR-2     PIC X(10) VALUE SPACES.
       01  WS-COLOR-3     PIC X(10) VALUE SPACES.
       01  WS-TALLY       PIC 99 VALUE ZERO.
       01  WS-COUNT       PIC 99 VALUE ZERO.

       PROCEDURE DIVISION.
       MAIN-PARA.
           DISPLAY 'COBOL 1974 REFERENCE'.

           STRING WS-FIRST DELIMITED BY SPACE
                  ' ' DELIMITED BY SIZE
                  WS-LAST DELIMITED BY SPACE
             INTO WS-FULL.
           DISPLAY 'FULL NAME: ' WS-FULL.

           UNSTRING WS-TEXT DELIMITED BY ','
             INTO WS-COLOR-1 WS-COLOR-2 WS-COLOR-3.
           DISPLAY WS-COLOR-1 ' / ' WS-COLOR-2 ' / ' WS-COLOR-3.

           INSPECT WS-TEXT TALLYING WS-TALLY FOR ALL ','.
           DISPLAY 'COMMAS: ' WS-TALLY.

           PERFORM COUNT-PARA VARYING WS-COUNT FROM 1 BY 1
               UNTIL WS-COUNT GREATER THAN 3.

           STOP RUN.

       COUNT-PARA.
           DISPLAY 'COUNT: ' WS-COUNT.

      * ------------------------------------------------------------
      * COBOL 1974 / ANSI X3.23-1974 QUICK NOTES
      * ------------------------------------------------------------
      * Retains the classic fixed-format, paragraph-oriented style.
      * Major additions associated with the 1974 standard include
      * INSPECT, STRING, and UNSTRING plus expanded file capabilities.
      * Explicit END-IF / END-PERFORM scope terminators were not yet
      * part of standard COBOL; sentence-ending periods still matter.
      * This file stays conservative to avoid vendor-only extensions.
