{
  config, lib, pkgs,
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
          rev = "master";
          sha256 = "sha256-75C2SswY93LF574xto5m75BpFJVMfoFQMJIP9v261ZQ=";
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