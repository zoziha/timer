!> Timer utilities
module timer_utils

    use timer_kinds, only: wp
    implicit none

contains

    !> Transform seconds to hh:mm:ss
    pure character(8) function sec2hms(sec) result(hms)
        real(kind=wp), intent(in) :: sec
        integer :: h, m

        h = int(sec/3600.0_wp)
        m = int((sec - h*3600.0_wp)/60.0_wp)
        write (hms, '(i2.2, ":", i2.2, ":", i2.2)') h, m, nint(sec - h*3600.0_wp - m*60.0_wp)

    end function sec2hms

    !> Transform seconds to day:hh:mm
    pure character(8) function sec2dhm(sec) result(dhm)
        real(kind=wp), intent(in) :: sec
        integer :: d, h

        d = int(sec/86400.0_wp)
        h = int((sec - d*86400.0_wp)/3600.0_wp)
        write (dhm, '(i2.2, "/", i2.2, ":", i2.2)') d, h, nint((sec - d*86400.0_wp - h*3600.0_wp)/60.0_wp)

    end function sec2dhm

end module timer_utils
