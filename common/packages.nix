{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    neofetch
    ranger
    bat
    gdb
    eza
    rm-improved
    ripgrep
    gitui
    curl wget
  ];
}
