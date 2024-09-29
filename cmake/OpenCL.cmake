include(FetchContent)

set(OPENCL_HEADER_REPOSITORY "https://github.com/KhronosGroup/OpenCL-Headers.git")
set(OPENCL_HEADER_TAG "v2024.05.08")

set(OPENCL_HPP_REPOSITORY "https://github.com/KhronosGroup/OpenCL-CLHPP.git")
set(OPENCL_HPP_TAG "v2024.05.08")

set(OPENCL_LOADER_REPOSITORY "https://github.com/KhronosGroup/OpenCL-ICD-Loader.git")
set(OPENCL_LOADER_TAG "v2024.05.08")

FetchContent_Declare(OpenCLHeaders GIT_REPOSITORY ${OPENCL_HEADER_REPOSITORY} GIT_TAG ${OPENCL_HEADER_TAG})
FetchContent_MakeAvailable(OpenCLHeaders)
set(OpenCL_INCLUDE_DIR ${OpenCLHeaders_SOURCE_DIR} CACHE PATH "")
include_directories(${OpenCL_INCLUDE_DIR})

FetchContent_Declare(OpenCL-ICD-Loader GIT_REPOSITORY ${OPENCL_LOADER_REPOSITORY} GIT_TAG ${OPENCL_LOADER_TAG})
FetchContent_MakeAvailable(OpenCL-ICD-Loader)
set(OPENCL_ICD_LOADER_HEADERS_DIR ${OpenCL-Headers_SOURCE_DIR} CACHE PATH "")
message(${OPENCL_ICD_LOADER_HEADERS_DIR})

FetchContent_Declare(OpenCLHeadersCpp GIT_REPOSITORY ${OPENCL_HPP_REPOSITORY} GIT_TAG ${OPENCL_HPP_TAG})
FetchContent_MakeAvailable(OpenCLHeadersCpp)
set(OpenCL_HPP_INCLUDE_DIR ${OpenCLHeadersCpp_SOURCE_DIR}/include CACHE PATH "")
include_directories(${OpenCL_HPP_INCLUDE_DIR})
message(${OpenCL_HPP_INCLUDE_DIR})
