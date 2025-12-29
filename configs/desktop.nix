{ config, pkgs, pkgsStable, ... }:
{
  home.packages = with pkgs; [
    google-chrome
    kitty
    vscode
    antigravity
    gitkraken
    obsidian
  ] ++ [ pkgsStable.termius ];
}
