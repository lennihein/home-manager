{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    ghidra gitkraken meld vscode obsidian termius
  ];
}
