import * as vscode from "vscode";
import {
  formatDiscordContent,
  createTimestamp,
  insertTextAtPosition,
} from "./utils";

export async function addInitialDiscordContent(): Promise<void> {
  const editor = vscode.window.activeTextEditor;
  if (!editor) return;

  const timestamp = createTimestamp();
  const content = formatDiscordContent(timestamp);
  const position = new vscode.Position(0, 0);

  await insertTextAtPosition(content, position);
}

export async function simulateTyping(text: string): Promise<void> {
  const editor = vscode.window.activeTextEditor;
  if (!editor) return;

  const position = editor.selection.active;
  await insertTextAtPosition(text, position);
}
