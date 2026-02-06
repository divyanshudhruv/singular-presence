import * as vscode from "vscode";
import { DISCORD_RPC_PREFIX } from "./config";

export function getActiveEditor(): vscode.TextEditor | undefined {
  return vscode.window.activeTextEditor;
}

export function showInfoMessage(message: string): void {
  vscode.window.showInformationMessage(message);
}

export function createTimestamp(): string {
  return new Date().toISOString();
}

export function formatDiscordContent(timestamp: string): string {
  return `${DISCORD_RPC_PREFIX}@[${timestamp}]`;
}

export async function insertTextAtPosition(
  text: string,
  position?: vscode.Position,
): Promise<boolean> {
  const editor = getActiveEditor();
  if (!editor) return false;

  const insertPosition = position || editor.selection.active;

  return await editor.edit((editBuilder) => {
    editBuilder.insert(insertPosition, text);
  });
}

export function isValidEditor(editor: vscode.TextEditor | undefined): boolean {
  return editor !== undefined;
}
