{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # TUI
    gdb helix gitui ranger
    # CLI
    neofetch bat eza rm-improved duf xcp
    # network
    curl wget
  ];
}
