@echo off
REM Universal clean script - Works on Windows, macOS, Linux, WSL

setlocal enabledelayedexpansion

echo 🧹 Cleaning Singular Presence Extension...

REM Detect OS and set appropriate commands
set OS=unknown
if "%OS%"=="Windows_NT" (
    set OS=windows
    set RM_CMD=del /s /q
    set RMDIR_CMD=rmdir /s /q
    set FIND_CMD=find
) else (
    set OS=unix
    set RM_CMD=rm -f
    set RMDIR_CMD=rm -rf
    set FIND_CMD=find
)

echo 🖥️  Cleaning on: %OS%


REM Remove build artifacts
echo 🗑️  Removing build artifacts...
if exist out %RMDIR_CMD% out
if exist dist %RMDIR_CMD% dist
%RM_CMD% *.vsix 2>nul

REM Remove cache files
echo 🗑️  Removing cache files...
if exist .nyc_output %RMDIR_CMD% .nyc_output
if exist coverage %RMDIR_CMD% coverage
%RM_CMD% *.lcov 2>nul


REM Remove temporary files
echo 🗑️  Removing temporary files...
if "%OS%"=="windows" (
    %FIND_CMD% . -name "*.tmp" -delete 2>nul
    %FIND_CMD% . -name "*.log" -delete 2>nul
    %FIND_CMD% . -name ".DS_Store" -delete 2>nul
) else (
    %FIND_CMD% . -name "*.tmp" -delete 2>/dev/null
    %FIND_CMD% . -name "*.log" -delete 2>/dev/null
    %FIND_CMD% . -name ".DS_Store" -delete 2>/dev/null
)

echo ✅ Clean complete!
pause
