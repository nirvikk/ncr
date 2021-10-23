@echo off
title Send client folder to a workstation
cls
echo Please input the workstation number
set /p input=""
cls
echo client folder will be copied to %input%
xcopy D:\Nirvik\client \\%input%\c$\windows\temp\client /E /H /C /I

pause
