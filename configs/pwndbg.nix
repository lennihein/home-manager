# pwndbg.nix
{ config, pkgs, ... }:

let
  pwndbg = import (builtins.fetchTarball {
    url = "https://github.com/pwndbg/pwndbg/archive/refs/tags/2025.01.20.tar.gz";
    sha256 = "0hgzq6fay13c3b06yxl9c3wmly0s48dhp6z25yzwvakxw03k5anr"; # Replace with the actual hash
  }) { };
in
{
  home.file.".gdbinit" = {
    source = ''
      source ${pwndbg}/gdbinit.py
    '';
    mode = "0644";
  };

  home.users.lenni = {
    environment.variables = {
      GDBINIT = pkgs.writeText "gdbinit" ''
        source ${pwndbg}/gdbinit.py
      '';
    };
  };

  home.packages = with pkgs; [
    gdb
    pwndbg
  ];
}