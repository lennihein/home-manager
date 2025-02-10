{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    ghidra gitkraken howl meld vscode obsidian
    termius
  ];
}
