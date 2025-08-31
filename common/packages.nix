{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # TUI
    helix gitui ranger gdu bottom
    # CLI
    neofetch bat eza rm-improved duf xcp less codex
    # network
    curl wget openssh
  ];
}
