program main

    use timer_module, only: cpu_timer, sec2hms
    implicit none

    type(cpu_timer) :: tmr

    call tmr%tic()
    call sleep(1)
    print *, 'Elapsed CPU time: ', tmr%toc(), ' seconds'
    print *, 'Elapsed CPU time: ', sec2hms(tmr%toc()), ' (h:m:s)'

end program main
