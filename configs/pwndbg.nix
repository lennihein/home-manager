{ config, lib, pkgs, ... }:
  
  let
    pwndbg-flake = pkgs.callPackage (pkgs.fetchFromGitHub {
          owner = "pwndbg";
          repo = "pwndbg";
          rev = "master";
          sha256 = "sha256-75C2SswY93LF574xto5m75BpFJVMfoFQMJIP9v261ZQ=";
    }) {};
in {
    home.packages = [ pwndbg-flake ];
  }