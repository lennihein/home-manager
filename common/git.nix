{ config, pkgs, ... }:
{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Lenni Hein";
        email = "git@lennihein.com";
      };
      color.ui = "auto";
      alias.st = "status";
      alias.co = "checkout";
      alias.br = "branch";
      alias.cm = "commit";
    };
  };
}
