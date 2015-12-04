!**** Compile : 
!**** gfortran -o run -lgfortran -lm -fopenmp f90_kind.f90 loop.f90 inner-outer_loop.f90
!**** export OMP_NUM_THREADS=8
program MAIN
  
  USE F90_KIND
  USE MOD_LOOP
  IMPLICIT NONE
  
  INTEGER, PARAMETER :: N = 10
  INTEGER :: t1, t2, clock_rate
  REAL(DOUBLE), DIMENSION(:), ALLOCATABLE :: F

  ALLOCATE ( F(N) ); F(:) = 0.d0
  print*, "Hello World"
  CALL SYSTEM_CLOCK (t1, clock_rate)
  
  CALL TEST_OPENMP (N, F)

  print*, "Final F(N) = ", F(N)
  CALL SYSTEM_CLOCK (t2, clock_rate)
  write (*,*) "Elapsed Time : ", real(t2-t1) / real(clock_rate)

  DEALLOCATE (F)

END program MAIN
