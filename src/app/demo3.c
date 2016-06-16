#/*
 * trivial demo app
 * 
 * (C) 2016 Karsten Keil <keil@b1-systems.de>
 *
 * License: GPL v2 or later
 */

#include "testlibB.h"
#include "testlibC.h"


int main(int argc, char **argv)
{

    int ret = b_test_func();
    ret += c_test_func();
    return ret;
}
