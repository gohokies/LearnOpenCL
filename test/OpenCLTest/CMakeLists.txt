add_executable(OpenCLTest OpenCLTest.cpp)

target_include_directories(OpenCLTest PUBLIC ${OpenCL_INCLUDE_DIR})

target_compile_definitions(OpenCLTest PUBLIC CL_TARGET_OPENCL_VERSION=300)

target_link_libraries(OpenCLTest gtest gtest_main OpenCL)

add_test(NAME OpenCLTest COMMAND OpenCLTest)
