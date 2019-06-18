@echo off

REM https://github.com/dotnet/core-sdk/blob/master/eng/setbuildinfo.bat

setlocal

set Architecture=%1
set Config=%2

if "%AdditionalBuildParameters%" == "$(_AdditionalBuildParameters)" (
    REM Prevent the literal "$(_AdditionalBuildParameters)" to be passed to the build script
    ECHO Setting AdditionalBuildParameters to empty
    ECHO ##vso[task.setvariable variable=AdditionalBuildParameters]
) ELSE (
    ECHO AdditionalBuildParameters is already set to: %AdditionalBuildParameters%
)

if /I "%SYSTEM_TEAMPROJECT%" == "Public" (
    ECHO Public CI
    SET SignType=test
) ELSE (
    ECHO Not public CI
    SET SignType=real
)
ECHO ##vso[task.setvariable variable=SignType]%SignType%

IF /I "%Architecture:~0,3%"=="ARM" (
    ECHO ARM
    ECHO ##vso[task.setvariable variable=TestParameter]
    ECHO ##vso[task.setvariable variable=RunTests]false
) ELSE (
    ECHO NOT ARM
    ECHO ##vso[task.setvariable variable=TestParameter]-test
    ECHO ##vso[task.setvariable variable=RunTests]true
)

ECHO ##vso[task.setvariable variable=SignBuildParameters]-sign /p:DotNetSignType=%SignType%
