# Simple Timer

![Language](https://img.shields.io/badge/-Fortran-734f96?logo=fortran&logoColor=white)
[![license](https://img.shields.io/badge/License-MIT-pink)](LICENSE)

A simple timer module to get the number of seconds between two timestamps.

Only FPM is supported, other build systems can copy the source file (`./src/timer.F90`) directly.

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
program main

    use timer_module, only: timer, sec2hms
    implicit none

    type(timer) :: tmr

    call tmr%tic()
    call sleep(1)
    print *, 'Elapsed time: ', tmr%toc(), ' seconds'
    print *, 'Elapsed time: ', sec2hms(tmr%toc()), ' (h:m:s)'

end program main
! Elapsed time:    1.00000000      seconds
! Elapsed time: 00:00:01 (h:m:s)
```
