{ config, pkgs, pkgsStable, ... }:
{
  home.packages = with pkgs; [
    ghidra gitkraken meld vscode obsidian
  ] ++ [ pkgsStable.termius ];
}
