#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li t0, 1        # i = 1
  li t1, 0        # sum = 0
  li t2, 5        # limit = 5

loop:
  add t1, t1, t0  # sum += i
  addi t0, t0, 1  # i++
  ble t0, t2, loop

  li t3, 15       # expected result
  bne t1, t3, fail

  RVTEST_PASS

fail:
  RVTEST_FAIL

RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
  .align 3
result:
  .dword -1
RVTEST_DATA_END
