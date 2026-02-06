# Singular Presence
A professional VS Code extension that provides automated typing capabilities for focusing on a single file and updating Discord status.

## Features

- **Auto Typing**: Intelligent text generation and typing simulation
- **Toggle Control**: Easy on/off functionality with keyboard shortcut
- **Seamless Integration**: Works naturally within your VS Code environment

## Installation

1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Click on 3 dots on top right
4. Click on "Install from VSIX"
5. Build the .vsix file from `/out` or `/src` folder
6. Install the .vsix file

Or install from the command line:

```bash
code --install-extension singular-presence
```

## Usage

### Command Palette

1. Open Command Palette (Ctrl+Shift+P)
2. Type "Singular Presence: Toggle Auto Typer"
3. Press Enter to execute

## Extension Settings

This extension contributes the following settings:

* `singularPresence.enabled`: Enable/disable the extension (default: true)

### Development Setup

1. Clone this repository
2. Install dependencies: `npm install`
3. Compile the `/src` folder: `npm run compile`
4. Run in development: Press F5 in VS Code

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

- 🐛 [Report a Bug](https://github.com/divyanshudhruv/singular-presence/issues)
- 💡 [Feature Request](https://github.com/divyanshudhruv/singular-presence/issues)

## Scripts

For build automation and development workflows, see the [scripts directory](./scripts/README.md).

- 🚀 [Setup Environment](./scripts/setup.cmd)
- 🔨 [Build Extension](./scripts/build.cmd)
- 🧪 [Run Tests](./scripts/test.cmd)
- 🧹 [Clean Build](./scripts/clean.cmd)
- 📦 [Deploy Extension](./scripts/deploy.cmd)
- 🚧 [Development Mode](./scripts/dev.cmd)
- ✅ [Run Tests](./scripts/test.cmd)

