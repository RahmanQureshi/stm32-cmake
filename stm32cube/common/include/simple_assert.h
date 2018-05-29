/******************************************************************************
 * simple_assert.h
 * provides a simple_assert macro that calls assert_failed.
 * user must define assert_failed(uint8_t*, uint8_t).
 ******************************************************************************/

#ifndef SIMPLE_ASSERT__HEADER
#define SIMPLE_ASSERT__HEADER

#include <stdint.h>

/* Exported macros ----------------------------------------------------------*/
/**
  * @brief  The simple_assert macro is used to check assumptions.
  * @param  expr: If expr is false, calls assert_failed function.
  * @retval None
  */
#define simple_assert(expr) ((expr) ? (void)0U : assert_failed((uint8_t *)__FILE__, __LINE__))

/* Exported functions ------------------------------------------------------- */
extern void assert_failed(uint8_t* file, uint32_t line);

#endif /* SIMPLE_ASSERT__HEADER */