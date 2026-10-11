C     FORTRAN 66 reference -- fixed source form.
C     Historical recognition sheet, not modern style.
C     Standard era: ANSI X3.9-1966.
      PROGRAM F66REF
      INTEGER I,N,SUM
      REAL X,Y,Z
      DIMENSION A(5)
      DATA A /1.0,2.0,3.0,4.0,5.0/
C
C     ASSIGNMENT / ARITHMETIC
      N = 5
      X = 10.0
      Y = 4.0
      Z = X/Y + 2.0**2
C
C     OUTPUT / FORMAT
      WRITE (6,100) Z
  100 FORMAT (' Z = ',F8.2)
C
C     COUNTED DO LOOP
      SUM = 0
      DO 200 I = 1,N
      SUM = SUM + I
  200 CONTINUE
      WRITE (6,110) SUM
  110 FORMAT (' SUM = ',I6)
C
C     LOGICAL IF
      IF (SUM .GT. 10) WRITE (6,120)
  120 FORMAT (' SUM IS GREATER THAN 10')
C
C     THREE-WAY ARITHMETIC IF: negative, zero, positive
      IF (SUM-15) 300,400,500
  300 WRITE (6,130)
  130 FORMAT (' BELOW 15')
      GO TO 600
  400 WRITE (6,140)
  140 FORMAT (' EQUAL TO 15')
      GO TO 600
  500 WRITE (6,150)
  150 FORMAT (' ABOVE 15')
  600 CONTINUE
C
C     SUBROUTINE CALL
      CALL SCALE(A,N,2.0)
      WRITE (6,160) (A(I),I=1,N)
  160 FORMAT (' A = ',5F7.2)
      STOP
      END
C
      SUBROUTINE SCALE(A,N,FACTOR)
      INTEGER I,N
      REAL A,FACTOR
      DIMENSION A(N)
      DO 10 I = 1,N
      A(I) = A(I)*FACTOR
   10 CONTINUE
      RETURN
      END
C
C     FORTRAN 66 NOTES
C     - Source is fixed form: statements normally begin in column 7.
C     - Labels occupy columns 1-5; column 6 is continuation.
C     - Period-delimited relational operators are common: .EQ. .NE. .LT.
C       .LE. .GT. .GE.
C     - Arithmetic IF, GO TO, labeled DO loops, DATA, COMMON, EQUIVALENCE,
C       and FORMAT statements are common sights in surviving code.
C     - Modern Fortran retains much old syntax for compatibility, but several
C       constructs from this era are obsolescent or deleted in later standards.
