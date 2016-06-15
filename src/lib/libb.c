/*
 * simple demo lib
 *
 *
 * (C) 2016 Karsten Keil <keil@b1-systems.de>
 *
 * License: LGPL v2.1 or later
 */

#include <stdio.h>
#include "testlibcommon.h"
#include "testlibB.h"


int b_test_func(void)
{
    fprintf(stdout, "%s: this is %s()\n", OurCommonPrefix, __func__);
    return 0;
}
