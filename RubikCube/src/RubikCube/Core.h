#pragma once

#ifdef RC_PLATFORM_WINDOWS
    #ifdef RC_BUILD_DLL
        #define RUBIKCUBE_API __declspec(dllexport)
    #else
        #define RUBIKCUBE_API __declspec(dllimport)
    #endif
#else
    #error RubikCube only supports Windows!
#endif

#ifdef RC_ENABLE_ASSERTS
    #define RC_ASSERT(x, ...) { if(!(x)) { RC_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); }}
    #define RC_CORE_ASSERT(x, ...) { if(!(x)) { RC_CORE_ERROR("Assertion Failed: {0}", __VA_ARGS__); __debugbreak(); }}
#else
    #define RC_ASSERT(x, ...)
    #define RC_CORE_ASSERT(x, ...)
#endif 


#define BIT(x) (1 << x)