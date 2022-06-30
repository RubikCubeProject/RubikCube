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
