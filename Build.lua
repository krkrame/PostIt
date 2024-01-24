workspace "NoDependents App Project"
   
   --remove unneeded configs
   configurations { 
      
      "Debug32", "Debug64", "Release32", "Release64", "Dist32", "Dist64",

   }
   
   filter "configurations:*64"
      architecture "x64"

   filter "configurations:*32"
      architecture "x86"
   
   --adjust to match project name in App/Build_App.lua file
   startproject "App_Name"

   -- Workspace-wide build options for MSVC
   filter "system:windows"
      buildoptions { "/EHsc", "/Zc:preprocessor", "/Zc:__cplusplus" }

OutputDir = "%{cfg.system}-%{cfg.architecture}/%{cfg.buildcfg}"

include "App/Build-App.lua" --adjust if directory name and/or lua filename get changed


