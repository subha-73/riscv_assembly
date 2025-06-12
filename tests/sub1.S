# See LICENSE for license details.

#*****************************************************************************
# sub.S
#-----------------------------------------------------------------------------
#
# Test sub instruction.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV64U
RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  TEST_RR_OP( 2,  sub, 0x00000000, 0x00000000, 0x00000000 );
  TEST_RR_OP( 3,  sub, 0x00000000, 0x00000001, 0x00000001 );
  TEST_RR_OP( 4,  sub, 0xfffffffffffffffc, 0x00000003, 0x00000007 );

  TEST_RR_OP( 5,  sub, 0x0000000000008000, 0x0000000000000000, 0xffffffffffff8000 );
  TEST_RR_OP( 6, sub, 0xffffffffffffffff, 0xffffffff80000000, 0xffffffff80000001 );

  TEST_RR_OP( 7,  sub, 0xffffffffffff8001, 0x0000000000000000, 0x0000000000007fff );
  TEST_RR_OP( 8,  sub, 0x0000000000000001, 0x000000007fffffff, 0x000000007ffffffe );
  TEST_RR_OP( 9, sub, 0xffffffffffff8001, 0x000000007fffffff, 0x0000000080007ffe );

  TEST_RR_OP( 10, sub, 0xffffffff80008001, 0xffffffff80000000, 0xffffffffffff7fff );
  TEST_RR_OP( 11, sub, 0x0000000080000000, 0x000000007fffffff, 0xffffffffffffffff );

  TEST_RR_OP( 12, sub, 0x0000000000000001, 0x0000000000000000, 0xffffffffffffffff );
  TEST_RR_OP( 13, sub, 0xffffffffffffffff, 0xffffffffffffffff, 0x0000000000000000 );
  TEST_RR_OP( 14, sub, 0x0000000000000001, 0xffffffffffffffff, 0xfffffffffffffffe );


  #-------------------------------------------------------------
  # Source/Destination tests
  #-------------------------------------------------------------

  TEST_RR_SRC1_EQ_DEST( 15, sub, 2, 13, 11 );
  TEST_RR_SRC2_EQ_DEST( 16, sub, 3, 14, 11 );
  TEST_RR_SRC12_EQ_DEST( 17, sub, 0, 13 );

  #-------------------------------------------------------------
  # Bypassing tests
  #-------------------------------------------------------------

  TEST_RR_DEST_BYPASS( 18, 0, sub, 2, 13, 11 );
  TEST_RR_DEST_BYPASS( 19, 1, sub, 3, 14, 11 );
  TEST_RR_DEST_BYPASS( 20, 2, sub, 4, 15, 11 );

  TEST_RR_SRC12_BYPASS( 21, 0, 0, sub, 2, 13, 11 );
  TEST_RR_SRC12_BYPASS( 22, 0, 1, sub, 3, 14, 11 );
  TEST_RR_SRC12_BYPASS( 23, 0, 2, sub, 4, 15, 11 );
  TEST_RR_SRC12_BYPASS( 24, 1, 0, sub, 2, 13, 11 );
  TEST_RR_SRC12_BYPASS( 25, 1, 1, sub, 3, 14, 11 );
  TEST_RR_SRC12_BYPASS( 26, 2, 0, sub, 4, 15, 11 );

  TEST_RR_SRC21_BYPASS( 27, 0, 0, sub, 2, 13, 11 );
  TEST_RR_SRC21_BYPASS( 28, 0, 1, sub, 3, 14, 11 );
  TEST_RR_SRC21_BYPASS( 29, 0, 2, sub, 4, 15, 11 );
  TEST_RR_SRC21_BYPASS( 30, 1, 0, sub, 2, 13, 11 );
  TEST_RR_SRC21_BYPASS( 31, 1, 1, sub, 3, 14, 11 );
  TEST_RR_SRC21_BYPASS( 32, 2, 0, sub, 4, 15, 11 );

  TEST_RR_ZEROSRC1( 33, sub, -15, 15 );
  TEST_RR_ZEROSRC2( 34, sub, 32, 32 );
  TEST_RR_ZEROSRC12( 35, sub, 0 );
  TEST_RR_ZERODEST( 36, sub, 16, 30 );

  TEST_PASSFAIL

RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
