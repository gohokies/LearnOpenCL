#include <CL/opencl.hpp>
#include <fstream>
#include <iostream>
#include <vector>
#include <time.h>

int main()
{
    int N = 1024 * 1024;
    std::vector<int> a(N, 3);
    std::vector<int> b(N, 5);

    std::vector<int> cs(N);
    std::vector<int> cp(N);
 
    // OpenCL vector add
    //
    std::vector<cl::Platform> platforms;
    cl::Device device;
    cl::Program program;
    cl::Context context;

    cl::Platform::get(&platforms);
    if (platforms.empty())
    {
        std::cerr << "No platforms found!" << std::endl;
        exit(1);
    }

    auto platform = platforms.front();
    std::vector<cl::Device> devices;
    platform.getDevices(CL_DEVICE_TYPE_ALL, &devices);
    if (devices.empty())
    {
        std::cerr << "No devices found!" << std::endl;
        exit(1);
    }

    device = devices.front();
    context = cl::Context(device);

    std::string kernelSource("\
     __kernel void sumArrays(__global int* a, __global int* b, __global int* c)\
     {\
        int index = get_global_id(0);\
        c[index] = a[index] + b[index];\
     }");

    cl::Program::Sources sources;
    sources.push_back(kernelSource);
    program = cl::Program(context, sources);    
    auto err = program.build();
    if(err != CL_BUILD_SUCCESS)
    {
        std::cerr << "Error!\nBuild Status: " << program.getBuildInfo<CL_PROGRAM_BUILD_STATUS>(device) 
        << "\nBuild Log:\t " << program.getBuildInfo<CL_PROGRAM_BUILD_LOG>(device) << std::endl;
        exit(1);
    }

    cl::Buffer aBuf(context, CL_MEM_READ_ONLY | CL_MEM_HOST_NO_ACCESS | CL_MEM_COPY_HOST_PTR, N * sizeof(int), a.data());
    cl::Buffer bBuf(context, CL_MEM_READ_ONLY | CL_MEM_HOST_NO_ACCESS | CL_MEM_COPY_HOST_PTR, N * sizeof(int), b.data());
    cl::Buffer cBuf(context, CL_MEM_WRITE_ONLY | CL_MEM_HOST_READ_ONLY, N * sizeof(int));

    cl::Kernel kernel(program, "sumArrays");
    kernel.setArg(0, aBuf);
    kernel.setArg(1, bBuf);
    kernel.setArg(2, cBuf);

    cl::CommandQueue queue(context, device);
    queue.enqueueNDRangeKernel(kernel, cl::NullRange, cl::NDRange(N));
    queue.enqueueReadBuffer(cBuf, CL_TRUE, 0, N * sizeof(int), cp.data());

    // CPU vector add
    for(int i = 0; i < N; i++)
    {
        cs[i] = a[i] + b[i];
    }

    // Compare result
    //
    bool fEqual = true;
    for(int i = 0; i < N; i++)
    {
        if(cs[i] != cp[i])
        {
            fEqual = false;
            break;
        }
    }

    std::cout << "Status: " << (fEqual ? "SUCCESS!" : "FAILED!") << std::endl;
    return 0;
}
