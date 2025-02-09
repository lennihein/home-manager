{ config, pkgs, ... }:
{
  nix = {
    package = lib.mkDefault pkgs.nix;  # Lower priority
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
}
