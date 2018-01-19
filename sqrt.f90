program sqrt

    ! use newtonraphson
    use, intrinsic :: iso_c_binding
    implicit none

    interface
        function initializer () bind ( c )
          use iso_c_binding
          integer ( c_int ) :: initializer
        end function
        function nr_sqrt ( input, x0, iterations, printIts ) bind ( c )
          use iso_c_binding
          real ( c_double ) :: input
          real ( c_double ) :: x0
          integer ( c_int ) :: iterations
          logical ( c_bool ) :: printIts
          real ( c_double ) :: nr_sqrt
        end function nr_sqrt
    end interface

    character(len=5) :: arg
    integer :: nargs

    ! arguments for the c routines
    integer ( c_int ) :: errstat
    real ( c_double ) :: input
    real ( c_double ) :: x0 = 10
    integer ( c_int ) :: iterations = 10
    logical ( c_bool ) :: printIts = .FALSE.
    real ( c_double ) :: result

    ! read the input argument and convert to real
    nargs = command_argument_count()
    if (nargs.ne.1) then
      print *, "Usage: sqrt N where N is a real number"
      stop 1
    endif

    ! initialize the c routines
    errstat = initializer()

    call getarg(1, arg)
    read(arg,*) input

    ! get the square root from newton raphson method
    result = nr_sqrt(input, x0, iterations, printIts)

    ! print results
    print "(3A,F10.4)", "The square root of ",trim(arg)," is ",result

end program
