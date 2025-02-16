# pwndbg.nix
{ config, pkgs, ... }:

let
  pwndbg = import (builtins.fetchTarball {
    url = "https://github.com/pwndbg/pwndbg/archive/refs/heads/master.tar.gz";
  }) { };
in
{
  home.file.".gdbinit" = {
    source = ''
      source ${pwndbg}/gdbinit.py
    '';
    mode = "0644";
  };

  environment.variables.GDBINIT = "${pkgs.writeText "gdbinit" ''
    source ${pwndbg}/gdbinit.py
  ''}/gdbinit";

  home.packages = with pkgs; [
    gdb
    python3
    pwndbg
  ];
}