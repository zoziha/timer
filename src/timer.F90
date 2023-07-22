!> Copyright (c) 2022~2023, ZUO Zhihua. Licensed by MIT.
module timer_module

#ifdef REAL64
    use, intrinsic :: iso_fortran_env, only: rk => real64
#else
    use, intrinsic :: iso_fortran_env, only: rk => real32
#endif
    implicit none

    private
    public :: timer, cpu_timer, sec2hms

    !> Timer type
    type timer
        integer, private :: seed
    contains
        procedure :: tic, toc
    end type timer

    !> CPU timer
    type cpu_timer
        real(kind=rk), private :: seed
    contains
        procedure :: tic => cpu_tic, toc => cpu_toc
    end type cpu_timer

contains

    !> Start timer
    subroutine tic(self)
        class(timer), intent(inout) :: self

        call system_clock(self%seed)

    end subroutine tic

    !> Stop timer
    real(kind=rk) function toc(self)
        class(timer), intent(in) :: self
        integer :: time_now, time_rate

        call system_clock(time_now, time_rate)
        toc = real(time_now - self%seed, rk)/time_rate

    end function toc

    !> Start CPU timer
    subroutine cpu_tic(self)
        class(cpu_timer), intent(inout) :: self

        call cpu_time(self%seed)

    end subroutine cpu_tic

    !> Stop CPU timer
    real(kind=rk) function cpu_toc(self)
        class(cpu_timer), intent(in) :: self

        call cpu_time(cpu_toc)
        cpu_toc = cpu_toc - self%seed

    end function cpu_toc

    !> Transform seconds to hh:mm:ss
    pure character(12) function sec2hms(sec) result(hms)
        real(kind=rk), intent(in) :: sec
        integer :: h, m

        h = int(sec/3600.0_rk)
        m = int((sec - h*3600.0_rk)/60.0_rk)
        write (hms, '(i2.2, ":", i2.2, ":", f6.3)') h, m, sec - h*3600.0_rk - m*60.0_rk

    end function sec2hms

end module timer_module
