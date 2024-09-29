add_executable(OpenCLInfo main.cpp)

target_include_directories(OpenCLInfo PUBLIC ${OpenCL_INCLUDE_DIR})
target_include_directories(OpenCLInfo PUBLIC ${OpenCL_HPP_INCLUDE_DIR})

target_compile_definitions(OpenCLInfo PUBLIC CL_TARGET_OPENCL_VERSION=300)
target_compile_definitions(OpenCLInfo PUBLIC CL_HPP_TARGET_OPENCL_VERSION=300)