{ config, lib, pkgs, ... }:

let
  pwndbg-flake = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "pwndbg";
    repo = "pwndbg";
    rev = "main";
    sha256 = lib.fakeHash;
  }) {};

in {
  home.packages = [ pwndbg-flake ];
}