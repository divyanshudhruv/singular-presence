# Universal Scripts Directory

This directory contains cross-platform scripts that work on **Windows, macOS, Linux, and WSL**.

## Universal Scripts (.cmd)

All scripts are designed to work across platforms by detecting the operating system and using appropriate commands.

### 🔧 `setup.cmd`
Initial setup for the extension development environment.
- **Cross-platform OS detection** (Windows/macOS/Linux/WSL)
- Checks for Node.js and npm
- Installs dependencies
- Installs VS Code Extension CLI
- Creates initial build

### 🚀 `dev.cmd`
Start development environment with watch mode.
- **Automatic OS detection**
- Installs dependencies if needed
- Runs TypeScript compiler in watch mode
- Monitors for file changes

### 🔨 `build.cmd`
Build the extension for production.
- **Cross-platform file operations**
- Cleans previous build artifacts
- Installs dependencies
- Compiles TypeScript
- Packages extension as .vsix

### 🧪 `test.cmd`
Run tests and validation.
- **Universal error handling**
- Installs dependencies
- Checks TypeScript compilation
- Runs unit tests if available

### 🧹 `clean.cmd`
Clean build artifacts and cache files.
- **OS-optimized commands**
- Removes build directories (out/, dist/)
- Removes .vsix files
- Removes cache and temporary files

### 🚀 `deploy.cmd`
Prepare extension for deployment.
- **Cross-platform deployment**
- Builds extension if needed
- Creates release directory
- Copies extension with versioned name

## Usage

### Single Command for All Platforms
```cmd
# Windows (Command Prompt/PowerShell)
scripts\setup.cmd
scripts\dev.cmd
scripts\build.cmd
scripts\test.cmd
scripts\clean.cmd
scripts\deploy.cmd

# macOS/Linux/WSL (Terminal)
./scripts/setup.cmd
./scripts/dev.cmd
./scripts/build.cmd
./scripts/test.cmd
./scripts/clean.cmd
./scripts/deploy.cmd
```

## Platform Detection

The scripts automatically detect your environment:
- **Windows**: Uses `del`, `rmdir`, `copy` commands
- **macOS/Linux**: Uses `rm`, `mkdir`, `cp` commands  
- **WSL**: Detected as Linux with Windows compatibility

## Quick Start

```cmd
# Setup (run once)
scripts\setup.cmd

# Development
scripts\dev.cmd

# Production build
scripts\build.cmd

# Deploy
scripts\deploy.cmd
```