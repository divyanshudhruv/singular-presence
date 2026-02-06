import * as vscode from "vscode";
import { TypingManager } from "./typing";
import { COMMAND_ID, MESSAGES } from "./config";
import { showInfoMessage } from "./utils";

let typingManager: TypingManager;

export function activate(context: vscode.ExtensionContext) {
  typingManager = new TypingManager();

  const disposable = vscode.commands.registerCommand(COMMAND_ID, () => {
    if (typingManager.isActive) {
      typingManager.stop();
      showInfoMessage(MESSAGES.OFF);
    } else {
      typingManager.start();
      showInfoMessage(MESSAGES.ON);
    }
  });

  context.subscriptions.push(disposable);
}

export function deactivate() {
  if (typingManager) {
    typingManager.stop();
  }
}
