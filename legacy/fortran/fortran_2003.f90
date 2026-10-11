! Fortran 2003 reference.
! Standard: ISO/IEC 1539-1:2004.
module animal_mod
    implicit none

    type :: animal
        character(len=:), allocatable :: name
    contains
        procedure :: speak => animal_speak
    end type animal

contains

    function animal_speak(self) result(text)
        class(animal), intent(in) :: self
        character(len=:), allocatable :: text
        text = trim(self%name) // ' makes a sound.'
    end function animal_speak

end module animal_mod

program fortran2003_reference
    use animal_mod
    use, intrinsic :: iso_c_binding, only : c_int
    implicit none

    type(animal) :: cat
    character(len=:), allocatable :: message
    integer(c_int) :: portable_int

    cat%name = 'CoffeeBean'
    print *, cat%speak()

    ! Deferred-length allocatable character.
    message = 'Fortran 2003 made strings much friendlier.'
    print *, message

    ! ISO_C_BINDING standardized C interoperability.
    portable_int = 42_c_int
    print *, 'C-compatible integer:', portable_int

end program fortran2003_reference

! Fortran 2003 notes:
! - Major additions include object-oriented features, type-bound procedures,
!   inheritance/polymorphism, procedure pointers, allocatable enhancements,
!   stream I/O, command-line/environment access, and C interoperability.
