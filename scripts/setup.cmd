@echo off
REM Universal setup script - Works on Windows, macOS, Linux, WSL

setlocal enabledelayedexpansion

echo 🔧 Setting up Singular Presence Extension...

REM Detect OS
set OS=unknown
if "%OS%"=="Windows_NT" set OS=windows
if exist "/bin/bash" (
    if exist "/proc/version" (
        type /proc/version | findstr -i microsoft >nul
        if !errorlevel! equ 0 set OS=wsl
    ) else (
        set OS=unix
    )
)

echo 🖥️  Detected OS: %OS%

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Node.js is not installed. Please install Node.js first.
    pause
    exit /b 1
)

echo ✅ Node.js version:
node --version

REM Check if npm is installed
npm --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ npm is not installed. Please install npm first.
    pause
    exit /b 1
)

echo ✅ npm version:
npm --version

REM Install dependencies
echo 📦 Installing dependencies...
call npm install

REM Install VS Code Extension CLI globally
echo 🔧 Installing VS Code Extension CLI...
call npm install -g vsce

REM Create initial build
echo 🔨 Creating initial build...
call npm run compile

echo ✅ Setup complete!
echo.
echo 🚀 Ready to develop:
echo    • Run 'scripts\dev.cmd' for development
echo    • Run 'scripts\build.cmd' for production build
echo    • Run 'scripts\test.cmd' for testing
pause
