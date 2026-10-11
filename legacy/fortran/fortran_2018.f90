! Fortran 2018 reference.
! Standard: ISO/IEC 1539-1:2018.
program fortran2018_reference
    use, intrinsic :: iso_fortran_env, only : real64
    implicit none

    real(real64) :: values(6) = [1, 2, 3, 4, 5, 6]
    integer :: i

    ! DO CONCURRENT remains an important parallel-friendly construct.
    do concurrent (i = 1:size(values))
        values(i) = values(i) * 2.0_real64
    end do

    print *, values

    ! SELECT RANK works with assumed-rank dummy arguments.
    call describe(values)

contains

    subroutine describe(x)
        real(real64), intent(in) :: x(..)

        select rank (x)
        rank (0)
            print *, 'scalar=', x
        rank (1)
            print *, 'rank-1 size=', size(x)
        rank default
            print *, 'other rank'
        end select
    end subroutine describe

end program fortran2018_reference

! Fortran 2018 notes:
! - Added/standardized major parallel and interoperability capabilities,
!   including teams/events, enhanced coarrays, assumed-rank entities,
!   SELECT RANK, locality specs for DO CONCURRENT, and submodules.
! - Some current compilers still implement particular 2018 features unevenly.
! - FORALL and several older constructs were deleted from the standard.
