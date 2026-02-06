export interface TypingConfig {
  interval: number;
  text: string;
  enabled: boolean;
}

export interface DiscordStatus {
  connected: boolean;
  lastActivity: Date | null;
}

export interface ExtensionState {
  isTyping: boolean;
  interval: NodeJS.Timeout | undefined;
  hasStartedContent: boolean;
  config: TypingConfig;
  discordStatus: DiscordStatus;
}
