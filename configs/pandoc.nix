{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    pandoc
    tectonic
  ];
}
