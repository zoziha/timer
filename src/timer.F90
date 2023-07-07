!> Copyright (c) 2022~2023, ZUO Zhihua. Licensed by MIT.
module timer_module

#ifdef REAL64
    use, intrinsic :: iso_fortran_env, only: rk => real64
#else
    use, intrinsic :: iso_fortran_env, only: rk => real32
#endif
    implicit none

    private
    public :: timer, sec2hms

    !> Timer type
    type timer
        integer, private :: seed
    contains
        procedure :: tic, toc
    end type timer

contains

    !> Start timer
    subroutine tic(self)
        class(timer), intent(inout) :: self

        call system_clock(self%seed)

    end subroutine tic

    !> Stop timer
    function toc(self)
        class(timer), intent(in) :: self
        real(kind=rk) :: toc
        integer :: time_now, time_rate

        call system_clock(time_now, time_rate)
        toc = real(time_now - self%seed, rk)/time_rate

    end function toc

    !> Transform seconds to hh:mm:ss
    pure function sec2hms(sec) result(hms)
        real(kind=rk), intent(in) :: sec
        character(8) :: hms
        integer :: h, m, s

        h = int(sec/3600.0_rk)
        m = int((sec - h*3600.0_rk)/60.0_rk)
        s = int(sec - h*3600.0_rk - m*60.0_rk)
        write (hms, '(i2.2, ":", i2.2, ":", i2.2)') h, m, s

    end function sec2hms

end module timer_module
