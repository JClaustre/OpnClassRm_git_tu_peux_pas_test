MODULE MOD_LOOP
  USE F90_KIND
  IMPLICIT NONE

CONTAINS

  SUBROUTINE TEST_OPENMP (N, F)
    INTEGER, INTENT (IN) :: N
    REAL(DOUBLE), DIMENSION(:), INTENT(INOUT) :: F
    ! LOCAL 
    INTEGER :: i, k, lv, nth
    INTEGER :: OMP_GET_THREAD_NUM, OMP_GET_NUM_THREADS, NTHREADS, TID
    REAL(DOUBLE) :: prt
    REAL(DOUBLE), DIMENSION(N) :: Fb
    lv = 8
    F(:) = 0.d0
    Fb(:) = F(:)
    !$OMP PARALLEL DEFAULT(SHARED) PRIVATE(i,k,TID, nth) FIRSTPRIVATE(Fb) 
    TID = OMP_GET_THREAD_NUM()
    IF (TID .EQ. 0) THEN
       NTHREADS = OMP_GET_NUM_THREADS()
       write (*,"(A,I2,A,2I2)") "I'm the Master (id= ", TID,&
            ")! Number of Threads in the team : ", NTHREADS
    END IF

    !$OMP DO REDUCTION(+:F)
    DO i = 1, lv
       nth = 0
       DO k = 1, N
          nth = nth + (k + 1)
          F(k) = F(k) + nth
       END DO
       write(*,*) "Threads Num = ", TID, F(1), nth
    END DO
    !$OMP END DO
    write(*,*) "Threads Num Final = ", TID, "F(1) = ", F(1), nth
    IF (TID == 1) write(*,"(F15.3)") (F(k), k = 1,N)
    IF (TID == 0) write(*,"(A)") "!!!!!!! -GIT- CHANGED MY LIFE !!!!!!!!"
    !$OMP END PARALLEL

  END SUBROUTINE TEST_OPENMP

END MODULE MOD_LOOP
