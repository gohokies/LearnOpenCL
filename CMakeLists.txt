cmake_minimum_required(VERSION 3.21)

# project name and supported languages
project(LearnOpenCL C CXX)

set(CMAKE_C_STANDARD 99)
set(CMAKE_CXX_STANDARD 17)

# Opencl
include(${PROJECT_SOURCE_DIR}/cmake/OpenCL.cmake)

# GoogleTest
include(${PROJECT_SOURCE_DIR}/cmake/GoogleTest.cmake)

# Google Benchmark
include(${PROJECT_SOURCE_DIR}/cmake/GoogleBenchmark.cmake)

include_directories(${OpenCLHeaders_SOURCE_DIR})

enable_testing()

add_subdirectory(test)
