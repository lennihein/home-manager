{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    userName = "Lenni Hein";
    userEmail = "git@lennihein.com";
    extraConfig = {
      color.ui = "auto";
      alias.st = "status";
      alias.co = "checkout";
      alias.br = "branch";
      alias.cm = "commit";
    };
  };
}
