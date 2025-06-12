#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  li x5, 20
  li x6, 5
  sub x7, x5, x6    # x7 = 15

  li x8, 15
  bne x7, x8, fail

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
