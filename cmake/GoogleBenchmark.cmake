include(FetchContent)

FetchContent_Declare(googlebenchmark
        GIT_REPOSITORY https://github.com/google/benchmark
        GIT_TAG v1.8.0
        )

FetchContent_MakeAvailable(googlebenchmark)
