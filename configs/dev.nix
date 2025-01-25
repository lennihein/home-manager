{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    ghidra gitkraken howl
  ];
}
