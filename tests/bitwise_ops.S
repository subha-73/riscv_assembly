#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li t0, 0x0F0F
  li t1, 0x00FF

  and t2, t0, t1     # expect 0x000F
  li t3, 0x000F
  bne t2, t3, fail

  or t2, t0, t1      # expect 0x0FFF
  li t3, 0x0FFF
  bne t2, t3, fail

  xor t2, t0, t1     # expect 0x0FF0
  li t3, 0x0FF0
  bne t2, t3, fail

  RVTEST_PASS

fail:
  RVTEST_FAIL

RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
  .align 3
bit_result:
  .dword -1
RVTEST_DATA_END
