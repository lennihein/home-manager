{ config, pkgs, ... }:
{
  imports = [
    ./pwndbg.nix
  ];
  home.packages = with pkgs; [
    ghidra gitkraken meld vscode obsidian termius
  ];
}
