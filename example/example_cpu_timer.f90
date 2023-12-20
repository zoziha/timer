program main

    use timer_module, only: cpu_timer_type, sec2hms
    implicit none

    type(cpu_timer_type) :: tmr

    call tmr%tic()
    call sleep(1)
    print *, 'Elapsed CPU time: ', tmr%toc(), ' sec'
    print *, 'Elapsed CPU time: ', sec2hms(tmr%toc()), ' (h:m:s)'

end program main
