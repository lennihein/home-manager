{ config, pkgs, pkgsStable, ... }:
{
  home.packages = with pkgs; [
    ghidra gitkraken meld vscode obsidian antigravity
  ] ++ [ pkgsStable.termius ];
}
