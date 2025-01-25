{ config, pkgs, ... }:
{
  home.file = {
    
    ".gdbinit".text = ''
      source /usr/share/pwndbg/gdbinit.py
    '';

    ".config/bat/config".text = ''
      --theme="Dracula"
      --style="numbers,changes,header"
    '';

    ".config/starship.toml".source = ../files/starship.toml;

    ".config/helix/config.toml".source = ../files/helix.toml;

    ".config/neofetch/config.conf".source = ../files/neofetch.conf;
  };
}
