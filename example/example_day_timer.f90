program example_day_timer

    use timer_module, only: day_timer_type, sec2hms
    implicit none

    type(day_timer_type) :: tmr

    call tmr%tic()
    call sleep(1)
    print *, 'Elapsed day time: ', tmr%toc(), ' sec'
    print *, 'Elapsed day time: ', sec2hms(tmr%toc()), ' (h:m:s)'
    print *, 'Elapsed day time: ', tmr%toc_string(), ' (d/h:m)'

end program example_day_timer
