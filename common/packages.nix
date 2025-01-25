{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    # TUI
    gdb helix gitui ranger
    # CLI
    neofetch bat eza rm-improved 
    # network
    curl wget
  ];
}
