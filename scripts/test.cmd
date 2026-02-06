@echo off
REM Universal test script - Works on Windows, macOS, Linux, WSL

setlocal enabledelayedexpansion

echo 🧪 Running tests for Singular Presence Extension...

REM Detect OS
set OS=unknown
if "%OS%"=="Windows_NT" (
    set OS=windows
) else (
    set OS=unix
)

echo 🖥️  Testing on: %OS%

REM Install dependencies if needed
if not exist node_modules (
    echo 📦 Installing dependencies...
    call npm install
)

REM Run TypeScript compilation check
echo 🔍 Checking TypeScript compilation...
call npx tsc --noEmit

if %errorlevel% neq 0 (
    echo ❌ TypeScript compilation failed
    pause
    exit /b 1
)

echo ✅ TypeScript compilation successful

REM Run tests if they exist
if exist test (
    echo 🧪 Running unit tests...
    call npm test
) else (
    echo ℹ️  No test directory found
)

echo ✅ Test complete!
pause
