#include <stdio.h>

#include "gtest/gtest.h"
#include "CL/cl.h"

TEST(OpenCLTest, GetPlatformIDs)
{
    cl_uint platformCount;
    if (CL_SUCCESS == clGetPlatformIDs(0, NULL, &platformCount)) {
        printf("Found %d OpenCL devices\n", platformCount);
    }
    else{
        printf("clGetPlatformIDs failed, maybe OpenCL not supported\n");
    }
}