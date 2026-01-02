{ config, pkgs, pwndbg, ... }:
{
  home.packages = with pkgs; [
    # TUI
    helix gitui ranger gdu bottom fastfetch
    # CLI
    bat eza rm-improved duf xcp less codex gemini-cli-bin gh todoist
    # network
    curl wget
    # debug
    pwndbg
  ];
}
