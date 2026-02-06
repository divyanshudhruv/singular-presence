@echo off
REM Universal deploy script - Works on Windows, macOS, Linux, WSL

setlocal enabledelayedexpansion

echo 🚀 Deploying Singular Presence Extension...


REM Detect OS and set appropriate commands
set OS=unknown
if "%OS%"=="Windows_NT" (
    set OS=windows
    set MKDIR_CMD=mkdir
    set COPY_CMD=copy
    set NODE_CMD=node
) else (
    set OS=unix
    set MKDIR_CMD=mkdir -p
    set COPY_CMD=cp
    set NODE_CMD=node
)


echo 🖥️  Deploying on: %OS%

REM Check if .vsix file exists
if not exist *.vsix (
    echo 📦 Building extension first...
    call scripts\build.cmd
)


REM Get version from package.json
for /f "tokens=*" %%i in ('%NODE_CMD% -p "require('./package.json').version"') do set VERSION=%%i
set EXTENSION_NAME=singular-presence-%VERSION%.vsix

echo 📦 Extension version: %VERSION%
echo 📦 Package name: %EXTENSION_NAME%

REM Create release directory
if not exist release %MKDIR_CMD% release

REM Copy extension to release
%COPY_CMD% *.vsix "release\%EXTENSION_NAME%"


echo ✅ Extension ready for deployment!
echo 📁 Location: release\%EXTENSION_NAME%
echo.
echo 📋 Next steps:
echo    1. Upload to VS Code Marketplace
echo    2. Create GitHub Release
echo    3. Update documentation
pause
