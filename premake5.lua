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
    kind "SharedLib"
    language "C++"
    staticruntime "off"

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
        cppdialect "C++17"
        staticruntime "On"
        systemversion "latest"

        defines
        {
            "RC_PLATFORM_WINDOWS",
            "RC_BUILD_DLL",
            "GLFW_INCLUDE_NONE"
        }

        postbuildcommands
        {
            ("{COPY} %{cfg.buildtarget.relpath} \"../bin/" .. outputdir .. "/Sandbox/\"")
        }

    filter "configurations:Debug"
        defines "RC_DEBUG"
        buildoptions "/MDd"
        symbols "On"

    filter "configurations:Release"
        defines "RC_RELEASE"
        buildoptions "/MD"
        optimize "On"

    filter "configurations:Dist"
        defines "RC_DIST"
        buildoptions "/MD"
        optimize "On"

project "Sandbox"
    location "Sandbox"
    kind "ConsoleApp"
    language "C++"
    staticruntime "off"

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

    filter "system:windows"
        cppdialect "C++17"
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
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        defines "RC_RELEASE"
        runtime "Release"
        optimize "On"

    filter "configurations:Dist"
        defines "RC_DIST"
        runtime "Release"
        optimize "On"