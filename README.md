# Simple Timer

![Language](https://img.shields.io/badge/-Fortran-734f96?logo=fortran&logoColor=white)
[![license](https://img.shields.io/badge/License-MIT-pink)](LICENSE)

A simple timer module to get the number of seconds between two timestamps.

Only FPM is supported, other build systems can copy the source file (`./src/*.f90`) directly.

## Usage

To use `timer` within your `fpm` project, add the following lines to your `fpm.toml` file:

```toml
[dependencies]
timer = { git="https://github.com/zoziha/timer" }
```

## Example

```sh
> fpm run --example --all  # run the example
```

```fortran
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
! Elapsed day time:    1.01499999      sec
! Elapsed day time: 00:00:01 (h:m:s)
! Elapsed day time: 00/00:00 (d/h:m)
```
