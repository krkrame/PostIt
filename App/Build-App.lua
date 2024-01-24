project "App_Name" --make sure name matches startproject variable in ../Build.lua
   
    language "C++"
    cppdialect "C++20"
    kind "ConsoleApp"   --or "WindowedApp if applicable"
    targetdir "Binaries/%{cfg.buildcfg}"
    staticruntime "off"

    --add other desired filetypes (.hpp, .c) here
    files { "Source/**.h", "Source/**.cpp" }

    --project include directory, allows #include "header"
    includedirs
    {
        "Source"
    }

    --lib include directories, allows #include <header> or "header"
    externalincludedirs 
    { 
        -- lib include directory eg. LinkLibDir .. "SDL2-2.26.5/include"
    }

    targetdir ("../Binaries/" .. OutputDir .. "/%{prj.name}")
    objdir ("../Binaries/Intermediates/" .. OutputDir .. "/%{prj.name}")

    filter "system:windows"
        systemversion "latest"
        defines { }

    filter "configurations:Debug*"
        defines { "DEBUG" }
        runtime "Debug"
        symbols "On"

    filter "configurations:Release*"
        defines { "RELEASE" }
        runtime "Release"
        optimize "On"
        symbols "On"

    filter "configurations:Dist*"
        defines { "DIST" }
        runtime "Release"
        optimize "On"
        symbols "Off"

    filter "configurations:*64"
        libdirs { }     -- x64 library directory to define eg { LinkLibDir .. "SDL2_2.26.5/lib/x64" } 
        links { }       -- specific lib file name w/o extension eg { "SDL2" }

    filter "configurations:*32"
        libdirs { }     -- x86 library directory to define eg { LinkLibDir .. "SDL2_2.26.5/lib/x86" } 
        links { }       -- specific lib file name w/o extension { "SDL2" }
