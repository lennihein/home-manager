{ config, pkgs, ... }:
{
  environment.sessionVariables = {
    EDITOR = "vim";
    BROWSER = "google-chrome-stable";
    TERMINAL = "kitty";
  };
}
