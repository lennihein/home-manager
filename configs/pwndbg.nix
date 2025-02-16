pwndbg.nix Home Manager Module

{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit (lib) mkEnableOption mkIf mkOption types;
in {
  options.programs.pwndbg = {
    enable = mkEnableOption "pwndbg";

    package = mkOption {
      type = types.package;
      default = pkgs.callPackage
        (pkgs.fetchFromGitHub {
          owner = "pwndbg";
          repo = "pwndbg";
          rev = "master"; # You might want to pin this to a specific commit
          sha256 = lib.fakeHash; # Replace this with the actual hash
        })
        {};
      description = "The pwndbg package to use";
    };
  };

  config = mkIf config.programs.pwndbg.enable {
    home.packages = [
      (pkgs.writeShellScriptBin "pwndbg" ''
        ${config.programs.pwndbg.package}/bin/pwndbg "$@"
      '')
    ];
  };
}