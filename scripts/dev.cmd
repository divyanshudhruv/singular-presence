@echo off
REM Universal development script - Works on Windows, macOS, Linux, WSL

setlocal enabledelayedexpansion

echo 🚀 Starting development environment...

REM Detect OS and set appropriate commands
set OS=unknown
if "%OS%"=="Windows_NT" (
    set OS=windows
    set RM_CMD=del /s /q
    set MKDIR_CMD=mkdir
    set COPY_CMD=copy
) else (
    set OS=unix
    set RM_CMD=rm -rf
    set MKDIR_CMD=mkdir -p
    set COPY_CMD=cp
)

echo 🖥️  Running on: %OS%


REM Install dependencies if needed
if not exist node_modules (
    echo 📦 Installing dependencies...
    call npm install
)

REM Start TypeScript compiler in watch mode
echo ⚡ Starting TypeScript compiler in watch mode...
call npm run watch

echo 👀 Watching for changes... Press Ctrl+C to stop
pause
