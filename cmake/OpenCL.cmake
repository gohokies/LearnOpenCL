include(FetchContent)

set(OPENCL_HEADER_REPOSITORY "https://github.com/KhronosGroup/OpenCL-Headers.git")
set(OPENCL_HEADER_TAG "v2021.06.30")

set(OPENCL_HPP_REPOSITORY "https://github.com/KhronosGroup/OpenCL-CLHPP.git")
set(OPENCL_HPP_TAG "v2024.05.08")

set(OPENCL_LOADER_REPOSITORY "https://github.com/KhronosGroup/OpenCL-ICD-Loader.git")
set(OPENCL_LOADER_TAG "v2021.06.30")

FetchContent_Declare(OpenCL-Headers GIT_REPOSITORY ${OPENCL_HEADER_REPOSITORY} GIT_TAG ${OPENCL_HEADER_TAG})

FetchContent_GetProperties(OpenCL-Headers)
if(NOT OpenCL-Headers_POPULATED)
  FetchContent_Populate(OpenCL-Headers)
  message(STATUS "Populated OpenCL Headers")
endif()
set(OpenCL_INCLUDE_DIR ${OpenCL-Headers_SOURCE_DIR} CACHE PATH "")

FetchContent_Declare(OpenCL-HPP GIT_REPOSITORY ${OPENCL_HPP_REPOSITORY} GIT_TAG ${OPENCL_HPP_TAG})
FetchContent_GetProperties(OpenCL-HPP)
if(NOT OpenCL-HPP_POPULATED)
  FetchContent_Populate(OpenCL-HPP)
  message(STATUS "Populated OpenCL C++ Headers")
endif()
set(OpenCL_HPP_INCLUDE_DIR ${OpenCL_HPP_SOURCE_DIR}/include CACHE PATH "")

FetchContent_Declare(OpenCL-ICD-Loader GIT_REPOSITORY ${OPENCL_LOADER_REPOSITORY} GIT_TAG ${OPENCL_LOADER_TAG})
FetchContent_GetProperties(OpenCL-ICD-Loader)
if(NOT OpenCL-ICD-Loader_POPULATED)
  FetchContent_Populate(OpenCL-ICD-Loader)
  set(USE_DYNAMIC_VCXX_RUNTIME ON)
  add_subdirectory(${opencl-icd-loader_SOURCE_DIR} ${opencl-icd-loader_BINARY_DIR})
  message(STATUS "Populated OpenCL ICD Loader")
endif()
set(OPENCL_ICD_LOADER_HEADERS_DIR ${OpenCL-Headers_SOURCE_DIR} CACHE PATH "")