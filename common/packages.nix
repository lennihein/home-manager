{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # TUI
    gdb helix gitui ranger gdu bottom
    # CLI
    neofetch bat eza rm-improved duf xcp less
    # network
    curl wget
  ];
}
