import { simulateTyping, addInitialDiscordContent } from "./discord";
import { DEFAULT_CONFIG } from "./config";

export class TypingManager {
  private isTyping = false;
  private interval: NodeJS.Timeout | undefined;
  private hasStartedContent = false;

  start(): void {
    if (this.isTyping) return;

    this.isTyping = true;
    this.hasStartedContent = false;

    this.interval = setInterval(() => {
      this.typeLoop();
    }, DEFAULT_CONFIG.interval);
  }

  stop(): void {
    this.isTyping = false;
    if (this.interval) {
      clearInterval(this.interval);
      this.interval = undefined;
    }
  }

  private async typeLoop(): Promise<void> {
    if (!this.isTyping) return;

    if (!this.hasStartedContent) {
      await addInitialDiscordContent();
      this.hasStartedContent = true;
      return;
    }

    await simulateTyping(DEFAULT_CONFIG.text);
  }

  get isActive(): boolean {
    return this.isTyping;
  }
}
