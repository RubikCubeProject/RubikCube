workspace "RubikCube"
    architecture "x64"
    startproject"Sandbox"

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
IncludeDir["Glad"] = "RubikCube/vendor/Glad/include"
IncludeDir["ImGui"] = "RubikCube/vendor/imgui"
IncludeDir["glm"] = "RubikCube/vendor/glm"

include "RubikCube/vendor/GLFW"
include "RubikCube/vendor/Glad"
include "RubikCube/vendor/imgui"

project "RubikCube"
    location "RubikCube"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    pchheader "rcpch.h"
    pchsource "RubikCube/src/rcpch.cpp"

    files
    {
        "%{prj.name}/src/**.h",
        "%{prj.name}/src/**.cpp",
        "%{prj.name}/vendor/glm/glm/**.hpp",
        "%{prj.name}/vendor/glm/glm/**.inl",
    }

    defines
    {
        "_CRT_SECURE_NO_WARNINGS"
    }

    includedirs
    {
        "%{prj.name}/vendor/spdlog/include",
        "%{prj.name}/src",
        "%{IncludeDir.GLFW}",
        "%{IncludeDir.Glad}",
        "%{IncludeDir.ImGui}",
        "%{IncludeDir.glm}"
    }

    links
    {
        "GLFW",
        "Glad",
        "ImGui",
        "opengl32.lib"
    }

    filter "system:windows"
        systemversion "latest"

        defines
        {
            "RC_PLATFORM_WINDOWS",
            "RC_BUILD_DLL",
            "GLFW_INCLUDE_NONE"
        }

    filter "configurations:Debug"
        defines "RC_DEBUG"
        symbols "on"

    filter "configurations:Release"
        defines "RC_RELEASE"
        optimize "on"

    filter "configurations:Dist"
        defines "RC_DIST"
        optimize "on"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
    staticruntime "on"

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
        "RubikCube/src",
        "RubikCube/vendor",
        "%{IncludeDir.glm}"
    }

    links
    {
        "RubikCube"
    }

    filter "system:windows"
        systemversion "latest"

        defines
        {
            "RC_PLATFORM_WINDOWS"
        }

    filter "configurations:Debug"
        defines "RC_DEBUG"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        defines "RC_RELEASE"
        runtime "Release"
        optimize "on"

    filter "configurations:Dist"
        defines "RC_DIST"
        runtime "Release"
        optimize "on"