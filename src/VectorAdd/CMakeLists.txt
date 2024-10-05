add_executable(VectorAdd VectorAdd.cpp)

target_include_directories(VectorAdd PUBLIC ${OpenCL_INCLUDE_DIR})
target_include_directories(VectorAdd PUBLIC ${OpenCL_HPP_INCLUDE_DIR})

target_compile_definitions(VectorAdd PUBLIC CL_TARGET_OPENCL_VERSION=300)
target_compile_definitions(VectorAdd PUBLIC CL_HPP_TARGET_OPENCL_VERSION=300)