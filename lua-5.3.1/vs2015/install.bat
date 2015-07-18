@echo off
        :: ========================
        :: file build.cmd
        :: ========================
        setlocal
        :: you may change the following variable's value
        :: to suit the downloaded version
        set lua_version=5.3.1

        set work_dir=%~dp0
        :: Removes trailing backslash
        :: to enhance readability in the following steps
        set work_dir=%work_dir:~0,-1%
        set lua_install_dir=%work_dir%\lua
        set lua_build_dir=..


        :: create a clean "binary" installation
        mkdir %lua_install_dir%
        mkdir %lua_install_dir%\doc
        mkdir %lua_install_dir%\bin
        mkdir %lua_install_dir%\include

        copy %lua_build_dir%\doc\*.* %lua_install_dir%\doc\*.*
        copy %lua_build_dir%\vs2015\Debug\*.exe %lua_install_dir%\bin\*.*
        copy %lua_build_dir%\src\luaconf.h %lua_install_dir%\include\*.*
        copy %lua_build_dir%\src\lua.h %lua_install_dir%\include\*.*
        copy %lua_build_dir%\src\lualib.h %lua_install_dir%\include\*.*
        copy %lua_build_dir%\src\lauxlib.h %lua_install_dir%\include\*.*
        copy %lua_build_dir%\src\lua.hpp %lua_install_dir%\include\*.*


        %lua_install_dir%\bin\lua.exe -e"print [[Hello!]];print[[Simple Lua test successful!!!]]"

        echo.

        pause