{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # TUI
    helix gitui ranger gdu bottom fastfetch
    # CLI
    bat eza rm-improved duf xcp less codex gemini-cli gh
    # network
    curl wget openssh
  ];
}
