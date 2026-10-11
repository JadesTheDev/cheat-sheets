! Fortran 95 reference.
! Standard: ISO/IEC 1539-1:1997.
program fortran95_reference
    implicit none

    integer, parameter :: n = 5
    integer :: values(n) = (/ 1, 2, 3, 4, 5 /)
    integer :: squares(n)
    logical :: mask(n)
    integer :: i

    squares = values ** 2
    mask = mod(values, 2) == 0

    print *, 'squares:', squares
    print *, 'even values:', pack(values, mask)

    ! FORALL was introduced in Fortran 95 (later deleted in Fortran 2018).
    forall (i = 1:n)
        squares(i) = values(i) * values(i)
    end forall

    ! WHERE performs masked array assignment.
    where (mask)
        squares = squares + 100
    elsewhere
        squares = -squares
    end where

    print *, 'masked:', squares
    print *, 'pure cube(3)=', cube(3)

contains

    pure integer function cube(x) result(y)
        integer, intent(in) :: x
        y = x * x * x
    end function cube

end program fortran95_reference

! Fortran 95 notes:
! - Evolutionary revision of Fortran 90.
! - Added FORALL and PURE/ELEMENTAL procedure capabilities, among other changes.
! - FORALL became obsolescent and was later deleted; modern code usually prefers
!   array syntax, WHERE, DO CONCURRENT, or ordinary DO as appropriate.
