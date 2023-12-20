!> Working precision of timer
module timer_kinds

#ifdef REAL64
    use, intrinsic :: iso_fortran_env, only: wp => real64
#else
    use, intrinsic :: iso_fortran_env, only: wp => real32
#endif

end module timer_kinds
