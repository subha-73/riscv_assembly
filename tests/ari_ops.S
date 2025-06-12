#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

    # Load immediate values
    li t0, 10
    li t1, 5

    # ADD: t2 = t0 + t1
    add t2, t0, t1

    # SUB: t3 = t0 - t1
    sub t3, t0, t1

    # MUL: t4 = t0 * t1
    mul t4, t0, t1

    # DIV: t5 = t0 / t1
    div t5, t0, t1

    # Store results to signature region
    la t6, signature
    sd t2, 0(t6)     # result of ADD
    sd t3, 8(t6)     # result of SUB
    sd t4, 16(t6)    # result of MUL
    sd t5, 24(t6)    # result of DIV

    # Test done
    TEST_PASSFAIL

RVTEST_CODE_END

RVTEST_DATA_BEGIN

signature:
    .fill 4, 8, 0    # reserve 4 x 8-byte slots

RVTEST_DATA_END
