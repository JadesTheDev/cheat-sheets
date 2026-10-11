! Fortran 2008 reference.
! Standard: ISO/IEC 1539-1:2010.
program fortran2008_reference
    use, intrinsic :: iso_fortran_env, only : int64, real64, output_unit
    implicit none

    integer(int64) :: big_number
    real(real64) :: values(5)
    integer :: i

    big_number = 9_int64
    values = [1.0_real64, 2.0_real64, 3.0_real64, 4.0_real64, 5.0_real64]

    write (output_unit, *) 'big_number=', big_number

    ! DO CONCURRENT expresses independent iterations.
    do concurrent (i = 1:size(values))
        values(i) = values(i) ** 2
    end do

    print *, 'squares=', values

    ! BLOCK creates a local scope.
    block
        real(real64) :: local_average
        local_average = sum(values) / real(size(values), real64)
        print *, 'average=', local_average
    end block

    ! ERROR STOP was standardized in Fortran 2008.
    if (any(values < 0.0_real64)) error stop 'unexpected negative value'

end program fortran2008_reference

! Fortran 2008 notes:
! - Added coarrays to the language for parallel programming, DO CONCURRENT,
!   BLOCK, ERROR STOP, enhanced C interoperability, and many smaller improvements.
! - Submodules originated in a later technical specification and were folded
!   into the Fortran 2018 standard rather than the original 2008 base standard.
! - Compiler support for parallel/coarray features can depend on runtime/toolchain.
