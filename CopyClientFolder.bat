@echo off
title Send client folder to a workstation
cls
echo 1.Copy folder to WS
echo 2.Exit
echo.

choice /c 12 /m "Enter your choice:"

if errorlevel 2 GOTO Exit
if errorlevel 1 GOTO CopyClientFolder

:CopyClientFolder
echo Please input the workstation number
set /p input=""
cls
echo client folder will be copied to %input%
xcopy D:\Nirvik\client \\%input%\c$\windows\temp\client /E /H /C /I
GOTO End

:Exit
pause

:End
