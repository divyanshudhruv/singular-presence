@echo off
REM Universal build script - Works on Windows, macOS, Linux, WSL

setlocal enabledelayedexpansion

echo 🔨 Building Singular Presence Extension...

REM Detect OS and set appropriate commands
set OS=unknown
if "%OS%"=="Windows_NT" (
    set OS=windows
    set RM_CMD=del /s /q
    set RMDIR_CMD=rmdir /s /q
    set MKDIR_CMD=mkdir
    set COPY_CMD=copy
) else (
    set OS=unix
    set RM_CMD=rm -f
    set RMDIR_CMD=rm -rf
    set MKDIR_CMD=mkdir -p
    set COPY_CMD=cp
)

echo 🖥️  Building on: %OS%

REM Clean previous build
echo 🧹 Cleaning previous build...
if exist out %RMDIR_CMD% out
if exist dist %RMDIR_CMD% dist
%RM_CMD% *.vsix 2>nul

REM Install dependencies
echo 📦 Installing dependencies...
call npm install

REM Compile TypeScript
echo ⚡ Compiling TypeScript...
call npm run compile

REM Package extension
echo 📦 Packaging extension...
call npm run package

echo ✅ Build complete!
echo 📁 Extension package: *.vsix
pause
