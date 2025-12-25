workspace "MyBot"
    configurations { "Debug", "Release" }
    architecture "x64"

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"

    -- ---------------------------------- --

project "MyBot"
	kind          "ConsoleApp"
	language      "C++"
	cppdialect    "C++20"
	cdialect      "C17"
	staticruntime "off"

    -- ---------------------------------- --

    files      { "src/**.cpp", "commands/**.h" }
    includedirs{ "%{wks.location}/include" }

    -- ---------------------------------- --

    filter { "configurations:Debug" }
        libdirs    { "lib/vs2022/debug/x64" }
        links      { "dpp.lib" }
        targetdir ("%{wks.location}/bin/%{cfg.buildcfg}")
        objdir    ("%{wks.location}/bin/%{cfg.buildcfg}")

    filter { "configurations:Release" }
        libdirs    { "lib/vs2022/release/x64" }
        links      { "dpp.lib" }
        targetdir ("%{wks.location}/bin/%{cfg.buildcfg}")
        objdir    ("%{wks.location}/bin/%{cfg.buildcfg}")

    -- ---------------------------------- --

    filter { "system:windows", "toolset:msc" }
    	systemversion "latest"

