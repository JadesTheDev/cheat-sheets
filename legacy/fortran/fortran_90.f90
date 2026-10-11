! Fortran 90 reference -- free source form.
! Major standard: ISO/IEC 1539:1991 (commonly called Fortran 90).
program fortran90_reference
    implicit none

    integer, parameter :: n = 5
    integer :: i
    real :: values(n) = (/ 10.0, 20.0, 30.0, 40.0, 50.0 /)
    real :: doubled(n)
    character(len=20) :: name = 'Corbie'
    logical :: ready = .true.

    print *, 'Hello, ', trim(name)

    ! Whole-array expressions became central to modern Fortran.
    doubled = values * 2.0
    print *, doubled

    ! Array slicing.
    print *, values(2:4)

    ! Named DO with EXIT/CYCLE style structured control.
    outer: do i = 1, n
        if (i == 2) cycle outer
        if (i == 5) exit outer
        print *, i
    end do outer

    if (ready) then
        print *, 'Ready'
    else
        print *, 'Not ready'
    end if

    select case (n)
    case (1)
        print *, 'one'
    case (2:4)
        print *, 'a few'
    case default
        print *, 'many'
    end select

    call show_stats(values)

contains

    subroutine show_stats(a)
        real, intent(in) :: a(:)
        print *, 'sum=', sum(a)
        print *, 'max=', maxval(a)
        print *, 'min=', minval(a)
    end subroutine show_stats

end program fortran90_reference

! Fortran 90 notes:
! - Free source form, modules, explicit interfaces, derived types, array syntax,
!   allocatable arrays, pointers, recursion, SELECT CASE, and structured DO
!   made Fortran look dramatically more modern.
! - .f90 convention means free form; it does NOT mean the file is limited to
!   the Fortran 90 standard.
