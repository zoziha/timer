program main

    use timer_module, only: clock_timer_type, sec2hms
    implicit none

    type(clock_timer_type) :: tmr

    call tmr%tic()
    call sleep(1)
    print *, 'Elapsed clock time: ', tmr%toc(), ' sec'
    print *, 'Elapsed clock time: ', sec2hms(tmr%toc()), ' (h:m:s)'

end program main
