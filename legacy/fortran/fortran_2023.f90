! Fortran 2023 reference.
! Current published base-language standard: ISO/IEC 1539-1:2023.
! Technical Corrigendum 1 was published in 2026.
program fortran2023_reference
    use, intrinsic :: iso_fortran_env, only : real64, int64
    implicit none

    integer(int64) :: count
    real(real64) :: values(5)
    integer :: i

    count = 5_int64
    values = [1.0_real64, 2.0_real64, 3.0_real64, 4.0_real64, 5.0_real64]

    print *, 'Fortran 2023 reference'
    print *, 'count=', count

    ! Modern baseline: explicit typing, kind constants, array operations,
    ! modules, allocatables, derived types, structured control, and intrinsics.
    values = values ** 2
    print *, 'squares=', values

    do concurrent (i = 1:size(values))
        values(i) = sqrt(values(i))
    end do

    print *, 'roots=', values
    print *, 'sum=', sum(values)

    call print_type_demo(42)

contains

    subroutine print_type_demo(value)
        class(*), intent(in) :: value

        select type (value)
        type is (integer)
            print *, 'integer value=', value
        type is (real)
            print *, 'real value=', value
        class default
            print *, 'some other type'
        end select
    end subroutine print_type_demo

end program fortran2023_reference

! Fortran 2023 notes (current as of 2026):
! - ISO/IEC 1539-1:2023 is the current published base-language standard.
! - ISO/IEC 1539-1:2023/Cor 1:2026 is the current published corrigendum.
! - GNU Fortran accepts -std=f2023 for strict-standard checking, but support
!   for individual newer features can still vary by compiler/version.
! - A future revision is already under development; draft features are not
!   treated here as portable Fortran 2023.
