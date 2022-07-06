workspace "RubikCube"
    architecture "x64"

    configurations
    {
        "Debug",
        "Release",
        "Dist"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
--Include directories relative to root folder (solution directory)
IncludeDir = {}
IncludeDir["GLFW"] = "RubikCube/vendor/GLFW/include"

include "RubikCube/vendor/GLFW"

project "RubikCube"
    location "RubikCube"
    kind "SharedLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "rcpch.h"
    pchsource "RubikCube/src/rcpch.cpp"

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "%{prj.name}/vendor/spdlog/include",
        "%{prj.name}/src",
        "%{IncludeDir.GLFW}"
    }

    links
    {
        "GLFW",
        "opengl32.lib"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "RC_PLATFORM_WINDOWS",
            "RC_BUILD_DLL"
        }

        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
        }

    filter "configurations:Debug"
        defines "RC_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "RC_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "RC_DIST"
        optimize "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp"
    }

    includedirs
    {
        "RubikCube/vendor/spdlog/include",
        "RubikCube/src"
    }

    filter "system:windows"
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

    defines
    {
       "RC_PLATFORM_WINDOWS"
    }

    links
    {
        "RubikCube"
    }

    filter "configurations:Debug"
        defines "RC_DEBUG"
        symbols "On"

    filter "configurations:Release"
        defines "RC_RELEASE"
        optimize "On"

    filter "configurations:Dist"
        defines "RC_DIST"
        optimize "On"