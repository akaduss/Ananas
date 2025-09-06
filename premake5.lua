workspace "Ananas"
	architecture "x64"

	configurations
	{
		"Debug",
		"Release",
		"Dist"
	}

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

project "Ananas"
	location "Ananas"
	kind "SharedLib"
	language "C++"

	targetdir("bin/" .. outputdir .. "/%{prj.name}")
	objdir("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}

	includedirs
	{
		"%{prj.name}/vendor/spdlog/include"
	}

	-- Windows settings
	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		buildoptions { "/utf-8" }
		defines
		{
			"AN_PLATFORM_WINDOWS",
			"AN_BUILD_DLL"
		}
		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

	-- macOS settings
	filter "system:macosx"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		buildoptions { "-finput-charset=UTF-8", "-fexec-charset=UTF-8" }
		defines
		{
			"AN_PLATFORM_MAC",
			"AN_BUILD_DLL"
		}
		links
		{
			"Cocoa.framework",
			"IOKit.framework",
			"CoreFoundation.framework"
		}
		postbuildcommands
		{
			("{COPY} %{cfg.buildtarget.relpath} ../bin/" .. outputdir .. "/Sandbox")
		}

	-- Configurations
	filter "configurations:Debug"
		defines "AN_DEBUG"
		symbols "On"

	filter "configurations:Release"
		defines "AN_RELEASE"
		optimize "On"

	filter "configurations:Dist"
		defines "AN_DIST"
		optimize "On"


project "Sandbox"
	location "Sandbox"
	kind "ConsoleApp"
	language "C++"

	targetdir("bin/" .. outputdir .. "/%{prj.name}")
	objdir("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"%{prj.name}/src/**.h",
		"%{prj.name}/src/**.cpp"
	}
	includedirs
	{
		"Ananas/vendor/spdlog/include",
		"Ananas/src"
	}
	links
	{
		"Ananas"
	}

	-- Windows settings
	filter "system:windows"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		buildoptions { "/utf-8" }
		defines
		{
			"AN_PLATFORM_WINDOWS"
		}

	-- macOS settings
	filter "system:macosx"
		cppdialect "C++17"
		staticruntime "On"
		systemversion "latest"
		buildoptions { "-finput-charset=UTF-8", "-fexec-charset=UTF-8" }
		defines
		{
			"AN_PLATFORM_MAC"
		}
		links
		{
			"Cocoa.framework",
			"IOKit.framework",
			"CoreFoundation.framework"
		}

	-- Configurations
	filter "configurations:Debug"
		defines "AN_DEBUG"
		symbols "On"
	filter "configurations:Release"
		defines "AN_RELEASE"
		optimize "On"
	filter "configurations:Dist"
		defines "AN_DIST"
		optimize "On"
