{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # TUI
    helix gitui ranger gdu bottom
    # CLI
    neofetch bat eza rm-improved duf xcp less codex gemini-cli gh
    # network
    curl wget openssh
  ];
}
