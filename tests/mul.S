# See LICENSE for license details.

#*****************************************************************************
# mul.S
#-----------------------------------------------------------------------------
#
# Test mul instruction.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_RR_OP( 2,  mul, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000 );
  TEST_RR_OP( 3,  mul, 0x0000000000000006, 0x0000000000000002, 0x0000000000000003 );
  TEST_RR_OP( 4,  mul, 0xfffffffffffffffc, 0x0000000000000002, 0xfffffffffffffffe );
  TEST_RR_OP( 5,  mul, 0xffffffff00000001, 0xffffffff00000001, 0x0000000000000001 );
  TEST_RR_OP( 6,  mul, 0xffffffffffffffff, 0x0000000000000001, 0xffffffffffffffff );
  TEST_RR_OP( 7,  mul, 0xfffffffe00000001, 0xffffffff00000001, 0xffffffff00000001 );

  #-------------------------------------------------------------
  # Source/Destination tests
  #-------------------------------------------------------------

  TEST_RR_SRC1_EQ_DEST( 8, mul, 20, 5, 4 );
  TEST_RR_SRC2_EQ_DEST( 9, mul, 20, 5, 4 );
  TEST_RR_SRC12_EQ_DEST( 10, mul, 16, 4 );

  #-------------------------------------------------------------
  # Bypassing tests
  #-------------------------------------------------------------

  TEST_RR_DEST_BYPASS( 11, 0, mul, 30, 6, 5 );
  TEST_RR_DEST_BYPASS( 12, 1, mul, 40, 8, 5 );
  TEST_RR_DEST_BYPASS( 13, 2, mul, 12, 3, 4 );

  TEST_RR_SRC12_BYPASS( 14, 0, 0, mul, 25, 5, 5 );
  TEST_RR_SRC12_BYPASS( 15, 0, 1, mul, 36, 6, 6 );
  TEST_RR_SRC12_BYPASS( 16, 1, 0, mul, 49, 7, 7 );

  TEST_RR_SRC21_BYPASS( 17, 0, 0, mul, 35, 7, 5 );
  TEST_RR_SRC21_BYPASS( 18, 0, 1, mul, 27, 3, 9 );
  TEST_RR_SRC21_BYPASS( 19, 1, 0, mul, 24, 8, 3 );

  TEST_RR_ZEROSRC1( 20, mul, 0, 31 );
  TEST_RR_ZEROSRC2( 21, mul, 0, 32 );
  TEST_RR_ZEROSRC12( 22, mul, 0 );
  TEST_RR_ZERODEST( 23, mul, 33, 2 );

  TEST_PASSFAIL

RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
