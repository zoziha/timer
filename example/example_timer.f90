program main

    use timer_module, only: timer, sec2hms
    implicit none

    type(timer) :: tmr

    call tmr%tic()
    call sleep(1)
    print *, 'Elapsed time: ', tmr%toc(), ' sec'
    print *, 'Elapsed time: ', sec2hms(tmr%toc()), ' (h:m:s)'

end program main
