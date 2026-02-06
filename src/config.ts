import { TypingConfig } from "./types";

export const DEFAULT_CONFIG: TypingConfig = {
  interval: 500,
  text: "hello ",
  enabled: true,
};

export const COMMAND_ID = "singular-presence.toggle";
export const EXTENSION_NAME = "Singular Presence";

export const MESSAGES = {
  ON: `${EXTENSION_NAME}: Auto Typer ON (RPC Connection Established)`,
  OFF: `${EXTENSION_NAME}: Auto Typer OFF`,
};

export const DISCORD_RPC_PREFIX = "discord-rpc-connection-established";
