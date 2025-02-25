{ config, lib, pkgs, ... }:
  
  let
    pwndbg-flake = pkgs.callPackage (pkgs.fetchFromGitHub {
          owner = "pwndbg";
          repo = "pwndbg";
          rev = "master";
          sha256 = "sha256-OcwULIZcWOC1FNGa0SNGtyMyfbwTsBj17LBPpGOZL78=";
    }) {};
in {
    home.packages = [ pwndbg-flake ];
  }
