#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li t0, 5
  li t1, 10

  slt t2, t0, t1     # t2 = (5 < 10) = 1
  li t3, 1
  bne t2, t3, fail

  slt t2, t1, t0     # t2 = (10 < 5) = 0
  li t3, 0
  bne t2, t3, fail

  slti t2, t0, 6     # t2 = (5 < 6) = 1
  li t3, 1
  bne t2, t3, fail

  slti t2, t0, 5     # t2 = (5 < 5) = 0
  li t3, 0
  bne t2, t3, fail

  RVTEST_PASS

fail:
  RVTEST_FAIL

RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
  .align 3
slt_result:
  .dword -1
RVTEST_DATA_END
