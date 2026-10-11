C     FORTRAN 77 reference -- fixed source form.
C     Standard era: ANSI X3.9-1978 / ISO 1539:1980 lineage.
      PROGRAM F77REF
      INTEGER I,N,SUM
      REAL A(5),AVERAGE
      CHARACTER*20 NAME
      LOGICAL READY
      PARAMETER (N=5)
      DATA A /10.0,20.0,30.0,40.0,50.0/
      NAME = 'CORBIE'
      READY = .TRUE.
C
C     OUTPUT / INPUT
      WRITE (*,100) NAME
  100 FORMAT (' HELLO, ',A)
C     READ (*,*) SOME-VALUE
C
C     DO LOOP
      SUM = 0
      DO 200 I = 1,N
      SUM = SUM + I
  200 CONTINUE
C
C     BLOCK IF was added in FORTRAN 77.
      IF (READY .AND. SUM .GE. 10) THEN
         WRITE (*,*) 'READY AND SUM >= 10'
      ELSE
         WRITE (*,*) 'NOT READY'
      END IF
C
C     ARRAY / INTRINSIC FUNCTIONS
      AVERAGE = (A(1)+A(2)+A(3)+A(4)+A(5))/REAL(N)
      WRITE (*,110) AVERAGE
  110 FORMAT (' AVERAGE = ',F8.2)
      WRITE (*,*) 'ABS(-5) = ',ABS(-5)
      WRITE (*,*) 'SQRT(25) = ',SQRT(25.0)
C
C     CHARACTER SUBSTRINGS
      WRITE (*,*) NAME(1:6)
C
C     SUBROUTINE
      CALL ADDTEN(A,N)
      WRITE (*,120) (A(I),I=1,N)
  120 FORMAT (' A = ',5F7.1)
      STOP
      END
C
      SUBROUTINE ADDTEN(A,N)
      INTEGER I,N
      REAL A(N)
      DO 10 I = 1,N
         A(I) = A(I) + 10.0
   10 CONTINUE
      RETURN
      END
C
C     FORTRAN 77 NOTES
C     - Fixed source form remained standard.
C     - CHARACTER and block IF/THEN/ELSE/END IF are hallmark additions.
C     - IMPLICIT typing is normal in this era; IMPLICIT NONE became standard
C       later and is preferred in modern Fortran.
C     - COMMON blocks, EQUIVALENCE, labeled DO, assigned/computed GO TO,
C       arithmetic IF, and statement functions are common in legacy code.
