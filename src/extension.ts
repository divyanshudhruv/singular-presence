import * as vscode from "vscode";

/**
 * Extension specifically designed for the Discord RTC View and Discord status integration.
 * This tool automates typing to keep a particular file in focus and update Discord status.
 */

let isTyping = false;
let interval: NodeJS.Timeout | undefined;
let hasStartedContent = false;

/**
 * Function to add initial techy content and heading for Discord RPC
 */
async function addInitialContent() {
  const editor = vscode.window.activeTextEditor;
  if (!editor) return;

  const timestamp = new Date().toISOString();

  const initialContent = `discord-rpc-connection-established@[${timestamp}]`;

  const position = new vscode.Position(0, 0);
  await editor.edit((editBuilder) => {
    editBuilder.insert(position, initialContent);
  });

  hasStartedContent = true;
}

/**
 * Function to simulate typing for the Discord RTC active session.
 * This ensures the editor remains active and updates the Discord Presence.
 */
async function typeHello() {
  if (!isTyping) return;

  const editor = vscode.window.activeTextEditor;
  if (!editor) return;

  if (!hasStartedContent) {
    await addInitialContent();
    return;
  }

  const text = "hello ";
  const position = editor.selection.active;

  await editor.edit((editBuilder) => {
    editBuilder.insert(position, text);
  });
}

/**
 * Activates the command to toggle the Discord-linked auto-typer.
 */
export function activate(context: vscode.ExtensionContext) {
  const disposable = vscode.commands.registerCommand(
    "singular-presence.toggle",
    () => {
      if (isTyping) {
        isTyping = false;
        if (interval) {
          clearInterval(interval);
          interval = undefined;
        }
        vscode.window.showInformationMessage(
          "Singular Presence: Auto Typer OFF",
        );
      } else {
        isTyping = true;
        hasStartedContent = false;
        interval = setInterval(typeHello, 500); // Trigger every 0.5s for Discord heartbeat
        vscode.window.showInformationMessage(
          "Singular Presence: Auto Typer ON (RPC Connection Established)",
        );
      }
    },
  );

  context.subscriptions.push(disposable);
}

/**
 * Clean up the typing process and Discord activity on deactivation.
 */
export function deactivate() {
  isTyping = false;
  if (interval) {
    clearInterval(interval);
    interval = undefined;
  }
}
