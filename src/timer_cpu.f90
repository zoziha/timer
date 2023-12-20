!> 24 hours cpu timer
module timer_cpu

    use timer_kinds, only: wp
    use timer_utils, only: sec2hms
    implicit none

    !> cpu timer
    type cpu_timer_type
        real(kind=wp), private :: seed
    contains
        procedure :: tic, toc, toc_string
    end type cpu_timer_type

contains

    !> Start the cpu timer
    subroutine tic(self)
        class(cpu_timer_type), intent(inout) :: self

        call cpu_time(self%seed)

    end subroutine tic

    !> Stop the cpu timer
    real(kind=wp) function toc(self)
        class(cpu_timer_type), intent(in) :: self

        call cpu_time(toc)
        toc = toc - self%seed

    end function toc

    !> Convert time to string
    function toc_string(self) result(string)
        class(cpu_timer_type), intent(in) :: self
        character(len=8) :: string

        string = sec2hms(self%toc())

    end function toc_string

end module timer_cpu
