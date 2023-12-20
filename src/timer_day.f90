!> Days timer
module timer_day

    use timer_kinds, only: wp
    use timer_utils, only: sec2dhm
    implicit none

    !> Days timer
    type day_timer_type
        integer, private :: seed(8)
    contains
        procedure :: tic, toc, toc_string
    end type day_timer_type

contains

    !> Start the day timer
    subroutine tic(self)
        class(day_timer_type), intent(inout) :: self

        call date_and_time(values=self%seed)

    end subroutine tic

    !> Stop the day timer
    !> @note not very accurate
    real(wp) function toc(self)
        class(day_timer_type), intent(in) :: self
        integer :: seed_end(8)

        call date_and_time(values=seed_end)
        toc = (seed_end(1) - self%seed(1))*365.25_wp*86400.0_wp + &
              (seed_end(2) - self%seed(2))*30.4375_wp*86400.0_wp + &
              (seed_end(3) - self%seed(3))*86400.0_wp + &
              (seed_end(5) - self%seed(5))*3600.0_wp + &
              (seed_end(6) - self%seed(6))*60.0_wp + &
              (seed_end(7) - self%seed(7)) + &
              (seed_end(8) - self%seed(8))/1000.0_wp

    end function toc

    !> Convert time to string
    function toc_string(self) result(string)
        class(day_timer_type), intent(in) :: self
        character(len=8) :: string

        string = sec2dhm(self%toc())

    end function toc_string

end module timer_day
