!> 24 hours clock timer
module timer_clock

    use timer_kinds, only: wp
    use timer_utils, only: sec2hms
    implicit none

    !> Clock timer
    type clock_timer_type
        integer, private :: seed
    contains
        procedure :: tic, toc, toc_string
    end type clock_timer_type

contains

    !> Start the clock timer
    subroutine tic(self)
        class(clock_timer_type), intent(inout) :: self

        call system_clock(self%seed)

    end subroutine tic

    !> Stop the clock timer
    real(kind=wp) function toc(self)
        class(clock_timer_type), intent(in) :: self
        integer :: time_now, time_rate

        call system_clock(time_now, time_rate)
        toc = real(time_now - self%seed, wp)/time_rate

    end function toc

    !> Convert time to string
    function toc_string(self) result(string)
        class(clock_timer_type), intent(in) :: self
        character(len=8) :: string

        string = sec2hms(self%toc())

    end function toc_string

end module timer_clock
